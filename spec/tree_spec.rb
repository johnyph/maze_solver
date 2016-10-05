require 'spec_helper'

describe MazeSolver::Tree do
  it 'should push pop an element' do
    position = MazeSolver::Position.new(2,2)
    start = MazeSolver::Element.new('S', position, 'START')
    
    tree = MazeSolver::Tree.new
    tree.push(start, 0)

    expect(tree.next).to eq start
  end
end