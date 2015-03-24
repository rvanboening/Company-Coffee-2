DATABASE = SQLite3::Database.new("coffeering.db")

DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS items (item_id INTEGER PRIMARY KEY, user_id INTEGER,
                  drink TEXT, size TEXT, reg_decaf TEXT, cream TEXT,
                  sugar TEXT, reg_skim TEXT, whip_nowhip TEXT,
                  flavor TEXT, wet_dry TEXT, order_made TEXT)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS users (user_id INTEGER PRIMARY KEY, 
                  user_name TEXT, office_num INTEGER)")
                  
DATABASE.execute("CREATE TABLE IF NOT EXISTS orders (item_id INTEGER, user_id INTEGER)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS menu (drink_id INTEGER PRIMARY KEY, drink_name TEXT)")