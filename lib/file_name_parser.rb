require_relative './models/playlister.rb'
require 'ap'
require 'debugger'


songs_folder = Dir['./data/*']

def data_builder(song_path)
  artist_name = song_path.split('/').last.split('-').first.strip
  genre_name = song_path.split('[').last.split(']').first.strip
  song_name = song_path.split(' - ').last.split('[').first.strip
  artist = add_artist(artist_name)
  genre = add_genre(genre_name)
  add_song(song_name, genre, artist)
end  

def add_artist(artist_name)
  unless Artist.all.any? {|artist| artist.name == artist_name}
    artist = Artist.new 
    artist.name = artist_name
  else
    artist = Artist.all.select {|artist| artist.name == artist_name}[0]
  end
  artist
end

def add_genre(genre_name)
  unless Genre.all.any? {|genre| genre.name == genre_name }
    genre = Genre.new
    genre.name = genre_name
  else
    genre = Genre.all.select {|genre| genre.name == genre_name}[0]
  end
  genre
end

def songs_artist(song, artist)
  song.artist = artist
  song.artist.add_song(song)
end

def add_song(song_name, genre, artist)
  song = Song.new
  song.name = song_name
  song.genre = genre
  songs_artist(song, artist)
  song 
end

def collect_data(songs_folder)
  songs_folder.each do |record|
    data_builder(record)
  end
end

collect_data songs_folder


####A Few Simple Tests #####

# puts Artist.all.first.songs.first.name







