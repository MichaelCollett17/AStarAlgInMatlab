function successors = getSuccessors(x, y, g, GoalLocation)
%could have written this as a loop but my Matlab skills are weak
newg = g+1;
successors(1,1) = x-1;
successors(1,2) = y-1;
successors(1,3) = x;
successors(1,4) = y;
successors(1,5) = newg + h(x-1,y-1,GoalLocation(1), GoalLocation(2));
successors(1,6) = newg;

successors(2,1) = x;
successors(2,2) = y-1;
successors(2,3) = x;
successors(2,4) = y;
successors(2,5) = newg + h(x,y-1,GoalLocation(1), GoalLocation(2));
successors(2,6) = newg;

successors(3,1) = x+1;
successors(3,2) = y-1;
successors(3,3) = x;
successors(3,4) = y;
successors(3,5) = newg + h(x+1,y-1,GoalLocation(1), GoalLocation(2));
successors(3,6) = newg;

successors(4,1) = x-1;
successors(4,2) = y;
successors(4,3) = x;
successors(4,4) = y;
successors(4,5) = newg + h(x-1,y,GoalLocation(1), GoalLocation(2));
successors(4,6) = newg;

successors(5,1) = x+1;
successors(5,2) = y;
successors(5,3) = x;
successors(5,4) = y;
successors(5,5) = newg + h(x+1,y,GoalLocation(1), GoalLocation(2));
successors(5,6) = newg;

successors(6,1) = x-1;
successors(6,2) = y+1;
successors(6,3) = x;
successors(6,4) = y;
successors(6,5) = newg + h(x-1,y+1,GoalLocation(1), GoalLocation(2));
successors(6,6) = newg;

successors(7,1) = x;
successors(7,2) = y+1;
successors(7,3) = x;
successors(7,4) = y;
successors(7,5) = newg + h(x,y+1,GoalLocation(1), GoalLocation(2));
successors(7,6) = newg;

successors(8,1) = x+1;
successors(8,2) = y+1;
successors(8,3) = x;
successors(8,4) = y;
successors(8,5) = newg + h(x+1,y+1,GoalLocation(1), GoalLocation(2));
successors(8,6) = newg;