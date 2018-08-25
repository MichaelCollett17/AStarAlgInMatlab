function [] = AStar(OccupancyMap, GoalLocation, RobotLocation)
Open = [];
Closed = [];
[rows, cols] = size(OccupancyMap);

% closed array gets all the 1's
% closed array format is x y
closedCounter = 1;
openCounter = 1;
for i=1:rows
    for j=1:cols
        if(OccupancyMap(i,j) == 1)
            Closed(closedCounter,1)=i;
            Closed(closedCounter,2)=j;
            closedCounter=closedCounter+1;
        end
    end
end

heuristic = h(RobotLocation(1), RobotLocation(2), GoalLocation(1), GoalLocation(2));
% open array format is [x,y,parentx,parenty,f]
Open(openCounter,1) = RobotLocation(1);
Open(openCounter,2) = RobotLocation(2);
Open(openCounter,3) = RobotLocation(1);
Open(openCounter,4) = RobotLocation(2);
Open(openCounter,5) = heuristic;
openCounter = openCounter + 1;
[rowSizeOpen, colSizeOpen] = size(openCounter);
while(rowSizeOpen > 0)
    f = 10000;
    temp = [];
    for ridx=1:rowSizeOpen
        if Open(ridx,5) < f
            f = Open(ridx,5);
            temp = Open(ridx,1:5);
        end
        if (temp(1) == GoalLocation(1))&(temp(2)==GoalLocation(2))
            % list must be built already
            break;
        end
        
    end
end

