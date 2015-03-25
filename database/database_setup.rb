unless ActiveRecord::Base.connection.table_exists?(:items)
  ActiveRecord::Base.connection.create_table :items do |t|
    t.integer :user_id
    t.text :drink
    t.text :size
    t.text :reg_decaf
    t.text :cream
    t.text :sugar
    t.text :reg_skim
    t.text :whip_nowhip
    t.text :flavor
    t.text :wet_dry
    t.text :order_made
  end
end

unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.integer :office_num
    t.text :user_name
  end
end

unless ActiveRecord::Base.connection.table_exists?(:menus)
  ActiveRecord::Base.connection.create_table :menus do |t|
    t.text :drink_name
  end
end