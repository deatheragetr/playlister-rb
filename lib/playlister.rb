class Artist
  attr_accessor :name, :songs
  @@artists = []

  def self.count
    @@artists.size
  end

  def self.reset_artists
    @@artists = []
  end

  def self.all
    @@artists
  end

  def initialize 
    @@artists << self
    self.songs = []
  end

  def songs_count
    songs.size
  end

  def add_song (song)
    songs << song

  def genres
   songs.collect {|song| song.genre}
  end

  end
  
  

end


class Song
attr_accessor :genre
end

class Genre
attr_accessor :name

end
