class ApplicationController < Sinatra::Base
 configure do
    enable :sessions
    set :session_secret, "my_application_secret"
   set :public_folder, 'public'
   set :views, 'app/views'
 end

 helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find(session[:user_id])
    end

  end

end
