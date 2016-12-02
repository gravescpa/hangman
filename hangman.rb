class Hangman
    attr_accessor :word, :guessed_letters, :correct_guesses, :guessed_word


    def initialize(word)
        (@word = word).downcase!
        @guessed_letters = guessed_letters
        @correct_guesses = correct_guesses
        @guessed_word = []
    end

    def create_correct_guesses(word)
        @correct_guesses = "*" * word.length
    end

    def word_include?(letters)
        word_include?(letters)
    end

    def correct_guess?(letters)
        correct = false
        word.scan(/\w/) do |letter|
            letter == letters ? correct = true : false
        end
        correct
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