get '/sessions/new' do
  @errors = params[:errors]
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    redirect "/"
  else
    errors = ["Invalid username or password."]
    redirect "/sessions/new?errors=#{errors}"
  end
end

delete '/sessions' do
  session.clear
  redirect '/'
end
