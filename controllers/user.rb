
get "/" do
  erb :"user/homepage"
  
end

post "/menu" do
  @user=User.create(params)
  @user.save
  erb :"/user/menu"
end


# Route for each drink option
post "/user/drink/:drink_name" do
  @user_id=params["user_id"]
  erb :"user/drink/#{params[:drink_name].downcase}_page"
end  

get "/success" do
  @new_item=Item.create(params)
  erb :"user/success"
end
