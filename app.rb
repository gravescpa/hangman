require 'sinatra'
require 'rubygems'
require 'csv'
require_relative 'hangman.rb'

enable :sessions

get '/' do 
    erb :enter_word
end

post '/begin' do
    word = params[:word]
    session[:game] = Hangman.new(word)
    redirect '/player_2_name'
end

get '/player_2_name' do
    erb :player_2_name
end

post '/player_2_name' do
    session[:player_2_name] = params[:player_2]
    redirect '/play_game'
end

get '/play_game' do
    @player_2_name = session[:player_2_name]
    @player_word = session[:game].word
    puts "Player: #{session[:player_2_name]}"
    puts "Word: #{session[:word]}"
	
    erb :play_game, :locals => { :player_2_name => session[:player_2_name], :guessed_letters => session[:game].guessed_letters, :blank_word => session[:game].blank_word } 
end

post '/letter_guess' do
    letter_guess = params[:letter_guess]
    session[:game].make_guess(letter_guess)

    if session[:game].no_empty_spaces?(session[:blank_word])
        redirect '/winner'
    elsif session[:game].chances >= 7
        redirect '/game_over'
    else
        redirect '/play_game'
    end
end
    
get '/game_over' do
    word = session[:game].word
    @player_2_name = session[:player_2_name]
    guessed_letters_length = session[:game].guessed_letters_length
    write_to_csv(session[:player_2_name], session[:game].word, session[:game].guessed_letters_length)

    erb :game_over, :locals => {:guessed_letters => session[:game].guessed_letters, :word => session[:game].word, :player_2_name => session[:player_2_name], :guessed_letters_length => session[:game].guessed_letters_length}
end

get '/winner' do
    word = session[:game].word
    player_2_name = session[:player_2_name]
    guessed_letters_length = session[:game].guessed_letters_length
    write_to_csv(session[:player_2_name], session[:game].word, session[:game].guessed_letters_length)

    erb :winner, :locals => {:guessed_letters => session[:game].guessed_letters, :word => session[:game].word, :guessed_letters_length => session[:game].guessed_letters_length}
end

def write_to_csv(player_2_name, keyword, guessed_letters_length)
    CSV.open("file.csv", "a") do |row|
    row << ["#{player_2_name}","#{keyword}","#{guessed_letters_length}"]
    end
end