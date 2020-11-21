%% LDT_Script1 
% Main script that prompts the participant for participant number, age and
% gender, gives the main instruction for the experiment and controls the
% flow of the main function (pickword and dependent). It also keeps track of 
% the primes and targets that are being displayed to avoid the repetition
% of the stimuli during the session 
% In order for the script to work please check that all of the matrices
% from the Cond_mats are in you Matlab path 

%% Participant Details
%  this makes a pop-up window that will prompt the subject for Participant
%  Number, Age and Gender 
prompt = {'Please enter your participant number: ','Age: ','Gender: '};
name = 'Participant Details';
numlines = 3;
% and it will store the output as variables 
dlganswer = inputdlg(prompt,name,numlines)';
parnumber = dlganswer{1};
parage = dlganswer{2};
pargender = dlganswer{3};
%% Message box for instructions 
% % these section will make the pop up window with short instructions 
% % and will prompt the participant to click the 'Start' button in order to 
% % continue with the experiment 
d = dialog('Position',[400 150 600 350],'Name','Instructions');
   txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[120 100 400 200],...
               'String','Dear participant, you are now ready to start with the experiment. Remember you need to press ''l'' if the target is a word and ''a'' if it is a non-word. This experiment is not time-limited, but we ask you to be as fast as possible, while also being accurate. When you are ready, please press ''Start'' to begin.'); 
   txt.FontSize= 14; 
   btn = uicontrol('Parent',d,...
           'Position',[275 100 70 30],...
           'String','Start',...
           'Callback','delete(gcf)');
   btn.FontSize=12;
waitfor(btn);
%% Presentation of the stimuli and recording of the dependent variables 
% there will be three conditions ; 
Cond=1:3;

%preallocation of the arrays and structures being saved 
rl_data()= struct('Parnum',[],'Parage',[],'Pargender',[],'Condition',[],...
           'ButtonPress',[],'ChoiceA',[],'ChoiceB',[],'Reward',[],'Outcome',[],'ResponseTime',[]);
% matrix_selrow= zeros(3,4);
% counter = 0; 
% counter1 = 0; 
% counter2 = 0; 
% counter3 = 0; 
% the for loop will run the experiment for n_trial times 
for trials = 1:30 
    rng('shuffle');
% each condition is randomly picked  
    condition = randi(length(Cond)); 

    [pickA,pickB,response_time, reward, outcome, buttonpress] = main_exp(condition);
%    if counter < 12
%         counter = counter + 1; 
%           if condition == 1 
%                counter1 = counter1 + 1;            
%          elseif condition == 2 
%                  counter2 = counter2 + 1;
%          elseif condition == 3 
%                 counter3 = counter3 + 1;
%           end 
%    end

    %Store_Data
    rlt_data(trials) = struct('Parnum',[parnumber],'Parage',[parage],'Pargender',[pargender],'Condition',[condition],...
           'ButtonPress',[buttonpress],'ChoiceA',[pickA],'ChoiceB',[pickB],'Reward',[reward],'Outcome',[outcome],'ResponseTime',[response_time]);

%% Creating Mat-file for every participant
% storing the data structure for every participant separately under the
% name : SubN.mat in the subfolder 'Data' in the folder LDT 
data_dir='Data'; 
resultname = strcat('Sub',num2str(parnumber),'.mat');
result_name = fullfile(data_dir,resultname);
save(result_name,'rl_data');
%% Message Box for ending 
% these section will make the pop up window with an ending message if there
% are no more zeros in the matrix 
% and will prompt the participant to click the 'End' button in order to 
% end the experiment 
d = dialog('Position',[400 150 600 350],'Name','End');
    txt = uicontrol('Parent',d,...
               'Style','text',...
               'Position',[120 100 400 100],...
               'String','The experiment is over. Thank you for participating!');
    txt.FontSize=15;
    btn = uicontrol('Parent',d,...
           'Position',[275 100 70 25],...
           'String','End',...
           'Callback','delete(gcf)');
    btn.FontSize=13;
waitfor(btn);
close ALL;
end

