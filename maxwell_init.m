%% maxwell_init
% Function to start building a simulation model for Maxwell.

%% Description
% |maxwell_init| sets in-place the necessary building blocks for a user
% to start describing and then to solve an electromagnetic simulation.

%% Syntax
% |grid = maxwell_init(omega, x, y, z);| is the basic syntax.
% Here, |omega| is the angular frequency of the simulation
% while |x|, |y|, and |z| are the location (monotonically increasing)
% of the grid points in the x-, y-, and z-directions.
%
% |[grid, epsilon, J] = maxwell_init(omega, x, y, z);| also outputs
% default values for |epsilon| and |J|.
%
% |grid = maxwell_init(omega, x, y, z, 'nopml');| removes the absorbing
% boundary conditions on the simulation grid. Options |'nopmlx'|, |'nopmly'|, 
% and |'nopmlz'| can also be used in combination.
%
% |grid = maxwell_init(omega, x, y, z, {[x0 y0 z0], [x1 y1 z1], [dx dy dz]});|
% allows for the creation of grids which dynamically increase in resolution.
% Specifically the points within |(x1, y1, z1)| and |(x1, y1, z1)| are gridded
% with a resolution of |(dx, dy, dz)|. Multiple high-resolution boxes are allowable.

%% Example 1
% This first example demonstrates the generation of a uniformly-gridded
% simulation domain that stretches from (-100, -100, -40) to (100, 100, 40).
% By default, absorbing layers known as PML (perfectly matched layers) are
% inserted around the domain.
%
%   % Simple uniform 200 x 200 x 80 grid.
%   omega = 0.08; % Unit-less frequency for the simulation.
%   [grid, epsilon, J] = maxwell_init(omega, -100:100, -100:100, -40:40);


%% Example 2
% If absorbing layers are not wanted, then the optional input parameter 'nopml'
% can be added. Additionally, 'nopmlx', 'nopmly', and 'nopmlz' can be used
% to remove absorbing layers in only select directions. Note that if pml is not
% used, the boundary condition defaults to periodic.
%
%   % No absorbing layers.
%   [grid, epsilon, J] = maxwell_init(omega, -100:100, -100:100, -40:40, 'nopml');
%
%   % No absorbing layers in y- and z-directions.
%   [grid, epsilon, J] = maxwell_init(omega, -100:100, -100:100, -40:40, ...
%                                       'nopmly', nopmlz');

%% Example 3
% Denser, non-uniform grids can be easily implemented.
%
%   % Want more resolution in th x- and y-directions.
%   [grid, epsilon, J] = maxwell_init(omega, -100:0.25:100, -100:0.25:100, -40:40);

%% Example 4
% Dynamic grid generation is facilitated.
%
%   % Generate a dynamic grid where a central 20x20x20 area is densely gridded.
%   % The grid resolution will be gradually tapered into and out of the 
%   % high-resolution area.
%   [grid, epsilon, J] = maxwell_init(omega, -100:100, -100:100, -40:40, ...
%                                       {[-10 -10 -10], [10 10 10], 0.1});
