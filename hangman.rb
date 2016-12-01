class Hangman
    attr_accessor :word, :secret_word, :guessed_letters, :correct_guesses, :guessed_word


    def initialize(word)
        @word = word.downcase!
        @secret_word = []
        @guessed_letters = []
        @correct_guesses = []
        @guessed_word = []
    end

    def input_secret_word(word)
        @secret_word = word.split("")
    end

    def create_guessed_word(word)
        @guessed_word = Array.new(word.length,"")
    end

    def get_letter_guesses(letters)
        @guessed_letters << letters
    end

    def correct_guess?(letters)
        # correct = false
        @word.scan(/\w/) do |letter|
            letter == letters ? true : false
        end
        # correct
    end

    def right_guess_array(letters)
        if correct_guess?(letters)
            @position_secret = @word.index(letters)
            @correct_guesses[@position_secret] = letters
        end
    end

    def game_over?(correct_guesses)
        if @correct_guesses == @secret_word
        # if @correct_guesses.include?("")
            true
        else
            false
        end
    end




    
   
end