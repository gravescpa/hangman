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
        # letters = "d"
        assert_equal(["d"], word.get_letter_guesses("d"))
    end

    # def test_o_is_a_correct_guess
    #     game_word = Hangman.new("house")
    #     letter_guess = "o"
    #     assert_equal(true, game_word.word_include?("o"))
    # end

    # def test_r_is_a_false_guess
    #     game_word = Hangman.new("house")
    #     letter_guess = "r"
    #     assert_equal(false, game_word.word_include?("r"))
    # end

    # def test_letter_guess_pushed_into_array
    #     game_word = Hangman.new("house")
    #     assert_equal(["o"], game_word.guessed_letter_array("o"))
    # end

end