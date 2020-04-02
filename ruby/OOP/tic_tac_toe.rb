require "colorize"

class Game
  def initialize
    @array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @playing = true
    @board = Board.new
    choose()
  end

  private

  def choose()
    @board.show(@array)
    if @playing == true
      puts "-------Player 1-------".red
      puts "-----CHOOSE A BOX-----"
    else
      puts "-------Player 2-------".blue
      puts "-----CHOOSE A BOX-----"
    end
    choice = gets.chomp
    play(choice)
  end

  def play(choice)
    @array.each do |x|
      if choice.to_i == x
        if @playing == true
          @array[x - 1] = "o".red
          @playing = false
        else
          @array[x - 1] = "x".blue
          @playing = true
        end
      end
    end
    if check_victory() == false
      choose()
    else
      @board.show(@array)
    end
  end

  def check_victory
    if @array[2] == @array[4] && @array[4] == @array[6]
      if @playing == false
        puts "Player 1 wins! Nice diagonal!".green
        @array[2] = "/".green
        @array[4] = "/".green
        @array[6] = "/".green
      else
        puts "Player 2 wins! Nice diagonal!".green
      end
      return true
    elsif @array[0] == @array[4] && @array[4] == @array[8]
      if @playing == true
        puts "Player 1 wins! Nice diagonal!".green
        @array[0] = "\\".green
        @array[4] = "\\".green
        @array[8] = "\\".green
      else
        puts "Player 2 wins! Nice diagonal!".green
      end
      return true
    else
      @array.each do |x|
        if @array[@array.index(x)] == @array[@array.index(x) + 1] &&
           @array[@array.index(x) + 1] == @array[@array.index(x) + 2] &&
           (@array.index(x) == 0 || @array.index(x) == 3 && @array.index(x) == 6)
          @array[@array.index(x)] = "-".green
          @array[@array.index(x)] = "-".green
          @array[@array.index(x)] = "-".green
          if @playing == false
            puts "Player 1 wins horizontally!".green
          else
            puts "Player 2 wins horizontally!".green
          end
          return true
        elsif @array[@array.index(x)] == @array[@array.index(x) + 3] &&
              @array[@array.index(x) + 3] == @array[@array.index(x) + 6] &&
              (@array.index(x) == 0 || @array.index(x) == 1 && @array.index(x) == 2)
          @array[@array.index(x)] = "|".green
          @array[@array.index(x)] = "|".green
          @array[@array.index(x)] = "|".green
          if @playing == true
            puts "Player 1 wins vertically!".green
          else
            puts "Player 2 wins vertically!".green
          end
          return true
        else
          return false
        end
      end
    end
    choose()
  end
end

class Board
  def show(array)
    puts
    puts "      #{array[0]}" + " | " + "#{array[1]}" + " | " + "#{array[2]}      "
    puts "     ---+---+---      "
    puts "      #{array[3]}" + " | " + "#{array[4]}" + " | " + "#{array[5]}      "
    puts "     ---+---+---      "
    puts "      #{array[6]}" + " | " + "#{array[7]}" + " | " + "#{array[8]}      "
    puts
  end
end

game = Game.new
