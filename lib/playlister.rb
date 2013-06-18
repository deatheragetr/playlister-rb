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

  def add_song(song)
    songs << song
    add_artist_to_genre(song) if song.genre
   end 

  def add_artist_to_genre(song)
    genre = song.genre 
    genre.artists << self unless genre.artists.include? self
  end

  def genres
   songs.collect {|song| song.genre}
  end
end


class Song
  attr_accessor :name
  attr_reader :genre, :artist
  def genre=(genre)
    genre.songs << self
    @genre = genre
  end
  def artist=(artist)
    @artist = artist 
  end
end 

class Genre
  attr_accessor :name, :songs, :artists

  @@genres = []

  def self.reset_genres
    @@genres = []
  end 
  def self.all
    @@genres
  end  

  def initialize
    @@genres << self
    self.songs = []
    self.artists = []
  end
end


