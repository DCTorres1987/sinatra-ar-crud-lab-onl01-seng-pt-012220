
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
    binding.pry
    erb :show
  end
  
  get '/articles/:id/edit' do 
    erb :edit
  end
  
  patch '/articles/:id' do 
   
  end
    
  
end
