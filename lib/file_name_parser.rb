require './playlister.rb'

songs_folder = Dir['../data/*']

def artists(songs_folder)
  artists = songs_folder.collect do |song_path|
    song_path.split('/').last.split('-').first.strip
  end
  artists
end

def songs(songs_folder)
  songs = songs_folder.collect do |song_path|
    song_path.split(' - ').last.split('[').first.strip
  end
  songs 
end 

def genre(songs_folder)
  genres = songs_folder.collect do |song_path|
    song_path.split('[').last.split(']').first.strip
  end 
  genres.uniq 
end

################################################################
# name is genre name
Genre.new.name = name unless Genre.all.any? {|genre| genre.name == name } #avoid duplication
## pass the following to song_instance.genre =
Genre.all.select {|genre| genre.name == genre_name}

##################################################################
def data_builder
  artist_name = song_path.split('/').last.split('-').first.strip
  genre_name = ong_path.split('[').last.split(']').first.strip
  song_name = song_path.split(' - ').last.split('[').first.strip
  add_artist(artist_name)
end  

def add_artist(artist_name)
  Artist.new.name = artist_name unless Artist.all.any? {|artist| artist.name == artist_name}
end

def add_genre(genre_name)
  Genre.new.name = genre_name unless Genre.all.any? {|genre| genre.name == genre_name }
end

def add_song(song_name)
end








