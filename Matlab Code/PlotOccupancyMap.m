function [ ] = PlotOccupancyMap( OccupancyMap , GoalLocation)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
scaling = 10;
[rows, cols] = size(OccupancyMap);
VisualMap = zeros((rows-1) * scaling, (cols-1)*scaling);
for i=1:rows
    for j=1:cols
        if(OccupancyMap(i,j) == 1)
            vi = 1 + scaling * (i-1);
            vj = 1 + scaling * (j-1);
            beginx = max(1, vj-scaling/2);
            endx = min(scaling * (cols-1), vj+scaling/2-1);
            beginy = max(1, vi-scaling/2);
            endy = min(scaling * (rows-1), vi+scaling/2-1);
            VisualMap(beginy:endy,beginx:endx) = 1;
        end
    end
end
figure(1);
clf
imshow(VisualMap);
%some plot formatting
axis on;
set(gca, 'XTick', [100 200 300 400 500 600 700 800 900]);
set(gca, 'YTick', [100 200 300 400 500 600 700 800 900]);
set(gca, 'XTickLabel', [10 20 30 40 50 60 70 80 90]);
set(gca, 'YTickLabel', [10 20 30 40 50 60 70 80 90]);
xlabel('x-axis');
ylabel('y-axis');
hold on;
%Plot the goal location
plot(GoalLocation(1) * scaling, GoalLocation(2)*scaling, 'b', 'Marker', 's', 'MarkerSize', scaling, 'MarkerFaceColor', 'b');
end

