class Hangman
    attr_accessor :word, :guessed_letters, :correct_guesses, :chances, :guesses, :incorrect_guesses


    def initialize
        @word = word
        @guessed_letters = [] 
        @correct_guesses = correct_guesses 
        @incorrect_guesses = 0
    end


    def create_correct_guesses(word)
        @correct_guesses = "_" * word.length
    end

    def update_incorrect_guesses
        @incorrect_guesses = incorrect_guesses + 1
    end

    def correct_guess?(guess) 
        @word.include?(guess)
    end

    def update_guessed_letters(guess) 
        @guessed_letters << guess
    end

    def update_correct_guess(guess) 
        i = 0
        @word.length.times do
            if @word[i] == guess
                @correct_guesses[i] = guess
            end
            i += 1
        end
        correct_guesses
    end

    def make_guess(guess)
        update_guessed_letters
        if correct_guess?(guess)
            update_correct_guess(guess)
        else
            update_incorrect_guesses
        end
    end

    def guess_a_letter(guess)
        # until @chances == 0
        if @chances >= 7
            too_many_guesses?
        elsif @word.include? guess
            # input_secret_word
            # find_first_occurance_of_correct_letter_in_source_word(guess)
            correct_guess?(guess)
            update_guessed_letters(guess)
            update_correct_guess(guess)
            # guessed_letter_counter
        else
            update_guessed_letters(guess)
            update_incorrect_guesses
            # counter
            # guessed_letter_counter
        end
    end

    def won?
        correct_guesses == @word
    end

    def lost?
        incorrect_guesses == 9
    end

#########Functions for command line play##########

    def input_word(guess)
        gets.chomp
    end

    def game_over?(correct_guesses)
        correct_guesses == @word
    end

    # def get_word #drops empty character from secret word
    #     @word = word.delete("\n")    
    # end

    def winner
        puts "You are a winner!  Congratulations!!"
        exit
    end

    def loser
        puts "WRONG! Let's go back to just guessing letters, okay?"
        puts "Your word to guess is #{correct_guesses}"
        puts "Take a guess: "
    end

    def wrong_guess_again
        puts "Sorry, that letter isn't in your word"
        puts "Guess again: " 
    end

    def right_guess
        puts "You guessed wisely!"
        puts "Your word to guess is #{correct_guesses}"
        solve_word
    end

    def solve_word
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
        elsif solve == 'n'
            puts "You sissy.  Go ahead and try to guess another letter."
            puts "Your word to guess is #{correct_guesses}" 
            puts "Take a guess: " 
        else
            puts "Enter only Y or N silly"
            solve = gets.chomp
        end
    end
             
end