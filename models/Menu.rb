# require 'pry'
# require 'SQLite3'
# require_relative "../database_setup"

class Menu
  attr_reader :drink_name
  
  def initialize(options)
    @drink_name    =options["drink_name"]
  end
  
  def insert
    sql_command="INSERT INTO menu (drink_name) VALUES ('#{@drink_name}')"
    DATABASE.execute(sql_command)
    
    @user_id = DATABASE.last_insert_row_id
  end
  
  #fetches all from drink = drink_id and drink
  def self.fetch_drinks
    DATABASE.execute("SELECT * FROM menu")
    

    # results.each do |r|
    #   results_as_objects << self.new(r)
    #
    # end
    #
    # #an array of objects
    # results_as_objects
    
  end
  
end

# binding.pry