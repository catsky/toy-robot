require 'spec_helper'

describe 'Integration' do
  let(:playground) do
    return Play.new
  end

  it 'run a successful example data' do
    playground.parse_command_line('PLACE 0,0,NORTH')
    playground.parse_command_line('MOVE')
    playground.parse_command_line('RIGHT')
    playground.parse_command_line('MOVE')
    expect { playground.parse_command_line('REPORT') }.to output(/1, 1, EAST/).to_stdout
  end

  it 'run a successful example data with invalid commands in between' do
    playground.parse_command_line('MOVE')
    playground.parse_command_line('LEFT')
    playground.parse_command_line('???')
    playground.parse_command_line('PLACE ????')
    playground.parse_command_line('PLACE 0,0,NORTH')
    playground.parse_command_line('PLACE 0,1,????')
    playground.parse_command_line('MOVE')
    playground.parse_command_line('RIGHT')
    playground.parse_command_line('MOVE')
    expect { playground.parse_command_line('REPORT') }.to output(/1, 1, EAST/).to_stdout
  end
end
