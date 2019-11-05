#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'pony'


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
	@color = params[:color]

	hash = { :username => 'Введите имя',
			 :phone => 'Введите телефон',
			 :datetime => 'Введите дату и время'}

	@error = hash.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :visit
	end

	@title = "Thank you!"
	@message = "Hello, #{@username} your application has been sent to '#{@datetime}', Barber: #{@barber}, Color: #{@color}."

	f = File.open 'public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}, Barber: #{@barber}, Color: #{@color}.\n"
	f.close

	erb :message
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do

	@email = params[:email]
	@message = params[:message]

	hash = { :email => 'Введите ваш EMAIL',
			 :message => 'Введите ваш ОТЗЫВ'}

	@error = hash.select {|key,_| params[key] == ""}.values.join(", ")

	if @error != ""
		return erb :contacts
	end

		unless params[:email] == '' || params[:message] == ''
			Pony.options = {
			  :subject => "Some Subject",
			  :body => "This is the body.",
			  :via => :smtp,
			  :via_options => {
			    :address              => 'smtp.gmail.com',
			    :port                 => '587',
			    :enable_starttls_auto => true,
			    :user_name            => 'popovartem505@gmail.com',
			    :password             => ',pl.[by[jkmw2003',
			    :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
			    :domain               => "localhost.localdomain"
			  }
			}
Pony.mail(:to => popovartem505@gmail.com)
		end
		  redirect '/'

		@title = "Thank you!"
		@message = "Привет мы вам в скором времени ответим, #{@email}."

		f = File.open 'public/contacts.txt', 'a'
		f.write "User: #{@email}, Message: #{@message}.\n"
		f.close

	erb :message
end

post '/thankyou' do
  
end

