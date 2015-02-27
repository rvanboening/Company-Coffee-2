# require 'pry'
# require 'SQLite3'
# require_relative "../database_setup"


# Class: Item
#
# Creates a drink item which is an order.
#
# Attributes:
# @item_id    - Integer: Primary Key
# @drink      - Stirng: Type of dirnk
# @size       - String: Small, Medium, Large
# @reg_decaf  - String: Regular or Decaf Coffee
# @cream      - String: If cream add cream to drink
# @sugar      - String: If sugar add sugar to drink
# @reg_skim   - String: Regular or Skim milk
# @whip_nowhip- String: Whip Cream or No Whip Cream
# @flavor     - String: Add Vanilla flavor or do not
# @wet_dry    - String: Wet Cappachino or Dry Cappachino
#
# Public Methods:
# #insert
# #self.fetch_all_orders
# #fetch_orders
# #self.edit(made_item_id)
# #self.print(made_item_id)

class Item
  attr_reader :user_id, :item_id, :drink, :size, :reg_decaf, :cream, :sugar, :reg_skim, :whip_nowhip, :flavor, :wet_dry, :order_made
  
  def initialize(options)
      @item_id      =options["item_id"]   #primary key
      @drink        =options["drink"]
      @size         =options["size"]
      @reg_decaf    =options["reg_decaf"]
      @cream        =options["cream"]
      @sugar        =options["sugar"]
      @reg_skim     =options["reg_skim"]
      @whip_nowhip  =options["whip_nowhip"]
      @flavor       =options["flavor"]
      @wet_dry      =options["wet_dry"]
      @order_made   =options["order_made"]
      @user_id      =options["user_id"]
    end
  
  # Public: #insert drink into database
  #
  # Parameters: 
  #  user_id - #Integer -ID that is assigned to the user    
  #
  # Returns:
  # NA
  #
  # State Changes:
  # Adds a record to the last row of the items database
  # Adds a record to the orders table
  #
  def insert(user_id) 
    sql_command="INSERT INTO items (user_id, drink, size, reg_decaf, cream, sugar, reg_skim, whip_nowhip, flavor, wet_dry, order_made) 
                  VALUES ('#{user_id}', '#{@drink}', '#{size}', '#{@reg_decaf}', '#{@cream}', '#{@sugar}', '#{@reg_skim}', '#{@whip_nowhip}', '#{@flavor}', '#{@wet_dry}', '#{order_made}')"

    DATABASE.execute(sql_command)
    @item_id = DATABASE.last_insert_row_id

    sql_command_pop_order_table = "INSERT INTO orders (item_id, user_id) VALUES (#{@item_id}, #{user_id})"
    DATABASE.execute(sql_command_pop_order_table)
  end

  # Public: #fetch_orders
  # Lists item id and name of a record
  #
  # Parameters:
  # id - Item ID
  #
  # Returns:
  # an arrary of hashes containing the item id and name
  #
  # State Changes: 
  # no changes
   
  # Lists all items for barista
  def self.fetch_all_orders
     DATABASE.execute("SELECT * FROM items")
  end
  
  # Public: #Fetch Orders
  # Lists all items that have been ordered but not made
  #
  # Returns:
  # An array of hases of each record that the order_made column is set to Order
  #
  # State Changes:
  # No changes are made
  
  def self.fetch_orders
     orders = DATABASE.execute("SELECT * FROM items WHERE order_made = 'Order'")
     array_of_objects=[]
     orders.each do |hash|
       array_of_objects << self.new(hash)
     end
     return array_of_objects
  end
  
  
  # Public: #Edit
  # Updates item status from Order to Made 
  #
  # Parameters
  # made_item_id - Item_id - Integer
  #
  # Returns 
  # NA
  # 
  # Changes:
  # This changes the Order_made status from Order to the status of Made
  # Must be "Order" and "Made"
  
  def self.edit(made_item_id)
    DATABASE.execute("UPDATE items SET order_made='Made' WHERE item_id = '#{made_item_id}'")
  end
  
  # Public: # Print
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
  
  # This collects the record of the item that is made. 
  # This then prints the information using the Prawn Gem to turn the info into a .pdf 
  
  def self.print(made_item_id)
         
    # This method = an array of hashes.
    order = DATABASE.execute("SELECT * FROM items WHERE item_id = '#{made_item_id}'")    
    
    unless order == []
    # #Because there is only one item in the array 0 will = the 1st hash inside the array.
    o = order[0]["user_id"]
    end
    
    filename = "print_orders.pdf"
    
    Prawn::Labels.generate(filename, order, :type => "Avery5160") do |pdf, o|
      
      pdf.text "Enjoy your: #{o["drink"]}. #{o["size"]}. 
                            #{o["reg_decaf"]}. #{o["cream"]}. #{o["sugar"]}. #{o["reg_skim"]}. 
                            #{o["whip_nowhip"]}. #{o["flavor"]}. #{o["wet_dry"]}."
                          end
    
    filename= "print_order_name.pdf"                      
    user_info = DATABASE.execute("SELECT * FROM users WHERE user_id = '#{o}'")
                          
    Prawn::Labels.generate(filename, user_info , :type => "Avery5160") do |pdf, o|

      pdf.text "#{o["user_name"]}. #{o["office_num"]}"
    end
  end
end

# binding.pry
