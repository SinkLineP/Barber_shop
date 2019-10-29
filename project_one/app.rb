#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! my github: <a href=\"https://github.com/SinkLineP/\">SinkLine_P</a>, and my channel: <a href=\"https://www.youtube.com/channel/UCV3V0MWW0d5xx6T4pxjZauQ?view_as=subscriber/\">My YouTube</a>."
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do 
	
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]

		@title = "Thank you!"
		@message = "Hello, #{@username} your application has been sent to '#{@datetime}', Barber: #{@barber}."

		f = File.open 'public/users.txt', 'a'
		f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, Barber: #{@barber}.\n"
		f.close

		erb :message
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

	@email = params[:email]
	@message = params[:message]

		@title = "Thank you!"
		@message = "Привет мы вам в скором времени ответим, #{@email}."

		f = File.open 'public/contacts.txt', 'a'
		f.write "User: #{@email}, Message: #{@message}.\n"
		f.close

	erb :message
end

get '/login' do
	erb :login
end

post '/login' do
	

	@login = params[:login]
	@password = params[:password]

	if @login == "admin" && @password == "karamalesa"
		@logfile = File.open("public/login.txt","r")
    	@title = "Hello: '#{@login}'."
    	erb :message
	else
		@error = "Не правельный логин или пароль"
		erb :login
	end

end

