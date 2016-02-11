ENV["RACK_ENV"] ||="development"

require_relative 'models/link'
require 'sinatra/base'
require 'data_mapper'
require 'rubygems'
require 'tilt/erb'

class BookmarkManager < Sinatra::Base 

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do 
    Link.create(url: params[:url], title: params[:title])
    redirect to('/links')
  end
  
  run! if app_file == $0
end
# The directory used as a base for the application. By default, 
# this is assumed to be the directory containing the main application 
# file (:app_file setting). The root directory is used to construct 
# the default :public_folder and :views settings. A common idiom 
# is to set the :root setting explicitly in the main application 
# file as follows:

# set :root, File.dirname(__FILE__)