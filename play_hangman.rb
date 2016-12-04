require_relative 'hangman.rb'
require_relative 'console_game.rb'

console = Console.new
game = Hangman.new(console.get_word)

game.create_correct_guesses(console.word)

until game.game_over?

    console.input_word
    game.make_guess

    if correct_guess?(console.guess)
        game.update_blanks(console.guess)
        console.right_guess
    else
        console.wrong_guess_again
    end

end
    





# game.end_message