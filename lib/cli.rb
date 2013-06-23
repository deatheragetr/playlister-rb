require './file_name_parser.rb'
require 'command_line_reporter'
require 'ap'

GENRES = Genre.all.collect {|genre| genre.name}
ARTISTS = Artist.all.collect {|artist| artist.name}
def artists
  artists = Artist.all.collect {|artist| "#{artist.name}: #{artist.songs_count} songs" }  
  artists.sort!
  artists.each {|artist| ap artist}
  select_artist
end

def genre
  genres = Genre.all.collect {|genre| "#{genre.name}: #{genre.songs.size} songs, #{genre.artists.size} artists"}
  genres.sort!
  genres.each {|genre| ap genre}
  select_genre
end

def select_genre
  input = command
  if GENRES.any? {|genre| genre == input}
    genre = Genre.all.select {|genre| genre == input}[0]
  else
    puts "What"
  end
end  

def select_artist
  input = command
  case input
  when "browse"
    browser
  else
    if ARTISTS.any? {|artist| artist.downcase == input}
      artist = Artist.all.select {|artist| artist.name.downcase == input}  
      songs = songs(artist)
      puts "#{artist.first.name}: #{songs}"
      select_song(songs)
    else
      puts "Sorry, try again, or type browse"
      select_artist
    end
  end
end

def select_song(songs)
  songs.downcase!
  input = command

  unless songs.scan(input).empty?
    puts "playing #{input}"
    puts "(you can type browse at any time :)"
    select_artist
  else
    puts "DO NOT RECOGNIZE"
    select_song
  end
end

def songs(artist)
  string = ""
  artist.first.songs.each {|song| string += "#{song.name}, "}
  string = string[0...-2]
end 

def command
  print ">>"
  input = gets.chomp.downcase.strip
  if input == 'exit'
    abort 
  end
  input
end

def intro
  puts "Welcome to the DeathRager Jukebox"
  browser
end

def browser
  puts "Browse by artists or genre"
  puts "(hint: type 'artists' or 'genre')"
  case command
  when "artists"
    puts "Type artist to see song options, or type browse to go back to browse :)"
    artists
  when "genre"
    genre
  else
    "Did not recognize command :("
  end
end
intro





