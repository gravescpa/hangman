require 'minitest/autorun'
require_relative 'app.rb'

class TestApp < Minitest::Test

    def test_input_word_number_of_letters
        game_word = Hangman.new(4)
        assert_equal(["","","",""], game_word.word)
    end