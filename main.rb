require 'rubygems'
require 'bundler/setup'

require "sinatra/activerecord"
require 'sinatra'

configure :development do
  require 'SQLite3'
end

require "prawn/labels"
require 'pry'

configure :production do
 db = URI.parse(ENV['DATABASE_URL'])
   ActiveRecord::Base.establish_connection(
     :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
     :host => db.host,
     :username => db.user,
     :password => db.password,
     :database => db.path[1..-1],
     :encoding => 'utf8'
 )
end

configure :development do
  set :database, {adapter: "sqlite3", database: "database/coffeering.db"}
end


require_relative "database/database_setup.rb"

require_relative "models/User.rb"
require_relative "models/Item.rb"
require_relative "models/Menu.rb"

require_relative "controllers/barista.rb"
require_relative "controllers/user.rb"

configure :development do
  DATABASE = SQLite3::Database.new("database/coffeering.db")
end


# DATABASE.results_as_hash = true

