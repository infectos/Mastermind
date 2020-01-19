class Game
  def rules
    puts ""
    puts "RULES".bold.italic.cyan
    puts ""
    puts "1 - You have to break a secret code in order to win the game."
    puts "2 - You have 4 rounds to crack the code. In each round you will input what you think is the secret code."
    puts "3 - After submitting your code. The computer will try to help you to crack the code by giving hints as to correct digits, incorrect digits and correct digits that are in the incorrect position."
    puts ""
    puts ">>> If you get a digit absolutely correct, the digit will be coloured #{"green".green}.",
      ">>> If you get a digit correct but in the wrong position, the digit will be coloured #{"yellow".yellow}.",
      ">>> If you get the digit wrong, the digit will be coloured #{"red".red}."
    puts ""
    puts "Example".bold.italic.cyan
    puts ""
    puts "If the secret code is: \n1234 \nand your guess was:\n1524 \nyou will see the following result: \n#{"1".green+"5".red+"2".yellow+"4".green}"
  end

  def initialize
    @code = [0,0,0,0]
    @code.map! { |i| (rand(6)+1).to_s }
    @player=Player.new
  end

  def show
    puts ""
    puts "The code is"
    puts @code.join('')
  end

  def intro
    puts "Do you want to #{"decode(1)".cyan} or to #{"code(2)".cyan}"
    answer = gets.chomp
    case answer
    when "1"
    self.to_decode
    when "2"
    self.to_code
    else
    puts "Please enter '1' or '2'"
    self.intro
    end
  end

  def to_decode
    @rounds_left = 4
    puts ""
    puts "New code has been created!".cyan
    until @rounds_left == 0 || self.won?
      puts ""
      puts "Guesses left: #{@rounds_left}"
      puts "Guess the code"
      @player_guess = @player.guess
      @rounds_left -= 1
      self.hint
    end

    puts self.won? ? "You've won!" : "You've lost!"
    self.outro
  end

  def to_code
    puts ""
    puts "Enter new code"
    @code = @player.create_code
    puts "The code is: #{@player.code.green}"
    puts ""
    @rounds_left = 4
    @ai = Ai.new
    until @rounds_left == 0 || self.won?
      sleep(1)
      puts ""
      puts "Guesses left: #{@rounds_left}"
      @rounds_left == 4 ? @player_guess = @ai.initial_guess : @player_guess = @ai.hack(@output)
      puts @player_guess.join('')
      @rounds_left -= 1
      self.hint
    end
    puts ""
    puts self.won? ? "Decoded!": "Not decoded!"
    self.outro
  end

  def outro
    puts "Wanna play again?"
    puts "Y/N"
    valid_yes_answers = ["y","yes"]
    valid_no_answers = ["n","no"]
    answer = gets.chomp.downcase
    until valid_yes_answers.any? { |item| answer == item } || valid_no_answers.any? { |item| answer == item }
      puts "Enter 'Yes' or 'No'"
      answer = gets.chomp.downcase
    end
    Game.new.intro if valid_yes_answers.any? { |item| answer == item }
  end

  def hint
    @output=[]
    @player_guess.each_with_index do |item, index|
      @code.include?(item) ? @output[index] = @player_guess[index].yellow : @output[index] = @player_guess[index].red
      @output[index] = @player_guess[index].green if @code[index] == item
    end
    puts""
    puts @output.join("")
  end

  def won?
    @code == @player_guess
  end

end
