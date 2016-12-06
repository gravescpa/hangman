class Hangman
    attr_accessor :word, :guessed_letters, :correct_guesses, :chances, :guesses, :letter_guess


    def initialize
        @word = File.readlines("dictionary.txt").sample #secret word
        @guessed_letters = [] #holds the letters that have been guessed, either right or wrong
        @correct_guesses = correct_guesses #blank word "*****" that is replaced by correctly guessed letters
        @chances = chances #number of chances to guess the word
        @guesses = guesses #letter guesses
        @letter_guess = letter_guess
    end

    def get_word #drops empty character from secret word
        @word = word.delete("\n")    
    end

    def create_correct_guesses(word) #This creates the "***" in the same length as the word
        @correct_guesses = "*" * @word.length
        # @chances = @word.length + 7
    end

    def set_max_chances(word)
        @chances = word.length + 7
    end

    def input_word(letter_guess)
        gets.chomp
    end

    def play_game
        create_correct_guesses(get_word)

        until game_over?(correct_guesses)
            guess = input_word(guess)

            puts "You guessed #{guess}"

            make_guess(guess)

            chances = chances - 1

            if chances != 0
                if word_include?(guess)
                    update_blanks(guess)
                    right_guess
                else
                    wrong_guess_again
                end
            else
                puts "You have run out of chances!"
                puts "The secret word was #{word}"
                exit
            end
        end
    end

    def word_include?(letter_guess) #This compares the guessed letter to the word
        @word.include?(letter_guess)
    end

    def make_guess(letter_guess) #This puts the guessed letters into an array
        @guessed_letters << letter_guess
    end

    def update_blanks(letter_guess) #this updates the blank word with correct guesses
            i = 0
            @word.length.times do
                if @word[i] == letter_guess
                    @correct_guesses[i] = letter_guess
                end
                i += 1
            end
            correct_guesses
    end

    def game_over?(correct_guesses)
        correct_guesses == @word
    end

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