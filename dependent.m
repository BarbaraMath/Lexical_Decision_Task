
function [RT,buttonpress,correctness]= dependent (prime, target,condition) 
% function that takes prime, target and condition as input arguments, plots
% the fixation cross, prime and target in a predetermined order and
% predefined time duration, also it is used to record reaction time,
% correctness and buttonpress and it gives graphical feedback based on 
% correctness 
% general characteristics of a background for the figure 
set(gcf,'color','k'); % black color background 
axis off; 
set(gcf,'Position',get(0,'Screensize'))% set the figure to a fullscreen
%% Plot Fixation cross 
% plot the fixation cross and pause for 2 seconds 
loc =[0.35 0.5];
g1 = text(loc(1), loc(2), '+','color','white','FontSize',90);
shg;
pause(2);
% after 2 seconds set the visibility of the handle off 
set(g1,'visible','off') 
%% Plot Prime 
% plot prime in white color and pause it for 150 miliseconds    
g2 = text(loc(1), loc(2), prime,'color','white','FontSize',90);
shg;
pause(0.150)
% display a blank window between the prime and the target word for 650 ms 
set(g2,'visible','off') 
pause(0.65) 
%% Plot Target  
% before ploting the target it start to measure time 
tic; 
% plots the target word in white color and pauses it until participant
% presses the button
shg;% optional, safe option if the subject presses the button during prime presentation to come back to the figure 
g3 = text(loc(1), loc(2), target,'color','white','FontSize',90);
keyisdown= waitforbuttonpress; 
% stop measuring time and save it as RT 
RT = toc; 
% if the key is pressed save the key value that was pressed 
if keyisdown 
   buttonpress=get(gcf,'CurrentCharacter');
end  
set(g3, 'visible', 'off') 
%% Correctness 
% press 'L/l' for word and 'A/a' for non-word 

% validity check of the button that is pressed if 'l' or 'a' are not
% pressed then display graphic warning that it is invalid and pause it for 1 
% second and store correctness as 0 
if strcmpi(buttonpress,'l')==0 && strcmpi(buttonpress,'a')==0 
    correctness=0;
    locind = [0.25 0.5];
    error=sprintf('Invalid input');
    text(locind(1), locind(2), error,'color','r','FontSize',90);
    pause(1) 
    clf;    
end
% compare the char and the  buttonpressed, then calculate the correctness and based on the value 
% give visual feedback and pause it for 1 second 
if (condition==1 && strcmpi(buttonpress,'a'))||(condition==2 && strcmpi(buttonpress,'l'))||(condition==3 && strcmpi(buttonpress,'a'))...
    ||(condition==4 && strcmpi(buttonpress,'l'))
        correctness = 0;
        locinc = [0.25 0.5];
        icorr= sprintf('Incorrect!');
        text(locinc(1), locinc(2), icorr,'color','r','FontSize',90)
        pause(1)
        clf;         
elseif  (condition==1 && strcmpi(buttonpress,'l'))||(condition==2 && strcmpi(buttonpress,'a'))||(condition==3 && strcmpi(buttonpress,'l'))...
        ||(condition==4 && strcmpi(buttonpress,'a'))
        correctness = 1;
        locor = [0.25 0.5];
        corr= sprintf('Correct!');
        text(locor(1), locor(2), corr,'color','g','FontSize',90)
        pause(1) 
        clf; 
end
end