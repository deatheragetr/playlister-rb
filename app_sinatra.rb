require 'sinatra/base'
require './lib/file_name_parser.rb'
require './add_new_artists.rb'
require 'debugger'

module StudentSite
  class App < Sinatra::Base

    get '/' do
      redirect to '/artists/index'
    end

    get '/artists/index' do
      @artists = Artist.all 
      erb :index
    end

    get '/artist/add_song/:name' do
      @name = params[:name]
      erb :add_song
    end

    post "/artist/add_song/:name" do
      params[:name] = params[:name].gsub('_', ' ')
      parse_params(params)
      redirect to "/artists/#{params[:name].gsub(' ', '_')}/sexy_html_high_five"
      end

    get '/artists/new' do
      File.read('./public/add_artist_form.html')
    end 

    post '/artists/new_artists' do
      parse_params(params)
      redirect to '/artists/index'
    end

    get '/artists/:name/sexy_html_high_five' do 
      @artist = Artist.find_by_name(params[:name].gsub('_', ' '))
      erb :artist
    end  

    get '/artists/songs/:song' do
      @song = Song.find_by_name(params[:song].gsub('_', ' '))
      erb :song
    end
  end
end