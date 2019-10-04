% Every parts of the code are seperated by section 
% Use Run and Advance or Ctrl + Enter to run instead of Run or F5

% Noise part might take up to 1 minute to complete

%% Noise = 1% is Introduced to the Interated Prisoner's Dilemma Game
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
    R = 3;
    P = 1;
    S = 0;
    
    % Initialize the noise percentage
    noisePercentage = 1;
    noise = noisePercentage/100;

    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
               
                        % Generate a random number
                        x(agentNo,5) = rand;
                        x(enemyNo,5) = rand;

                        if x(agentNo,5) < noise
                            agentCurrentPlay = ~agentCurrentPlay;
                        end
                        if x(enemyNo,5) < noise
                            enemyCurrentPlay = ~enemyCurrentPlay;
                        end
                  
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,6,"descend");
    max = orderByScore(1,6);
        averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,6) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
title('Noise = 1%');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end






%% Noise = 5% is Introduced to the Interated Prisoner's Dilemma Game
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
    R = 3;
    P = 1;
    S = 0;
    
    % Initialize the noise percentage
    noisePercentage = 5;
    noise = noisePercentage/100;

    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
               
                        % Generate a random number
                        x(agentNo,5) = rand;
                        x(enemyNo,5) = rand;

                        if x(agentNo,5) < noise
                            agentCurrentPlay = ~agentCurrentPlay;
                        end
                        if x(enemyNo,5) < noise
                            enemyCurrentPlay = ~enemyCurrentPlay;
                        end

                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,6,"descend");
    max = orderByScore(1,6);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,6) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
title('Noise = 5%');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% Noise = 10% is Introduced to the Interated Prisoner's Dilemma Game
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
    R = 3;
    P = 1;
    S = 0;
    
    % Initialize the noise percentage
    noisePercentage = 10;
    noise = noisePercentage/100;

    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
               
                        % Generate a random number
                        x(agentNo,5) = rand;
                        x(enemyNo,5) = rand;

                        if x(agentNo,5) < noise
                            agentCurrentPlay = ~agentCurrentPlay;
                        end
                        if x(enemyNo,5) < noise
                            enemyCurrentPlay = ~enemyCurrentPlay;
                        end
                  
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,6,"descend");
    max = orderByScore(1,6);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,6) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
title('Noise = 10%');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% Noise = 25% is Introduced to the Interated Prisoner's Dilemma Game
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
    R = 3;
    P = 1;
    S = 0;
    
    % Initialize the noise percentage
    noisePercentage = 25;
    noise = noisePercentage/100;

    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
               
                        % Generate a random number
                        x(agentNo,5) = rand;
                        x(enemyNo,5) = rand;

                        if x(agentNo,5) < noise
                            agentCurrentPlay = ~agentCurrentPlay;
                        end
                        if x(enemyNo,5) < noise
                            enemyCurrentPlay = ~enemyCurrentPlay;
                        end

                  
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,6,"descend");
    max = orderByScore(1,6);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,6) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
title('Noise = 25%');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% Noise = 50% is Introduced to the Interated Prisoner's Dilemma Game
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
    R = 3;
    P = 1;
    S = 0;
    
    % Initialize the noise percentage
    noisePercentage = 50;
    noise = noisePercentage/100;

    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
               
                        % Generate a random number
                        x(agentNo,5) = rand;
                        x(enemyNo,5) = rand;

                        if x(agentNo,5) < noise
                            agentCurrentPlay = ~agentCurrentPlay;
                        end
                        if x(enemyNo,5) < noise
                            enemyCurrentPlay = ~enemyCurrentPlay;
                        end
                  
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,6,"descend");
    max = orderByScore(1,6);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,6) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
title('Noise = 50%');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% T = R + 1 where the Constraint for the IPD Game is Satisfied
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister"); 
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 4;
    R = 3;
    P = 1;
    S = 0;
    
    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
                              
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    max = orderByScore(1,5);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,5) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
xlabel('Generation');
ylabel('Average Payoff');
title('T = R + 1');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% T = R + 0.5 where the Constraint for the IPD Game is Satisfied
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 3.5;
    R = 3;
    P = 1;
    S = 0;
    
    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
                              
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    max = orderByScore(1,5);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,5) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
xlabel('Generation');
ylabel('Average Payoff');
title('T = R + 0.5');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% T = R - 0.5 where the Constraint for the IPD Game is No Longer Satisfied
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 2.5;
    R = 3;
    P = 1;
    S = 0;
    
    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
                              
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    max = orderByScore(1,5);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,5) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
xlabel('Generation');
ylabel('Average Payoff');
title('T = R - 0.5');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% T = R - 1 where the Constraint for the IPD Game is No Longer Satisfied
% Loop seed from 1 to 100
for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
allAvgPayOff = zeros(100,1);
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
x = randi([0 1],20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 2;
    R = 3;
    P = 1;
    S = 0;
    
    % Loop through 20 agents     
    for agentNo = 1 : 20
        % Loop through 20 enemies        
        for enemyNo = 1 : 20
            % To avoid agent to play with itself             
            if(agentNo ~= enemyNo)
                x(agentNo,4) = x(agentNo,1);
                x(enemyNo,4) = x(enemyNo,1);
                % The fourth column in x will be the current play of agents
                agentCurrentPlay = x(agentNo,4);
                enemyCurrentPlay = x(enemyNo,4);
                % Play for 100 rounds
                for round = 1 : 100
                              
                    %if agent and enemy both coorperate
                    if (agentCurrentPlay == 0) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (agentCurrentPlay == 0) && (enemyCurrentPlay == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        agentCurrentPlay = x(agentNo, 2);
                        enemyCurrentPlay = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (agentCurrentPlay == 1) && (enemyCurrentPlay == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        agentCurrentPlay = x(agentNo, 3);
                        enemyCurrentPlay = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
   
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    max = orderByScore(1,5);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,5) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         % 1% chance to mutate
        aRandomNumber = rand;
        
        if aRandomNumber < 0.01
            columnToMutate = randi(3,1);
            orderByScore(x,columnToMutate) = ~orderByScore(x,columnToMutate);
        end  
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
xlabel('Generation');
ylabel('Average Payoff');
title('T = R - 1');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end




