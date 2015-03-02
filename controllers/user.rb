
get "/" do
  erb :"user/homepage" 
end

post "/menu" do
  @user=User.new(params)
  @user.insert
  erb :"/user/menu"
end

# Route for each drink option
post "/user/drink/:drink_name" do
  @user_id=params["user_id"]
  erb :"user/drink/#{params[:drink_name].downcase}_page"
end  

get "/success" do
  user_id=params["user_id"]
  @new_item=Item.new(params)
  @new_item.insert(user_id)
  erb :"user/success"
end
