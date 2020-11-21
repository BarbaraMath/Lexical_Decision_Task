%% Practice_Trials_LDT 
% Practice script that prompts the experimenter for participant number, age and
% gender, gives the main instruction for the practice and controls the
% flow of the main function (pickword and dependent). It also keeps track of 
% the primes and targets that are being displayed to avoid the repetition
% of the stimuli during the session. 
% Put Cond_mats on your path before starting the experiment 
%% Participant Details and main variables 
% Input for experimenter
session = 0; % determines the practice session
pract_cond=1:4;
parnum_trial = input('Please enter the participant number: ');
%Define if it's practice trials (0) or Main Experimental procedure (1)
%% Message box for instructions 
% % these section will make the pop up window with short instructions 
% % and will prompt the participant to click the 'Start' button in order to 
% % continue with the experiment 
d = dialog('Position',[400 150 600 350],'Name','Instructions');
   txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[120 100 400 200],...
               'String', 'Dear participant, in the following experiment, you will be presented with pairs of words flashing rapidly. First you will see a cross. Please focus on it. Then you will be presented with a pair of words one after the other. We ask you to decide whether the second one is an actual word or not. You need to press ''l'' if the target is a word and ''a'' if it is a non-word. Make a response as soon as the second word appears. There is no time pressure but you should respond as fast as possible, without making mistakes. You will first do some practice. When you are ready, please press ''Start'' to begin.'); 
   txt.FontSize= 10; 
   btn = uicontrol('Parent',d,...
           'Position',[275 50 70 30],...
           'String','Start',...
           'Callback','delete(gcf)');
   btn.FontSize=12;
waitfor(btn);
%% Add the tables in the workspace and add them on your path  
% data_dir = 'Cond_mats' 
% load('Pract_4.mat')
% load('Pract_3.mat')
% load('Pract_2.mat')
% load('Pract_1.mat')
%% Presentation of the stimuli and recording of the dependent variables 
% there will be four conditions ; 
% condition 1 -  prime and target are related and the target is a word 
% condition 2 - prime and target are related and the target is a non-word 
% condition 3 - prime and target are unrelated an the target is a word 
% condition 4 - prime and target are unrelated and the target is a non-word 

% preallocation of the arrays and structures being saved 
ldt_data_pract = struct('Parnum',[], 'Session',[],'Condition',[],'Row',[],'Prime',[],'Target',[],'ButtonPress',[],'Correctness',[],'ResponseTime',[]);
pract_matrix_selrow= zeros(4,4);
pract_counter = 0; 
pract_counter1 = 0; 
pract_counter2 = 0; 
pract_counter3 = 0; 
pract_counter4 = 0; 

% the while loop will run the experiment for n_trial times but as there is
% a command for avoiding repetition we are not exactly sure how many
% n_trial there are, but total number is 16 that are stored with
% corresponding prime and target stimuli 
 
while ismember(zeros,pract_matrix_selrow)
pract_counter = pract_counter + 1; 
rng('shuffle');
% each condition is randomly picked  
condition = randi(length(pract_cond)); 
% based on the condition upload the table of stimuli and present specific
% prime and specific target 
[prime,target,n_row] = pickword(condition,session);
% in order to not repeat the words during the trials check in the matrix_selrow if the selected
% n_row in a specific condition has already been shown 
if ismember(n_row,pract_matrix_selrow(condition,:)) == 0
    if condition == 1 
        pract_counter1 = pract_counter1 + 1;
        pract_matrix_selrow(condition,pract_counter1) = n_row;
    elseif condition == 2 
        pract_counter2 = pract_counter2 + 1;
        pract_matrix_selrow(condition,pract_counter2) = n_row; 
    elseif condition == 3 
        pract_counter3 = pract_counter3 + 1;
        pract_matrix_selrow(condition, pract_counter3) = n_row; 
    elseif condition == 4 
        pract_counter4 = pract_counter4 + 1;
        pract_matrix_selrow(condition, pract_counter4) = n_row; 
    end 
 % plot the chosen prime and target in a specific setting 
[RT,buttonpress,correctness]= dependent(prime, target,condition);

%Store_Data
ldt_data_pract(pract_counter) = struct('Parnum',[parnum_trial],'Session',[session],'Condition',[condition],'Row',[n_row],'Prime',[prime],'Target',[target],'ButtonPress',[buttonpress],'Correctness',[correctness],'ResponseTime',[RT]);

elseif ismember(n_row,pract_matrix_selrow(condition,:)) == 1
    pract_counter = pract_counter - 1; 
end 
end
%% Creating Mat-file for every participant 
% storing the data structure for every participant separately under the
% name : SubN.mat in the subfolder 'Data' in the folder LDT 
data_dir='Data'; 
resultname = strcat('Subpractice',num2str(parnum_trial),'.mat');
result_name = fullfile(data_dir,resultname);
save(result_name,'ldt_data_pract');
%% Message Box for ending 
% these section will make the pop up window with an ending message if there
% are no more zeros in the matrix 
% and will prompt the participant to click the 'End' button in order to 
% end the experiment 
if ismember(zeros,pract_matrix_selrow)== 0 
d = dialog('Position',[400 150 600 350],'Name','End');
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[120 100 400 100],...
               'String','The practice is over. Thank you for participating!');
    txt.FontSize=15;
    btn = uicontrol('Parent',d,...
           'Position',[275 100 70 25],...
           'String','End',...
           'Callback','delete(gcf)');
    btn.FontSize=13;
waitfor(btn);
close ALL;
end