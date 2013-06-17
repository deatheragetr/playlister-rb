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

  def intialize 
    @@artists << self
  end
end

