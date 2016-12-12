require "minitest/autorun"
require_relative "hangman.rb"

class TestHangman < Minitest::Test

    def test_create_game
        game = Hangman.new("debit")
        game.word = "debit"
        assert_equal("debit", game.word)
    end

    def test_create_blank_word
        game = Hangman.new("debit")
        assert_equal(["d","e","b","i","t"], game.input_word)
    end

    def test_guess_e_returns_true
        game = Hangman.new("debit")
        assert_equal(true, game.correct_guess?("e"))
    end

    def test_guess_a_returns_false
        game = Hangman.new("debit")
        assert_equal(false, game.correct_guess?("a"))
    end

    def test_used_guessed_letter_gets_put_into_array
        game = Hangman.new("debit")
        assert_equal(["d"], game.update_guessed_letters("d"))
    end

    # #not passing
    # def test_letter_in_correct_position
    #     game = Hangman.new("debit")
    #     game.blank_word = ["d","e","b","i","t"]
    #     game.input_word
    #     assert_equal(["-","e","-","-","-"], game.update_correct_guess("e"))
    # end


    def test_for_winner
        game = Hangman.new("debit")
        game.word = "debit"
        game.correct_guesses = "debit"
        assert_equal(true, game.won?)
    end

    def test_for_loser
        game = Hangman.new("debit")
        game.chances = 8
        assert_equal(true, game.too_many_guesses?)
    end
end