require "minitest/autorun"
require_relative "hangman.rb"

class TestHangman < Minitest::Test

    def test_input_word_returns_array_of_strings
        word = Hangman.new("debit")
        assert_equal(["d","e","b","i","t"], word.input_secret_word("debit"))
    end

    def test_word_returns_empty_array_same_num_strings
        word = Hangman.new("debit")
        assert_equal(["","","","",""], word.create_guessed_word("debit"))
    end

    def test_letter_guessed_into_array
        word = Hangman.new("debit")
        assert_equal(["d"], word.get_letter_guesses("d"))
    end

    def test_o_is_a_incorrect_guess
        word = Hangman.new("debit")
        letters = "o"
        assert_equal(false, word.correct_guess?(letters))
    end

    def test_d_is_correct_guess
        word = Hangman.new("debit")
        letters = "d"
        assert_equal(true, word.correct_guess?(letters))
    end

    # def test_letter_in_correct_position
    #     @secret_word = Hangman.new("debit")
    #     letters = "e"
    #     assert_equal(["","e","","",""], @position_secret.right_guess_array(letters))
    # end

    # def test_game_over
    #     word = Hangman.new("debit")
    #     correct_guesses = ["d","e","b","i","t"]
    #     assert_equal(true, correct_guesses.game_over?(correct_guesses))
    # end
end