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
    song_path.split('[').last.split(']').strip
  end  
end