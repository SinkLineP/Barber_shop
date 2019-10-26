#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! my github: <a href=\"https://github.com/SinkLineP/\">SinkLine_P</a>, and my channel: <a href=\"https://www.youtube.com/channel/UCV3V0MWW0d5xx6T4pxjZauQ?view_as=subscriber/\">My YouTube</a>."
end