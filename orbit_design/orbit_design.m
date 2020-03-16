%% Cuby Project - Technical University of Munich
%  Purpose: Orbit design
%  Author: Max Helleis
%  Date:   12.03.2020
%--------------------------------------------------------------------------
close all, clear all, clc;
%% Add subdirectories to path
addpath('classes');
addpath('functions');

%% Define range of orbit height and nodal days and inclination
hr = [350, 450];                            % altitude range in km
ndr = [1, 3];                               % nodal days range 
i = 's';                                    % stands for 'sun-synchronous'

% Compute repeat orbit parameters
rop = RepOrbParam(hr,ndr,i);

% Compute orbit positions and velocities from the orbit parameters
nod = rop(1,1);                 % number of nodal days
nor = rop(1,2);                 % number of revolutions
rep = 0;                        % set exact repeat orbit to False
num = 10;                       % Sampling rate in seconds
dur = 2;                        % Length of the dataset in days
sma = (rop(1,3) + 6378)*1000;   % semi-major-axis in km
inc = rop(1,4);                 % inclination angle in degrees
lan = 0;                        % initial RAAN in degrees
man = 0;                        % initial mean anomaly 
ecc = 0;                        % eccentricity
aop = 0;                        % initial Argument of Perifee in degrees

[efp,tim,iop]=reporbgen_noderot2(nod,nor,rep,num,dur,sma,inc,lan,man,ecc,aop);

%% Compute sensor GSD and swath width for given orbits

% define sensor objects and compute swathwidth and GSD at a given altitude
MultiScape100 = CubySensor('MultiScape100', 580e-3, 5.4e-6, 4096);
[sw GSD] = MultiScape100.getSwathwidthGSD(rop(1,3)*1000);

%% Plot the orbits

parameters = [sma, lan, inc, ecc, aop, sw/1000, GSD, rop(1,3)];
plot_orbits3D(efp, parameters), hold on;

%% Plot Bavaria area on top of earth coast
Earth_coast(2)
hold on;
Bavaria_border(2)