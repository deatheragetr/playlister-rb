require 'sinatra/base'
require './lib/file_name_parser.rb'
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

    get '/whatever' do
      erb :song
    end

    get '/artists/:name/sexy_html_high_five' do 
      @artist = Artist.find_by_name(params[:name].gsub('_', ' '))
      erb :artist
    end  
  end
end