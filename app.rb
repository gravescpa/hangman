require 'sinatra'
require 'rubygems'
require_relative 'hangman.rb'

enable :sessions

get '/' do
    session[:game] = Hangman.new

    erb :home, 

end