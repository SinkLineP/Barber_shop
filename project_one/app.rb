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

		@title = "Thank you!"
		@message = "Hello, #{@username} your application has been sent to '#{@datetime}'."

		f = File.open 'user.txt', 'a'
		f.write "User: #{@username}, Phone: #{@phone}, Date and time: #{@datetime}.\n"
		f.close

		erb :message
end