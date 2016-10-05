# MazeSolver

This is a Maze Solver for labyrinths with specific format
_ : PATH
X : WALL
S : START
G : GOAL (EXIT)

It finds the shortest Path using A* Algorithm

## Use

```Ruby
  require 'maze_solver'

  MazeSolver.to_image('file_name')

  MazeSolver.to_json('file_name')
```

