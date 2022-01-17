class ToyRobot
  MAX_LENGTH = 4
  MAX_WIDTH = 4
  # in a clock-wise order for easy tracking of left and right turn
  FACEINGS = %w[NORTH EAST SOUTH WEST]

  def initialize
    @x = nil
    @y = nil
    @f = nil
  end

  def started?
    @x && @y && @f
  end

  def left
    if started?
      cur_facing_index = FACEINGS.index(@f)
      # counterclockwise direction
      left_turn_step = 1
      next_facing_index = cur_facing_index - left_turn_step
      @f = FACEINGS[next_facing_index]
    else
      puts 'Left command skipped'
    end
  end

  def right
    if started?
      cur_facing_index = FACEINGS.index(@f)
      # clockwise direction
      right_turn_step = 1
      max_facings_index = 3
      next_facing_index = cur_facing_index == max_facings_index ? 0 : current_facing_index + right_turn_step
      @f = FACEINGS[next_facing_index]
    else
      puts 'Right command skipped'
    end
  end

  def move
    puts 'Move command skipped' unless started?
    next_x, next_y = get_next_position
    if valid_position? next_x, next_y
      @x = next_x
      @y = next_y
    else
      puts 'Invalid position, Move command skipped'
    end
  end

  def report
    puts "#{@x}, #{@y}, #{@f}"
  end

  def place(x, y, facing)
    if valid_position?(x, y)
      @x = x
      @y = y
      @f = facing
    end
  end

  def get_next_position
    step_length = 1
    case @f
    when 'NORTH'
      [@x, @y + step_length]
    when 'EAST'
      [@x + step_length, @y]
    when 'SOUTH'
      [@x, @y - step_length]
    when 'WEST'
      [@x - step_length, @y]
    end
  end

  private

  def valid_position?(x, y)
    valid_x = x >= 0 && x <= MAX_LENGTH
    valid_y = y >= 0 && y <= MAX_WIDTH
    valid_x && valid_y
  end
end
