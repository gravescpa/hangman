require_relative 'hangman.rb'

class Console
    attr_reader :word, :game
    attr_accessor :guesses, :solve, :answer

    

    def initialize      
        @word = word
        @guesses = guesses
        @solve = solve
        @answer = answer
        # game = Hangman.new(word)
    end

    def get_word
        word = File.readlines("dictionary.txt").sample
        word = word.delete("\n")    
        word
    end

    def input_word
        puts "Let's play Hangman!"
        puts "Guess the letters of the hidden word"
        puts "Your word to guess is: #{word}"
        puts "Input a letter: " 
        # guesses.gets.chomp
    end

    def wrong_guesses_again
        puts "Sorry, that letter isn't in your word"
        puts "guesses again!"
        puts "Input a letter: " 
        guesses.gets.chomp
    end

    def right_guesses
        puts "You guessesed wisely!"
        puts "Would you like to guesses the word? (Y or N)"
        solve.gets.chomp

        if solve == 'y'
            puts "Give it a shot! Enter your guesses: "
            answer.gets.chomp
        else
            puts "You sissy.  Go ahead and try again" 
            puts "Input a letter: " 
            guesses.gets.chomp
        end
    end

end
