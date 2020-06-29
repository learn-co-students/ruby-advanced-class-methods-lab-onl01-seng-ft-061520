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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    binding.pry
    unless self.find_by_name(name)
      self.create_by_name(name) 
    else
      self.find_by_name(name)
    end
  end
    
  def self.alphabetical
    self.all.sort_by { |song| song.name}.uniq
  end

  def self.new_from_filename(filename)
    song_array = filename.delete_suffix('.mp3').split(' - ')
    song = self.create_by_name(song_array[1])
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
