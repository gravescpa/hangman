class Hangman
    attr_accessor :word, :guessed_letters, :correct_guesses


    def initialize(word)
        @word = word  #this is the secret word
        @guessed_letters = [] #this holds the letters that have been guessed, either right or wrong
        @correct_guesses = "*" * word.length #this is the blank word "*****" that is replaced by correctly guessed letters
    end

    def create_correct_guesses(word) #This creates the "***" in the same length as the word
        @correct_guesses = "*" * word.length
    end

    def word_include?(guess) #This compares the guessed letter to the word
        word.include?(guess)
    end

    def correct_guess?(guess) #This determines if the guess is correct
        correct = false
        word.scan(/\w/) do |letter|
            letter == guess ? correct = true : false
        end
        correct
    end

    def make_guess(guess) #This puts the guessed letters into an array
        @guessed_letters << guess
    end

    def update_blanks(guess) #this updates the blank word with correct guesses
            i = 0
            word.length.times do
                if word[i] == guess
                    @correct_guesses[i] = guess
                end
                i += 1
            end
        
    end

    def game_over?(correct_guesses)
        correct_guesses == word
    end




    
   
end