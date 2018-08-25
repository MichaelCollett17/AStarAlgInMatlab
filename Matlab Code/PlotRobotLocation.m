function [  ] = PlotRobotLocation( RobotLocation )
%This function plots the robot location on the map
persistent Rob_handle
persistent path_handle
scaling = 10;
if(isempty(Rob_handle))
    Rob_handle = plot ((RobotLocation(1)-1) * scaling + .5, (RobotLocation(2)-1) * scaling + .5, 'r', 'Marker', 's', 'MarkerSize', scaling-2, 'MarkerFaceColor', 'r');
    path_handle = plot((RobotLocation(1)-1) * scaling + .5, (RobotLocation(2)-1) * scaling + .5, 'r');
else
    set(Rob_handle, 'Xdata', (RobotLocation(1)-1) * scaling + .5, 'Ydata', (RobotLocation(2)-1) * scaling + .5);
    set(path_handle, 'Xdata', [get(path_handle,'Xdata'),(RobotLocation(1)-1) * scaling + .5]);
    set(path_handle, 'Ydata', [get(path_handle,'Ydata'),(RobotLocation(2)-1) * scaling + .5]);
end


end

