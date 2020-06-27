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
    song.save 
    #song.artist_name = artist_name
    #@@all << name[artist_name] 
    song 
  end 

  def self.new_by_name(new_song_added) 
    #instantiates song with name property 
    new_song = self.new 
    new_song.name = new_song_added
    new_song
  end 

  def self.create_by_name(new_song_added)
    new_song = self.new 
    new_song.name = new_song_added 
    new_song.save 
    new_song
  end 

  def self.find_by_name(song_name) 
    self.all.find{|song| song.name ==song_name}
    ### will return object or nil!!!
  end 

  def self.find_or_create_by_name(string_name_for_song)
    self.find_by_name(string_name_for_song) || self.create_by_name(string_name_for_song)
      
  
  end
  
  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(mp3_song)
    song = self.new 
    
    song_split = mp3_song.split(" - ")
    song.artist_name = song_split[0] 
    song.name = song_split[1].split(".mp3").join
    song
  #(/-|.mp3/)
  end 
  
  # regex: regular expressions, ex. phone number ; looks for specific symbols and exclude // 
  
  def self.create_from_filename(mp3_file)
    # hint: gsub : takes two arguments, one to remove, one to replace 
    song = self.create  
    
    song_split = mp3_file.split(" - ")
    song.artist_name = song_split[0] 
    song.name = song_split[1].split(".mp3").join
    song
    
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
    
   
  
  
end 