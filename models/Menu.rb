# require 'pry'
# require 'SQLite3'
# require_relative "../database_setup"

class Menu<ActiveRecord::Base
end

#   attr_reader :drink_name
#
#   def initialize(options)
#     @drink_name =options["drink_name"]
#   end
#
#   # Public: #insert
#   # Inserts the drink into the database and provides it a user_id.
#   #
#   # Returns:
#   # Integer of the drink that was inserted into the database
#   #
#   # State Changes:
#   # Adds a drink to the menu
#
#   def insert
#     sql_command="INSERT INTO menu (drink_name) VALUES ('#{@drink_name}')"
#     DATABASE.execute(sql_command)
#
#     @user_id = DATABASE.last_insert_row_id
#   end
#
#   # Public: #fetch_drinks
#   # fetches all drinks from the databse
#   #
#   #
#   # Returns:
#   # An array of menu or objects = drink_id and drink_name.
#   #
#   # State Changes:
#   # Adds a menu object to the menu record.
#   # This will create the buttons a user can choose for the menu
#   #
#   def self.fetch_drinks
#     menu_drinks=DATABASE.execute("SELECT * FROM menu")
#     array_of_menu_drinks = []
#     menu_drinks.each do |hash|
#       array_of_menu_drinks << self.new(hash)
#     end
#     return array_of_menu_drinks
#   end
#
# end
#
# # binding.pry