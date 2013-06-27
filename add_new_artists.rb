require './lib/file_name_parser.rb'

def delete_file(params_hash)
  artist = params_hash[:name]
  song = params_hash[:song]
  genre = params_hash[:genre]
  file_name = "#{artist} - #{song}[#{genre}].mp3"
  File.delete("./data/#{file_name}")
end


def parse_params(params_hash)
  artist = params_hash[:name]
  song = params_hash[:song]
  genre = params_hash[:genre]
  file_name = "#{artist} - #{song}[#{genre}].mp3"
  File.new("./data/#{file_name}", 'w')
  songs_folder = Dir['./data/*']
  collect_data songs_folder
end

