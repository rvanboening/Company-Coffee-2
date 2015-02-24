
get "/" do
  erb :"user/homepage" 
end

get "/menu" do
  @user=User.new(params)
  @user.insert
  erb :menu
end

get "/coffee_page" do
  @user_id=params["user_id"]
  erb :coffee_page, :layout
end

get "/mocha_page" do
  @user_id=params["user_id"]
  erb :mocha_page, :layout
end

get "/americano_page" do 
  @user_id=params["user_id"]
  erb :americano_page, :layout
end

get "/latte_page" do 
  @user_id=params["user_id"]
  erb :latte_page, :layout
end

get "/cappuccino_page" do
  @user_id=params["user_id"]
  erb :cappuccino_page, :layout
end


get "/success" do
  user_id=params["user_id"]
  @new_item=Item.new(params)
  @new_item.insert(user_id)
  erb :success, :layout
end
