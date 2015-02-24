class Menu
  attr_reader :drink
  
  def initialize(options)
    @drink    =options["drink"]
  end
  
  def insert
    sql_command="INSERT INTO menu (drink) VALUES ('#{@drink}')"
    DATABASE.execute(sql_command)
    
    @user_id = DATABASE.last_insert_row_id
  end
  
  #fetches all from drink = drink_id and drink
  def fetch_drink
    results=DATABASE.execute("SELECT * FROM menu")
    # results_as_objects = []
    #
    # results.each do |r|
    #   results_as_objects << self.new(r)
    #
    # end
    #
    # #an array of objects
    # results_as_objects
    
  end
  
end
