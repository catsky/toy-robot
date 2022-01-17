require './toy_robot'

class Play
  def initialize
    @robot = ToyRobot.new
  end

  def load_and_play
    test_data_path = File.join(__dir__, 'test_data', 'commands.txt')
    if File.file? test_data_path
      File.readlines(test_data_path).each do |line|
        parse_command_line(line)
      end
    else
      puts 'command file not found. exit.'
    end
  end

  def parse_command_line(line)
    line_elements = line.split(' ')
    return false if line_elements.empty?

    command = line_elements.first
    case command
    when 'PLACE'
      # e.g PLACE 1,2,EAST
      command_args = line_elements.last.split(',')
      @robot.place(*command_args)
    when 'MOVE'
      @robot.move
    when 'LEFT'
      @robot.left
    when 'RIGHT'
      @robot.right
    when 'REPORT'
      puts @robot.report
    end
  end
end

Play.new.load_and_play
