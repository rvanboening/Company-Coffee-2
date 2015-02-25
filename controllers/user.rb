
get "/" do
  erb :"user/homepage" 
end

get "/menu" do
  @user=User.new(params)
  @user.insert
  erb :"user/menu"
end

get "/coffee_page" do
  @user_id=params["user_id"]
  erb :"user/drink/coffee_page"
end

get "/mocha_page" do
  @user_id=params["user_id"]
  erb :"user/drink/mocha_page"
end

get "/americano_page" do 
  @user_id=params["user_id"]
  erb :"user/drink/americano_page"
end

get "/latte_page" do 
  @user_id=params["user_id"]
  erb :"user/drink/latte_page"
end

get "/cappuccino_page" do
  @user_id=params["user_id"]
  erb :"user/drink/cappuccino_page"
end


get "/success" do
  user_id=params["user_id"]
  @new_item=Item.new(params)
  @new_item.insert(user_id)
  erb :"user/success"
end
