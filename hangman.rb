class Hangman
    attr_accessor :word, :guessed_letters, :correct_guesses, :chances, :guesses, :incorrect_guesses, :chances, :blank_word, :guessed_letters_length

    def initialize(word)
        @word = word
        @guessed_letters = [] 
        @correct_guesses = [] 
        @guessed_letters_length = 0
        @chances = 0
        @blank_word = Array.new(word.length, " - ")
    end

    def input_word
        @split_word = @word.split("")
    end

    def correct_guess?(guess) 
        @word.include? guess
    end

    def update_guessed_letters(guess) 
        @guessed_letters << guess
    end

    def correct_guesses_array(guess)
        @correct_guesses << guess
    end

    def update_correct_guess(guess) 
        i = 0
        @word.length.times do
            if @word[i] == guess
                @blank_word[i] = guess
                @split_word.delete_at(i)
            end
            i += 1
        end
    end

    def correct_guesses_removed_from_array(guess)
        position_in_word = @word.index(guess)
        @split_word.delete_at(position_in_word)
    end

    def combined_fill_and_delete(guess)
        if correct_guess?(guess)
            update_correct_guess(guess)
            correct_guesses_removed_from_array(guess)
        end
    end

    def no_empty_spaces?(blank_word)
        if @blank_word.include?(" - ")
            false
        else
            true
        end
    end

    def make_guess(guess)
        if @chances >= 7
            too_many_guesses?
        elsif correct_guess?(guess)
            input_word
            word_included(guess)
            update_guessed_letters(guess)
            correct_guesses_array(guess)
            guessed_letter_counter
        else
            update_guessed_letters(guess)
            counter
            guessed_letter_counter
        end
    end

    def already_guessed?(guess)
        @blank_word.include? guess
    end

    def play_game
        input_word
        begin_play
        make_guess         
    end

    def won?
        correct_guesses == @word
    end

    def lost?
        incorrect_guesses == 9
    end

    def game_over?(correct_guesses, guessed_letters)
        @guessed_letters.length + 5 >= correct_guesses.length
    end

    def too_many_guesses?
        chances >= 7
    end

    def counter
        @chances = chances + 1
    end

    def guessed_letter_counter
        @guessed_letters_length = guessed_letters_length + 1
    end

    def begin_play
        play_game until no_empty_spaces_left? || game_over?
    end

    def word_included(guess)
        update_correct_guess(guess)
    end



  
             
end