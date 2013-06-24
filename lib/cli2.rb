require_relative './file_name_parser.rb'
require 'ap'

GenreNames = Genre.all.map {|genre| genre.name.downcase}
ArtistNames = Artist.all.map {|artist| artist.name.downcase}
SongNames = Song.all.map {|song| song.name.downcase}

def artists
  Artist.all.each_with_index do |artist, index|
    ap "#{index + 1}. #{artist.name}: #{artist.songs_count} song(s)"
  end
end

def genres
  Genre.all.each_with_index do |genre, index|
    ap "#{index + 1}. #{genre.name}: #{genre.songs.size} song(s)"
  end
end

def songs
  Song.all.each_with_index do |song, index|
    ap "#{index + 1}. #{song.name} by #{song.artist.name} [#{song.genre.name}]"  
  end
end


def artist_songs(artist_name)
  artist = Artist.find_by_name(artist_name)
  puts ''
  ap "#{artist.name}:"
  artist.songs.each_with_index {|song, index| puts "\t #{index + 1}. #{song.name}" }
end

def genre_songs(genre_name)
  genre = Genre.find_by_name(genre_name)
  puts ''
  ap "#{genre.name}"
  genre.songs.each_with_index {|song, index| puts "\t #{index + 1}. #{song.name}"}
end

def select_song(song_name)
  if song = Song.find_by_name(song_name)
    ap "Playing #{song.name}. . ."
  else
    ap "Sorry don't think we have that one :("
  end
end

puts "Welcome to the DeathRager JukeBox"
puts ''
ap "You can select and play particular song by typing its name and hitting enter"
ap "You can see a list of all genres, artists, songs by typing genres, artists, or songs"
ap "To see a particular artist's or genre's songs you type the name of that genre or artist"
ap "You can also type exit at any time"


def command_parser(input)
  if input == "genres" || input == "songs" || input == "artists"
    send(input)
  elsif ArtistNames.include?(input)
    artist_songs(input)
  elsif GenreNames.include?(input)
    genre_songs(input)
  elsif SongNames.include?(input)
    select_song(input)
  elsif input == 'exit'
    puts "Adios!"
    abort
  else
    puts "Sorry Come Again?" 
  end  
end

def command_line
  while true   
    puts ''
    print "-->"
    input = gets.strip.downcase
    command_parser(input)
  end  
end

command_line

