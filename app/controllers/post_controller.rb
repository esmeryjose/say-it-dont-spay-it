class PostController < ApplicationController


  get '/' do
    erb :'/feed'
  end
end
