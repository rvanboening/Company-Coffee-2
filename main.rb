
require 'bundler/setup'

require "sinatra/activerecord"

require 'sinatra'
require 'pry'
require 'SQLite3'
require "prawn/labels"

require_relative "database_setup.rb"

require_relative "models/User.rb"
require_relative "models/Item.rb"
require_relative "models/Menu.rb"

require_relative "controllers/barista.rb"
require_relative "controllers/user.rb"
