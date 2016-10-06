class UserController < ApplicationController

  get '/signup' do
    if !session[:user_id]
      erb :'/users/new'
    else
      redirect "/users/#{current_user.id}"
    end
  end

  post '/signup' do
    binding.pry
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  end

  get '/users/:id' do
    if logged_in?
      @current_user = User.find_by(id: session[:user_id])
      @user = User.find_by(id: params[:id])
      erb :'/users/show'
    else
      @user = User.find_by(id: params[:id])
      redirect "/users/#{@user.id}"
    end
  end

  # get '/login' do
  #   if !session[:user_id]
  #     erb :'users/login'
  #   else
  #     redirect "/users/#{session[:user_id]}"
  #   end
  # end

  post '/login' do
    @user = User.find_by(user_name: params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.clear
    redirect '/signup'
  end


end
