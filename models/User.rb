# Class: Guest
# manages the 
# 
# Attributes: 
# @user_id    - Integer - primary Key
# @user_name  - String  - name of the user
# @office_num - Integer - office number of the user
# 
# Public Methods:
# #Insert
# #self.print_user
#
class User 
  attr_accessor :user_id, :user_name, :office_num, :order_num
  attr_reader :user_id, :user_name, :office_num, :order_num
  
  def initialize(options)
    @user_id    =options["user_id"]
    @user_name  =options["user_name"]
    @office_num =options["office_num"]
  end
  

 
 
# Public #Insert
# Creates a user record
# 
# Parameters:
# @user_name
# @office_number
#
# Returns:
# NA
# 
# Changes:
# This adds a record to the users table. 
#
# Take the current object and insert it as a new record into the users table 
  
  def insert
    sql_command="INSERT INTO users (user_name, office_num) VALUES ('#{@user_name}', '#{@office_num}')"
    DATABASE.execute(sql_command)
    
    @user_id = DATABASE.last_insert_row_id

    # sql_command_pop_order_table = "INSERT INTO orders (user_id) VALUES ('#{@user_id}')"
#     DATABASE.execute(sql_command_pop_order_table)
  end
  
  #Public: # Print
 # Uses the Prawn-Labels Gem to create a pdf on labels. 
 #
 # Parameter
 # made_item_id - The item_id of the product that is made. 
 #
 # Returns
 # A pdf of the drink order and one pdf of the name and office number of the person that ordered it
 #
 # Changes
 # The .pdf document changes depending on what the made_item_id is. 
  def self.print_user(made_item_id)
    DATABASE.execute("SELECT * FROM users WHERE user_id = '#{made_item_id}'")
  end
end


  # In terminal Type t = User.new ({"user_name" => 'Tom', "office_num" => '201'})
  # options has a () around them. Add them. 
  # "id" is a string. You must make them strings. 

  