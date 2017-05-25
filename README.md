# Maze-Problem
Solve a maze problem by reinforcement learning\
maze:\
[1 1 1 1 1 1 1 1 1 1 1 1;\
      1 0 0 1 0 0 0 0 0 0 0 1;\
      1 0 0 1 0 1 0 0 1 1 0 1;\
      1 1 0 1 0 1 1 1 1 0 0 1;\
      1 0 0 0 0 0 1 0 0 0 0 1;\
      1 0 0 0 0 0 1 0 0 0 0 1;\
      1 1 1 1 1 0 1 0 1 0 0 1;\
      1 0 0 0 0 0 1 0 1 0 0 1;\
      1 0 1 1 1 1 1 0 1 0 0 1;\
      1 0 0 0 0 1 0 0 1 0 0 1;\
      1 0 0 1 0 0 0 0 1 0 2 1;\
      1 1 1 1 1 1 1 1 1 1 1 1];
    
maze is set as above, 1 is wall, 0 is road and 2 is goal.
In this file, it offers two method based on reinforcement learning to slove this problem.

1. epsilon-greedy TD(0) 
2. epsilon-greedy Q-learning
