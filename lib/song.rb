class Song
  attr_accessor :name 
   attr_reader :artist , :genre
  @@all = []
  extend Concerns::Findable

def initialize (name , artist = nil , genre = nil)
  self.name = name
  self.artist = artist if artist
  self.genre = genre if genre 
end

def self.all 
  @@all
end

def save
  @@all << self
end

def self.destroy_all
  @@all.clear
end 
  
def self.create(name )
  song = self.new(name)
  song.save
  song 
end 

 def artist=(artist)
        @artist = artist
        self.artist.add_song(self)
end

 def genre=(genre)
        @genre = genre
        genre.songs << self if !genre.songs.include?(self)
end

def self.find_by_name (name)
  self.all.detect{ |song| song.name==name}
end 

def self.find_or_create_by_name (name)
  if self.find_by_name (name)
    self.find_by_name (name)
  else
    song = self.create(name)
    song
  end
end 


end