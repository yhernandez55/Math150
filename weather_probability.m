clear all
close all
clc

% probabilities of each type of day
sunnyprob = 0.4;
rainyprob = 0.3;
cloudyprob = 0.3;

% # of weeks
numweeks = 100;

% # of Days in a week
weeklength = 7;

% # of consecutive rainy days 
consecrdays = 3;

% Initialize the count of weeks with at least three consecutive rainy days
count = 0;

% Loop over the number of weeks 
for i = 1:numweeks
    % Initialize a vector to store the weather for the week
    weather = zeros(1, weeklength);
    
    % Loop over each day in the week 
    for j = 1:weeklength
        r = rand(); 
        if r < sunnyprob
            weather(j) = 0; % sunny
        elseif r < sunnyprob + rainyprob
            weather(j) = 1; % rainy
        else
            weather(j) = 2; % cloudy
        end
    end
    
    % Check for the amount of consecutive rainy days
    for j = 1:weeklength-consecrdays+1
        if all(weather(j:j+consecrdays-1) == 1)
            count = count + 1;
            break; 
        end
    end
end

% Estimatation of the probability of at least three consecutive rainy days
prob = 100*(count / numweeks);


fprintf('The estimated probability of at least three consecutive rainy days in one week is %f.\n', prob);
