function [ newRobotLocation, obstacleHit, pathLength ] = moveRobot( x_move, y_move, RobotLocation, OccupancyMap )
%Move the robot.  Only 1 unit moves are allowed.  
%In the y direction +1 is down, -1 is up
%In the x direction +1 is right -1 is left.
    persistent p_Length;
    if(isempty(p_Length))
        p_Length = 0;
    end
    pathLength = p_Length;
    %Test Robot movement inputs
    if(abs(x_move) > 1 || abs(y_move) > 1)
        disp('Error: can only move the robot 1 move in each direction');
        newRobotLocation = RobotLocation;
        obstacleHit = 0;
        return;
    end
    if(x_move ~= floor(x_move)) || (y_move ~= floor(y_move))
        disp('Must move the robot only integer values');
        newRobotLocation = RobotLocation;
        obstacleHit = 0;
        return;
    end
    
    %try the move
    newRobotLocation = RobotLocation + [x_move, y_move]';
    
    if(OccupancyMap(newRobotLocation(2), newRobotLocation(1)) == 1)
        obstacleHit = 1;
        newRobotLocation = RobotLocation;
    else
        obstacleHit = 0;
        p_Length = p_Length + 1;
    end
    pathLength = p_Length;
end

