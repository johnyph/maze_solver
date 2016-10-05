require 'spec_helper'
require 'json'

describe MazeSolver do
  it "should bring the corect json path" do
    solution = MazeSolver.to_json('./spec/images/maze.im')
    array_solution = JSON.parse(solution)

    expected_solution = [
      {"value"=>"G", "position"=>"(2, 4)"},
      {"value"=>"_", "position"=>"(1, 4)"},
      {"value"=>"_", "position"=>"(1, 3)"},
      {"value"=>"_", "position"=>"(1, 2)"},
      {"value"=>"_", "position"=>"(2, 2)"},
      {"value"=>"_", "position"=>"(2, 1)"},
      {"value"=>"_", "position"=>"(2, 0)"},
      {"value"=>"_", "position"=>"(3, 0)"},
      {"value"=>"S", "position"=>"(4, 0)"},
    ]

    expect(array_solution).to eq expected_solution
  end
end
