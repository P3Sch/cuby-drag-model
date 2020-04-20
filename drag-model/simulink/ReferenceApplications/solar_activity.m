%% Import data from text file.
% Script for importing data from the following text file:
%
%    E:\OneDrive\OneDrive - tum.de\GDrive\Repo\cuby\drag-model\simulink\ReferenceApplications\apr2020f10_prd.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2020/04/18 11:25:46


% This program extracts the F10.7, Ap values from the .txt file provided 
% by Marshall Solar Cycle Forecast: https://www.nasa.gov/msfcsolar
% download data from:
% https://www.nasa.gov/sites/default/files/atoms/files/apr2020f10_prd.txt
% !! require monthly update for the latest forecast

% output:
% Decimal year, F10.7, Ap

% Program start
% import data
data = importdata('./ReferenceApplications/apr2020f10_prd.txt');
data1 = data.textdata(6:end,:);  % skip first 6 rows (header)

Solar_Activity(:,1) = str2double(data1(:,1));
Solar_Activity(:,[2,3]) = str2double(data1(:,[4,7]));
clearvars data data1
%
% save('SM_data.mat','SM')

% %% Initialize variables.
% url = "https://www.nasa.gov/sites/default/files/atoms/files/apr2020f10_prd.txt";
% solarData = webread( url );
% 
% filename = '.\ReferenceApplications\apr2020f10_prd.txt';
% startRow = 6;
% endRow = 138;
% 
% %% Format for each line of text:
% %   column1: double (%f)
% %	column2: categorical (%C)
% %   column3: double (%f)
% %	column4: double (%f)
% %   column5: double (%f)
% %	column6: double (%f)
% %   column7: double (%f)
% %	column8: double (%f)
% % For more information, see the TEXTSCAN documentation.
% formatSpec = '%10f%6C%8f%10f%10f%10f%10f%f%[^\n\r]';
% 
% %% Open the text file.
% fileID = fopen(filename,'r');
% 
% %% Read columns of data according to the format.
% % This call is based on the structure of the file used to generate this
% % code. If an error occurs for a different file, try regenerating the code
% % from the Import Tool.
% textscan(fileID, '%[^\n\r]', startRow-1, 'WhiteSpace', '', 'ReturnOnError', false);
% dataArray = textscan(fileID, formatSpec, endRow-startRow+1, 'Delimiter', '', 'WhiteSpace', '', 'TextType', 'string', 'ReturnOnError', false, 'EndOfLine', '\r\n');
% 
% %% Close the text file.
% fclose(fileID);
% 
% %% Post processing for unimportable data.
% % No unimportable data rules were applied during the import, so no post
% % processing code is included. To generate code which works for
% % unimportable data, select unimportable cells in a file and regenerate the
% % script.
% 
% %% Create output variable
% apr2020f10prd = table(dataArray{1:end-1}, 'VariableNames', {'TIME','MO','F10_7_95','F10_7_50','F10_7_05','GEOMAGNETICINDEX_95','GEOMAGNETICINDEX_50','GEOMAGNETICINDEX_05'});
% 
% %% Clear temporary variables
% clearvars filename startRow endRow formatSpec fileID dataArray ans;