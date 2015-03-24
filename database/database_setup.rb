DATABASE = SQLite3::Database.new("database/coffeering.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS items (id INTEGER PRIMARY KEY, user_id INTEGER,
                  drink TEXT, size TEXT, reg_decaf TEXT, cream TEXT,
                  sugar TEXT, reg_skim TEXT, whip_nowhip TEXT,
                  flavor TEXT, wet_dry TEXT, order_made TEXT)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, 
                  user_name TEXT, office_num INTEGER)")
                  
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS menus (id INTEGER PRIMARY KEY, drink_name TEXT)")

