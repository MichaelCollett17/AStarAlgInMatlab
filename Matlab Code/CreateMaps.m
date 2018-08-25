%This is just for the instructor
%Create occupancy maps
OccupancyMap = zeros(100, 100);
%Walls
OccupancyMap(1,:) = 1;
OccupancyMap(end,:) = 1;
OccupancyMap(:,1) = 1;
OccupancyMap(:,end) = 1;
%Obstacles
OccupancyMap(30, 1:70) = 1;
OccupancyMap(70, 1:35) = 1;
OccupancyMap(70, 65:end) = 1;
PlotOccupancyMap(OccupancyMap, [1,1]);  %Print the occupancy map with a stock goal
