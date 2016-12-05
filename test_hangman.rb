require "minitest/autorun"
require_relative "hangman.rb"

class TestHangman < Minitest::Test

    def test_create_game
        game = Hangman.new
        game.word = "debit"
        assert_equal("debit", game.word)
    end

    def test_create_blank_word
        game = Hangman.new
        game.word = "debit"
        game.create_correct_guesses("debit")
        assert_equal("*****", game.correct_guesses)
    end

    def test_chances_returns_12
        game = Hangman.new
        game.word = "debit"
        assert_equal(12, game.create_correct_guesses("debit"))
    end

    def test_guess_included_in_word
        game = Hangman.new
        game.word = "debit"
        assert_equal(true, game.word_include?("d"))
        assert_equal(false, game.word_include?("z"))
    end

    def test_o_is_a_incorrect_guess
        game = Hangman.new
        game.word = "debit"
        assert_equal(false, game.word_include?("o"))
    end

    def test_d_is_correct_guess
        game = Hangman.new
        game.word = "debit"
        assert_equal(true, game.word_include?("d"))
    end

    def test_used_guessed_letter_gets_put_into_array
        game = Hangman.new
        game.word = "debit"
        game.make_guess("d")
        game.make_guess("z")
        assert_equal(["d", "z"], game.guessed_letters)
    end

    def test_letter_in_correct_position
        game = Hangman.new
        game.create_correct_guesses("debit")
        game.update_blanks("e")
        assert_equal("*e***", game.correct_guesses)
    end

    def test_game_over_false
        game = Hangman.new
        game.word = "debit"
        assert_equal(false, game.game_over?("d*bit"))
    end

    def test_game_over_true
        game = Hangman.new
        game.word = "debit"
        assert_equal(true, game.game_over?("debit"))
    end

    #This test won't pass for a randomly chosen word
    # def test_chosen_word
    #     game = Hangman.new("beer")
    #     word = "beer"
    #     assert_equal("beer", game.pick_word)
    # end

    def test_for_winner
        game = Hangman.new
        game.word = "debit"
        correct_guesses = "debit"
        assert_equal(true, game.game_over?(correct_guesses))
    end
end