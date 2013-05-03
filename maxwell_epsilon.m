%% maxwell_epsilon
% Insert a dielectric structure into the epsilon array.

%% Description
% Updates the epsilon array to include a new dielectric object.

%% Syntax
% |epsilon = maxwell_epsilon(grid, epsilon, my_obj);| inserts a new dielectric
% object into the simulation by updating the epsilon structure. 
% |my_obj| is a function handle that must be of the form specified below.

%% Syntax for function handle description
% |my_obj| is a function handle which accepts a list of |epsilon| values and
% their positions, and updates |epsilon| accordingly.

%% Example 1
% This example shows the generation of a function handle using an inline
% function, which is then used to update epsilon.
%
%   function eps = my_waveguide(epsilon, pos)
%       % This inline function provides the description of the dielectric
%       % distribution in the simulation space is a completely general way.
%       wg_size = [Inf, 20, 10];
%       wg_center = [0, 0, 0];
%       ind = find((pos.y > wg_center(2) - wg_size(2)/2) & ...
%                   (pos.y < wg_center(2) + wg_size(2)/2) & ...
%                   (pos.z > wg_center(3) - wg_size(3)/2) & ...
%                   (pos.z < wg_center(3) + wg_size(3)/2));
%       eps(ind) = 12.25;
%   end
%   
%   % Now update epsilon using the @my_waveguide descriptor.
%   epsilon = maxwell_epsilon(grid, epsilon, @my_waveguide);


