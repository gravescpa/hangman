Class Hangman
    attr_accessor :word

    def initialize(num_of_letters)
        @word = Array.new(num_of_letters, "")
    end
   
end