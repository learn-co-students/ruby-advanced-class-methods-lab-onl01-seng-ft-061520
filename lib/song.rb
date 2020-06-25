require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    self.all << self.new
    @@all.last
  end
  
  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end
  
  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    self.all << song
    song
  end
  
  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    file = filename.split(".")
    file.pop
    file = file.join.split("-").join.split("  ")
    
    song = self.new
    song.name = file[1]
    song.artist_name = file[0]
    song
  end
  
  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
end
