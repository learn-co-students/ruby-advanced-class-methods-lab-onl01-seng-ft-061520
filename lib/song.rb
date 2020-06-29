class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def Song.create
    song = self.new
    song.save
    song
  end
  
  def Song.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def Song.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def Song.find_by_name(name)
    song = self.all.select {|song| song.name == name}
    song[0]
  end
  
  def Song.find_or_create_by_name(name)
    if !find_by_name(name)
      create_by_name(name)
    else
      find_by_name(name)
    end
  end
  
  def Song.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end
  
  def Song.new_from_filename(filename)
    song_data = filename.sub!(/.mp3/,"").split(" - ")
    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end
  
  def Song.create_from_filename(filename)
    song_data = filename.sub!(/.mp3/,"").split(" - ")
    song = self.create
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end
  
  def Song.destroy_all
    self.all.clear
  end
end
