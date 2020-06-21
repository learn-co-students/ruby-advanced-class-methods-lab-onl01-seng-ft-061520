require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def initialize(name = "")
    @name = name
  end

  def save
    self.class.all << self
  end

  def self.create
    song_created = self.new
    self.all << song_created
    song_created
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)

    new_song = self.new
    new_song.name = song_name
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)

    if !find_by_name(song_name)
      create_by_name(song_name)
    end
    find_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end

    # self.all.sort do |song1, song2|
    #   song1.name <=> song2.name
    # end
  end

  def self.new_from_filename(filename)
# initializes a song and artist_name based on the filename format

    file_array = filename.split(".mp3")

    file_array = file_array.join
    file_array = file_array.split(" - ")
    artist = file_array[0]
    song_title = file_array[1]
    new_song = self.new

    new_song.name = song_title
    new_song.artist_name = artist

    new_song
  end

  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end




end
