# require 'pry'
# require 'SQLite3'
# require_relative "../database_setup"

class Menu
  attr_reader :drink_name
  
  def initialize(options)
    @drink_name    =options["drink_name"]
  end
  
  # Public: #insert
  # Inserts the drink into the database and provides it a user_id. 
  #
  # Parameters:
  # NA. 
  #
  # Returns:
  # Integer of the drink that was inserted into the database
  #
  # State Changes:
  # Adds a drink to the menu
  
  def insert
    sql_command="INSERT INTO menu (drink_name) VALUES ('#{@drink_name}')"
    DATABASE.execute(sql_command)
    
    @user_id = DATABASE.last_insert_row_id
  end
  
  # Public: #fetch_drinks
  # fetches all drinks from the databse 
  #
  #
  # Returns:
  # An array of hashes of the drink_id and drink_name.
  #
  # State Changes:
  # No Changes
  #
  def self.fetch_drinks
    DATABASE.execute("SELECT * FROM menu")
  end
  
end

# binding.pry