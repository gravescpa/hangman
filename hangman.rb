class Hangman
    attr_accessor :word, :guessed_letters, :correct_guesses, :chances, :guesses


    def initialize
        @word = File.readlines("dictionary.txt").sample #this is the secret word
        @guessed_letters = [] #this holds the letters that have been guessed, either right or wrong
        @correct_guesses = correct_guesses #this is the blank word "*****" that is replaced by correctly guessed letters
        @chances = chances
        @guesses = guesses
    end

    def get_word
        # word = File.readlines("dictionary.txt").sample
        @word = word.delete("\n")    
        # word
    end

    def create_correct_guesses(word) #This creates the "***" in the same length as the word
        @correct_guesses = "*" * @word.length
        @chances = @word.length + 7
    end

    def word_include?(guess) #This compares the guessed letter to the word
        @word.include?(guess)
    end

    # def correct_guess?(guess) #This determines if the guess is correct
    #     correct = false

    #         word.scan(/\w/) do |letter|
    #             letter == guess ? correct = true : false
    #         end
    #     correct
    # end

    def make_guess(guess) #This puts the guessed letters into an array
        @guessed_letters << guess
    end

    def update_blanks(guess) #this updates the blank word with correct guesses
            i = 0
            @word.length.times do
                if @word[i] == guess
                    @correct_guesses[i] = guess
                end
                i += 1
            end
    end

    def game_over?(correct_guesses)
        correct_guesses == @word
    end

    def winner
        puts "You are a winner!  Congratulations!!"
        exit
    end

    def loser
        puts "WRONG! Do you want to guess again?"
    end

    def input_word(guess)
        gets.chomp
    end

    def wrong_guess_again
        puts "Sorry, that letter isn't in your word"
        puts "Guess again!"
        puts "Input a letter: " 
        # input_word(guess)
    end

    def right_guess
        puts "You guessed wisely!"
        # update_blanks(guess)
        puts "Your word to guess is #{correct_guesses}"
        puts "Would you like to guess the word? (Y or N)"
        
        solve = gets.chomp

        if solve == 'y'
            puts "Give it a shot! Enter your guess: "
            answer = gets.chomp
            if answer == @word
                winner
            else
                loser
            end
        else
            puts "You sissy.  Go ahead and try again"
            puts "Your word to guess is #{correct_guesses}" 
            puts "Take a guess: " 
            # guess = gets.chomp
        end
    end


    
   
end