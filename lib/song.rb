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
    song = self.new
    @@all << song
    song
  end


def self.new_by_name(song_name)
  song = self.new
  song.name = song_name
  song
end

def self.create_by_name(song_name)
  song = self.new
  song.name = song_name
  @@all << song
    song
end

def self.find_by_name(song_name)
  @@all.find {|song| song.name == song_name}
end

def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create_by_name(song_name)
end

def self.alphabetical
  @@all.sort_by { |song| song.name }
end

def self.new_from_filename(song_name)
  song = self.new
  split_array = song_name.split(" - ")
  # split_array = ['Taylor Swift', 'Blank Space.mp3']
  song.artist_name = split_array[0]

  second_split = split_array[1].split(".mp3")
  # second_array = ['Blank Space']
  song.name = second_split[0]

  song
end

def self.create_from_filename(song_name)
  song = self.new
  split_array = song_name.split(" - ")
  # split_array = ['Taylor Swift', 'Blank Space.mp3']
  song.artist_name = split_array[0]

  second_split = split_array[1].split(".mp3")
  # second_array = ['Blank Space']
  song.name = second_split[0]

  @@all << song
end

def self.destroy_all
  @@all = []
end
end
#Song.new_by_name("Hello World")
