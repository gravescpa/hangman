require 'sinatra'
require 'rubygems'
require_relative 'hangman.rb'

enable :sessions

get '/' do
    session[:game] = Hangman.new
    erb :home, :locals => { :game => session[:game]}
end

get '/player_1_name' do
    erb :welcome, :locals => { :game => session[:game], :player_1_name => session[:player_1_name]}
end

post '/player_1_name' do
    session[:player_1_name] = params[:player_1]
    erb :player_1_name, :locals => { :game => session[:game], :player_1_name => session[:player_1_name]}    
end

get '/play_game' do
    session[:player_1_name] = params[:player_1]
    erb :play_game, :locals => { :game => session[:game], :player_1_name => session[:player_1_name]} 

end
