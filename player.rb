class Player

  attr_reader :code
  def initialize
    @guess=nil
  end

  def guess
    @guess = gets.chomp
    until @guess.length == 4 && @guess[/^[1-6]+$/]
      puts "Invalid code. It must contain 4 digits from 1 to 6."
      @guess = gets.chomp
    end
    return @guess.split('')
  end

  def create_code
    @code = gets.chomp
    until @code.length == 4 && @code[/^[1-6]+$/]
      puts "Invalid code. It must contain 4 digits from 1 to 6."
      @code = gets.chomp
    end
    puts ""
    puts "The code has been accepted".cyan
    return @code.split('')
  end
end