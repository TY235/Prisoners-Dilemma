% Every parts of the code are seperated by section 
% Use Run and Advance or Ctrl + Enter to run instead of Run or F5

%% Iterated Prisoner's Dilemma Simulation with Only One Seed
% Loop seed from 1 to 100
allAvgPayOff = zeros(100,1);

% Initialize a 100 x 1 matrix to store all average pay off 
rng(97, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
% 0 = coorperate
% 1 = defect
x = randi([0 1],20,3);


% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
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
                
                % Play for 100 rounds
                for round = 1 : 100
                    % if agent and enemy both coorperate
                    if (x(agentNo,4) == 0) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (x(agentNo,4) == 0) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    % Extract the top ten strategies that scored the highest
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
title('Seed = 97');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])






%% Iterated Prisoner's Dilemma Simulation with 100 Seeds 
% Loop seed from 1 to 100
allAvgPayOff = zeros(100,1);

for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
% 0 = coorperate
% 1 = defect
x = randi([0 1],20,3);


% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
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
                
                % Play for 100 rounds
                for round = 1 : 100
                    % if agent and enemy both coorperate
                    if (x(agentNo,4) == 0) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (x(agentNo,4) == 0) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    % Extract the top ten strategies that scored the highest
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
title('Seed = 1:100');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% Iterated Prisoner's Dilemma Simulation Where Every Agents Play All-Defect
% Loop seed from 1 to 100
allAvgPayOff = zeros(100,1);

for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
% 0 = coorperate
% 1 = defect
% Initialize agents' strategies to only play all defect
x = randi(1,20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
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
                
                % Play for 100 rounds
                for round = 1 : 100
                    % if agent and enemy both coorperate
                    if (x(agentNo,4) == 0) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (x(agentNo,4) == 0) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    % Extract the top ten strategies that scored the highest
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
title('Agents Strategy = (D, D, D)');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end





%% A Different Setup for Population Evolve to Cooperate
% Loop seed from 1 to 100
allAvgPayOff = zeros(100,1);

for seed = 1 : 100
% Initialize a 100 x 1 matrix to store all average pay off 
rng(seed, "twister");
% Generate a 20 x 3 matrix that store 20 agents strategies
% 0 = coorperate
% 1 = defect
% Initialize agents' strategies to only play all defect
x = randi(1,20,3);

% Loop for 100 generation
for generation = 1:100
    score = zeros(20,1);
    T = 5;
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
                
                % Play for 100 rounds
                for round = 1 : 100
                    % if agent and enemy both coorperate
                    if (x(agentNo,4) == 0) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + R;
                        score(enemyNo) = score(enemyNo) + R;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent and enemy both defect
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + P;
                        score(enemyNo) = score(enemyNo) + P;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 2);
                    % if agent coorperate but enemy defect
                    elseif (x(agentNo,4) == 0) && (x(enemyNo,4) == 1)
                        score(agentNo) = score(agentNo) + S;
                        score(enemyNo) = score(enemyNo) + T;
                        x(agentNo,4) = x(agentNo, 2);
                        x(enemyNo,4) = x(enemyNo, 3);
                    % if agent defect but enemy coorperate
                    elseif (x(agentNo,4) == 1) && (x(enemyNo,4) == 0)
                        score(agentNo) = score(agentNo) + T;
                        score(enemyNo) = score(enemyNo) + S;
                        x(agentNo,4) = x(agentNo, 3);
                        x(enemyNo,4) = x(enemyNo, 2);

                    end
                end
            end
        end 
    end
    % Combine the agents' strategies with their total scores     
    combine = [x, score];
    % Sort the the data by higheset total score to lowest score
    orderByScore = sortrows(combine,5,"descend");
    % Extract the top ten strategies that scored the highest
    max = orderByScore(1,5);
    averagePayOff = (max)/(19 * 100 * 2);
    % Reset the scores
    orderByScore(:,5) = 0;

    for x = 11 : 20
        % Generate offspring strategy from parent strategy
        orderByScore(x,1:3) = orderByScore(x-10,1:3);
         
        % 1% chance to mutate each column 
          for y = 1:3
            aRandomNumber = rand;
            if aRandomNumber < 0.01
                orderByScore(x,y) = ~orderByScore(x,y); 
            end    
          end
    end

    % Record every generation average payoff 
    allAvgPayOff(generation) = averagePayOff;
    x = orderByScore(:,1:3);
end
% Hold the previous graph
hold on
title('Agents Strategy = (D, D, D) With Different Setup');
xlabel('Generation');
ylabel('Average Payoff');
plot(1:100,allAvgPayOff);
xlim([1 100])
ylim([0 5])
end



