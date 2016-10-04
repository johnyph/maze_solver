require 'spec_helper'

describe MazeSolver::Position do
  it "one equals another from cartesians" do
    position_1 = MazeSolver::Position.new(2,1)
    position_2 = MazeSolver::Position.new(2,1)

    expect(position_1).to eq position_2
  end

  it "corect north position" do
    position = MazeSolver::Position.new(3,3)
    north_position = MazeSolver::Position.new(3,2)

    expect(position.north).to eq north_position
  end

  it "corect south position" do
    position = MazeSolver::Position.new(3,3)
    south_position = MazeSolver::Position.new(3,4)

    expect(position.south).to eq south_position
  end

  it "corect north position" do
    position = MazeSolver::Position.new(3,3)
    east_position = MazeSolver::Position.new(4,3)

    expect(position.east).to eq east_position
  end

  it "corect west position" do
    position = MazeSolver::Position.new(3,3)
    west_position = MazeSolver::Position.new(2,3)

    expect(position.west).to eq west_position
  end
end