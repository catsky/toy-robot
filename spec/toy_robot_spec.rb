require 'spec_helper'

describe ToyRobot do
  before(:each) do
    @toy_robot = ToyRobot.new
  end

  describe 'robot placement' do
    it 'with correct place' do
      result = @toy_robot.place(1, 2, 'EAST')
      expect(result).to_not eq(nil)
    end

    it 'fails with incorrect facing' do
      result = @toy_robot.place(0, 0, 'WRONG')
      expect(result).to eq(nil)
    end

    it 'fails with incorrect place' do
      result = @toy_robot.place(99, 99, 'EAST')
      expect(result).to eq(nil)
    end
  end

  describe 'robot movement' do
    it 'with correct movement' do
      @toy_robot.place(1, 1, 'EAST')
      @toy_robot.move
      result = @toy_robot.report
      expect(result).to eq('2, 1, EAST')
    end

    it 'with correct movement after multiple commands' do
      @toy_robot.place(1, 1, 'EAST')
      @toy_robot.move
      @toy_robot.move
      @toy_robot.left
      @toy_robot.move
      result = @toy_robot.report
      expect(result).to eq('3, 2, NORTH')
    end

    it 'with correct movement after invalid commands' do
      @toy_robot.place(0, 0, 'WEST')
      @toy_robot.move # invalid command
      @toy_robot.move # invalid command
      @toy_robot.right
      @toy_robot.move
      result = @toy_robot.report
      expect(result).to eq('0, 1, NORTH')
    end
  end
end
