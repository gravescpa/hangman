require_relative 'hangman.rb'

game = Hangman.new

game.create_correct_guesses(game.get_word)

word = game.word

# For testing the word is #{word}

puts """Let's play Hangman!

Guess the letters of the hidden word

Your word to guess is: #{game.correct_guesses}

You have #{game.chances} chances to guess it.

Take a guess: """ 

until game.game_over?(game.correct_guesses)
    guess = game.input_word(guess)

    puts "You guessed #{guess}"

    game.make_guess(guess)

    game.chances = game.chances - 1

    if game.chances != 0
        if game.word_include?(guess)
            game.update_blanks(guess)
            game.right_guess
        else
            game.wrong_guess_again
        end
    else
        puts "You have run out of chances!"
        puts "The secret word was #{word}"
        exit
    end
end

