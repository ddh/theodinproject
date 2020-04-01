class Timer
  attr_accessor :seconds, :time_string, :minutes
  def initialize()
    @seconds = 0
    @minutes = 0
    @hours = 0
  end

  def time_string()
    @hours = @seconds / 3600
    @minutes = @seconds / 60
    @seconds = @seconds - @minutes * 60
    @minutes = @minutes - @hours * 60
    if @seconds <= 9
      @seconds = "0" + @seconds.to_s 
    else
      @seconds = @seconds.to_s
    end
    
    if @minutes <= 9 
      @minutes = "0" + @minutes.to_s
    else
      @minutes = @minutes.to_s
    end

    if @hours <= 9
      @hours = "0" + @hours.to_s
    else
      @hours = @hours.to_s
    end
    @time_string = @hours + ":" + @minutes + ":" + @seconds
    # puts @time_string
  end
end

# @timer = Timer.new
# @timer.seconds = 4000
# @timer.time_string

