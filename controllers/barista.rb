
get "/bar_homepage" do
   erb :"barista/bar_homepage"
end

#before refresh page
get "bar_order_page" do
  
    Item.print(params["item_id"])
    made_item = Item.edit(params["item_id"]) 
  
 erb :"barista/bar_order_page"
end

#To add drinks to the menu
get "/bar_edit_menu" do
  erb :"barista/bar_edit_menu"
end
 
 
get "/bar_submit" do
  @drink=Menu.new(params)
  @drink.insert
  erb :"barista/bar_submit"
end