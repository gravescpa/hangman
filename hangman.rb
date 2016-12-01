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
        @secret_word.include?(letters)
    end







    
   
end