# File.open("out.txt", 'OPTION') {|f| f.write("write your stuff here") }

require 'erb'
require './lib/file_name_parser.rb'

index = ERB.new(File.read('./views/index.erb'))

File.open('index.html', "w+") do |f| 
  f.write(index.result)
end

artist_template = ERB.new(File.read('./views/artist.erb'))

Artist.all.each do |artist|
  File.open("./artists/#{artist.name}.html", "w+") do |f|
    f.write(artist_template.result(artist.get_binding))
  end
end