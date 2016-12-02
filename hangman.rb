class Hangman
    attr_accessor :word, :guessed_letters, :correct_guesses, :guessed_word


    def initialize(word)
        (@word = word).downcase!  #this is the secret word
        @guessed_letters = [] #this holds the letters that have been guessed, either right or wrong
        @correct_guesses = correct_guesses #this is the blank word "*****" that is replaced by correctly guessed letters
        @guessed_word = guessed_word
    end

    def create_correct_guesses(word)
        @correct_guesses = "*" * word.length
    end

    def word_include?(guess)
        word.include?(guess)
    end

    def correct_guess?(guess)
        correct = false
        word.scan(/\w/) do |letter|
            letter == guess ? correct = true : false
        end
        correct
    end

    def make_guess(guess)
        @guessed_letters << guess
    end

    def update_blanks(guess)
        i = 0
        word.length.times do
            if word[i] == guess
                @guessed_word[i] = guess
            end
            i += i
        end
    end


    # def game_over?(correct_guesses)

    #     if @correct_guesses == @secret_word
    #     # if @correct_guesses.include?("")
    #         true
    #     else
    #         false
    #     end
    # end




    
   
end