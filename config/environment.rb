ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
 :adapter => "sqlite3",
 :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)


require_all 'app'
# =======
# require 'bundler/setup'
# Bundler.require
#
# ENV['SINATRA_ENV'] ||= "development"
#
# ActiveRecord::Base.establish_connection(
#   :adapter => "sqlite3",
#   :database => "db/nyc#{ENV['SINATRA_ENV']}.sqlite"
# )
#
# Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../app/controllers", "*.rb")].each {|f| require f}
# >>>>>>> 427fdb5ccaf50aba4e49e417f42e81b3a58749c2
