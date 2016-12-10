require 'sinatra'
require 'rubygems'
require_relative 'hangman.rb'

enable :sessions

get '/' do 
    erb :home
end

get '/player_1_name' do
    erb :player_1_name
end

post '/player_1_name' do
    session[:player_1_name] = params[:player_1_name]
end

get '/player_2_name' do
    erb :player_2_name
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2_name]
    redirect '/play_game'
end

get '/play_game' do
    session[:game] = Hangman.new  
    word = session[:game].word
    get_word = session[:game].get_word
    correct_guesses = session[:game].create_correct_guesses(get_word)
    chances = session[:game].set_max_chances(word)
    guessed_letters = session[:game].guessed_letters.join("")

    # images = ["one.jpg", "two.jpg", "three.jpg", "four.jpg", "five.jpg", "six.jpg", "seven.jpg", "eight.jpg"]
    # image = "images/" + images[incorrect_guesses]

    # session[:game].play_game
	
    erb :play_game, :locals => { :game => session[:game], :player_name => session[:player_name], :guessed_letters => session[:game].guessed_letters, :correct_guesses => session[:game].correct_guesses, :chances => session[:game].chances} 
end

post '/play_game' do
    session[:game].play_game
    # session[:word] = session[:game].word
    # session[:get_word] = session[:game].get_word
    # session[:correct_guesses] = session[:game].create_correct_guesses(session[:get_word])
    # session[:chances] = session[:game].set_max_chances(session[:word])

    # session[:game].play_game
    # letter_guess = params[:letter_guess]

    # session[:game].play_game

end

