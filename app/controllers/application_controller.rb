
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do

    erb :new
  end
  
  get '/articles' do
   @articles = Article.all
    erb :index 
  end
  
  post '/articles' do
    @article = Article.create(params[:article])
    
    redirect to "/articles/#{@article.id}"
    
    end
  
  get '/articles/:id' do 
    @article = Article.find_by(id: params["id"])
    erb :show
  end
  
  get '/articles/:id/edit' do 
    @article = Article.find_by(id: params["id"])
    erb :edit
  end
  
  patch '/articles/:id' do 
    @article = Article.find_by(id: params["id"])
    @article.update(params[:article])
     
    redirect to "/articles/#{@article.id}"
  end
  
  delete '/articles/:id' do 
    @article = Article.find_by(id: params["id"])
    binding.pry
    @article.delete
  end
    
  
end
