ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb :intro
  end

  get '/links' do
    @links = Link.all
    @user = current_user
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.new(params)
    session[:user_id] = user.id
    redirect '/links' unless user.nil?
  end

  get '/tags/:name' do
    tag = Tag.first(name: params['name'])
    @links = tag ? tag.links : []
    erb :tags
  end

  post '/links' do
    tags = params[:tag] ? params[:tag].split(', ') : []
    link = Link.new(url: params[:url], title: params[:title])
    tags.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect '/links'
  end

  helpers do
    def current_user
      User.first(id: session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
