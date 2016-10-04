require 'spec_helper'

describe MazeSolver::Element do
  it "checks equality" do
    position = MazeSolver::Position.new(2,2)

    element_1 = MazeSolver::Element.new('_', position, 'PATH')
    element_2 = MazeSolver::Element.new('_', position, 'PATH')

    expect(element_1).to eq element_2
  end

  it "is the EXIT!!!" do
    position = MazeSolver::Position.new(2,2)
    exit = MazeSolver::Element.new('G', position, 'GOAL')

    expect(exit.is_goal?).to be true
  end

  it "is path" do
    position = MazeSolver::Position.new(2,2)
    exit = MazeSolver::Element.new('_', position, 'PATH')

    expect(exit.is_path?).to be true
  end
end