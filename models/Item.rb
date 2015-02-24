# require 'pry'
# require 'SQLite3'
# require_relative "../database_setup"

class Item
  attr_reader :user_id, :drink, :size, :reg_decaf, :cream, :sugar, :reg_skim, :whip_nowhip, :flavor, :wet_dry, :order_made
  
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
  
  # Public: # Fetch_orders
  # Lists all items that have been ordered but not made
  
  def self.fetch_orders
     DATABASE.execute("SELECT * FROM items WHERE order_made = 'Order'")
  end
  
  # Public: # Edit
  # Updates an item status from Order to Made. 
  # Must be "Order" and "Made"
  
  def self.edit(made_item_id)
    DATABASE.execute("UPDATE items SET order_made='Made' WHERE item_id = '#{made_item_id}'")
  end
  
  # Public: # Print
  # This collects the record of the item that is made. 
  # This then prints the information using the Prawn Gem to turn the info into a .pdf 
  
  def self.print(made_item_id)
         
    # This method = an array of hashes.
    order = DATABASE.execute("SELECT * FROM items WHERE item_id = '#{made_item_id}'")    
    
    unless order == []
    # #Because there is only one item in the array 0 will = the 1st hash inside the array.
    h = order[0]
    o = h["user_id"]
    end
    
    filename = "print_orders.pdf"
    
    Prawn::Labels.generate(filename, order, :type => "Avery5160") do |pdf, o|
      
      pdf.text "Enjoy your:#{o["item_id"]}. #{o["drink"]}. #{o["size"]}. 
                            #{o["reg_decaf"]}. #{o["cream"]}. #{o["sugar"]}. #{o["reg_skim"]}. 
                            #{o["whip_nowhip"]}. #{o["flavor"]}. #{o["wet_dry"]}."
                          end
    
    filename= "print_order_name.pdf"                      
    user_info = DATABASE.execute("SELECT * FROM users WHERE user_id = '#{o}'")
                          
    Prawn::Labels.generate(filename, user_info , :type => "Avery5160") do |pdf, o|

      pdf.text "#{o["user_name"]}. #{o["office_num"]}"
    end

    # Prawn::Labels.generate(filename, order, user_info, :type => "Avery5160") do |pdf, o, u|
    #
    #   pdf.text "Enjoy your:#{o["item_id"]}. #{o["drink"]}. #{o["size"]}.
    #                         #{o["reg_decaf"]}. #{o["cream"]}. #{o["sugar"]}. #{o["reg_skim"]}.
    #                         #{o["whip_nowhip"]}. #{o["flavor"]}. #{o["wet_dry"]}. #{u["user_name"]}"
    #                       end
                        end

    # Prawn::Labels.generate(filename, order, :type => "Avery5160") do |pdf, o|

    # pdf.text "Order for:  #{o["item_id"]}.\n#{o["drink"]}.\n#{o["size"]}.\n
 #                          #{o["reg_decaf"]}.\n#{o["cream"]}.\n#{o["sugar"]}.\n#{o["reg_skim"]}.\n
 #                          #{o["whip_nowhip"]}.\n#{o["flavor"]}.\n#{o["wet_dry"]}"
 #                          end

end

# binding.pry
