class PostController < ApplicationController

  get '/' do
    if logged_in?
      erb :'/feed'
    else
      redirect to '/signup'
    end
  end

  post '/create' do
    if params[:posts][:post_content].strip.empty?
      redirect to "/users/#{@user.id}"
    end
    @user = User.find_by(id: session[:user_id])
    @post = Post.create(params[:posts])
    if !params[:tags][:name].empty?
      @post.tags << Tag.create(name: params[:tags][:name])
    end
    @user.posts << @post
    @user.save
    redirect to "/users/#{@user.id}"
  end

  get "/posts/:id/edit" do
    @post = Post.find_by(id: params[:id])
    if current_user.id == @post.user.id
      erb :'/posts/edit'
    else
      redirect to "/users/#{@current_user.id}"
    end

  end

  delete "/posts/:id" do
    @user = current_user
    @user.posts.delete(params[:id])
    redirect to "/users/#{@user.id}"
  end

  patch "/posts/:id" do
    @post = Post.find_by(id: params[:id])
    @post.update(params[:posts])
    if !params[:tag][:name].empty?
      @post.tags << Tag.create(name: params[:tag][:name])
    end
    @post.save
    redirect to "/users/#{@post.user.id}"
  end

end
