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

# post '/player_1_name' do
#     session[:player_1_name] = params[:player_1]

#     erb :player_1_name, :locals => { :game => session[:game], :player_1_name => session[:player_1_name]}    
# end

get '/play_game' do
    session[:player_1_name] = params[:player_1]
    # session[:chances] = params[:chances]
    session[:word] = session[:game].word
    session[:get_word] = session[:game].get_word
    session[:chances] = session[:game].set_max_chances
    session[:correct_guesses] = session[:game].create_correct_guesses(session[:get_word])

    session[:game].play_game

    erb :play_game, :locals => { :game => session[:game], :player_1_name => session[:player_1_name], :guessed_letters => session[:guessed_letters], :chances => session[:chances]} 
end

post '/play_game' do
    redirect '/letter_guess'
end

get '/letter_guess' do
    session[:word] = session[:game].word
    session[:get_word] = session[:game].get_word
    # session[:chances] = session[:game].chances
    session[:correct_guesses] = session[:game].create_correct_guesses(session[:get_word])

    erb :play_game, :locals => { :game => session[:game], :player_1_name => session[:player_1_name], :guessed_letters => session[:game].guessed_letters, :correct_guesses => session[:game].correct_guesses, :chances => session[:game].chances} 
end

post '/letter_guess' do
    letter_guess = params[:letter_guess]
    
    
    session[:game].play_game

    
    
   

end

