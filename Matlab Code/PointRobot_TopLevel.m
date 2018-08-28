%This is the top level script used to build the point robot navigation
%example for project 1.  Let's jump right in!

%Some matlab cleanup work here.
clear all
clc
scaling = 10;

%The first thing we want to do is to load the map.  It is called an
%"occupancy map" but don't worry about that yet.  Just know it is filled with
%1's and 0's (with 1 signifying an obstacle or wall and 0 signifing free
%space).  So, we can only move in free space, mkay.
load('OccupancyMap_v1.mat');

%The goal is where we are trying to get to.
GoalLocation = [80, 80]';

%The path length variable is where we will store the number of moves 
%needed to reach the path
pathLength = 0;

%This variable will store whether a obstacle is encountered on the
%attempted move.  0 for no obstacle 1 for obstacle
obstacleEncountered = 0;

%Begin the plotting routines by plotting the base map.
PlotOccupancyMap(OccupancyMap, GoalLocation);

%This is the RobotStartingLocation, I will provide this for the competition
RobotLocation = [2,2]';
%Draw the robot location on the map
PlotRobotLocation(RobotLocation);

pathBackwards = AStar(OccupancyMap, GoalLocation, RobotLocation);
%loop until we reach the goal location or some maximum number of moves have
%been tried or we are not moving and have no hope of movement
%while(~isequal(RobotLocation, GoalLocation) && (pathLength < 2000))
[rows,cols] = size(pathBackwards);
for i=rows:-1:1
%[newRobotLocation, obstacleHitInMove] = moveRobot(x_move, y_move, CurrentRobotLocation, OccupancyMap)
    %x_move and y_move are either -1, 0, +1
    [RobotLocation, obstacleEncountered, pathLength] = moveRobot(pathBackwards(i,2)-RobotLocation(1), pathBackwards(i,1)-RobotLocation(2), RobotLocation, OccupancyMap);
        %[RobotLocation, obstacleEncountered, pathLength] = moveRobot(0, -1, RobotLocation, OccupancyMap);
        %If we are not moving again then we are dead for this
        %implimentation

    %pause for dramatic effect
    pause(.05);
    
    %plot out the robot location
    PlotRobotLocation(RobotLocation);
end

%Just display some extremely relevant information
if(isequal(RobotLocation, GoalLocation))
    disp('Goal Reached!');
else
    disp('Goal Not Achieved... :(');
end

disp(strcat('Path Length =  ', num2str(pathLength)));




