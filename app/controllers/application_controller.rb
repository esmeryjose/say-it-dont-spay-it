class ApplicationController < Sinatra::Base
 configure do
    enable :sessions
    set :session_secret, "my_application_secret"
   set :public_folder, 'public'
   set :views, 'app/views'
 end
 
end
