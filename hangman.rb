class Hangman
    attr_accessor :word, :secret_word, :guessed_letters, :correct_guesses, :guessed_word, :letters


    def initialize(word)
        @word = word.downcase!
        @secret_word = secret_word
        @guessed_letters = guessed_letters
        @correct_guesses = correct_guesses
        @guessed_word = guessed_word
        @letters = letters
    end

    def input_secret_word(word)
        secret_word = word.split("")
    end

    def create_guessed_word(word)
        guessed_word = Array.new(word.length,"")
    end

    # def secret_word_displayed
    #     number_of_blanks = word.length
    #     blank_word = Array.new(number_of_blanks, "")
    # end

    def get_letter_guesses(letters)
        guessed_letters = []
        guessed_letters << letters
    end


    # def word_include?(letter_guess)
    #     @word.include? letter_guess
    #     #     true
    #     # else
    #     #     false
    #     # end
    # end

    # def guessed_letters_array(letter_guess)
    #     @correct_guesses << letter_guess
    # end






    
   
end