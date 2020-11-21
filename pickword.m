function [prime, target,n_row] = pickword(condition,session) 
% function that takes as input the condition and uploads the table with the
% corresponding prime and target stimuli for that condition. First, it chooses an index at random 
% and takes the cell element from that n_row from the Prime
% field and target field (WordsR/WordsU, NonwordsR/NonwordsU)that will be
% the main output variables (prime - word that will be used for priming
% effect; target - word or nonword that subjets need to respond to; n_row-
% number of the element chosen at random) 
% Function call: pickword(condition) 
if session == 0 
    if condition == 1 
        load('Pract_1.mat')
        n_row = randi(length(Pract_1.Prime));
        prime = char(Pract_1.Prime(n_row));
        target = char(Pract_1.WordsR(n_row));   
    elseif condition == 2
        load('Pract_2.mat')
        n_row = randi(length(Pract_2.Prime));
        prime = char(Pract_2.Prime(n_row));
        target = char(Pract_2.NonWordsR(n_row));
    elseif condition == 3
        load('Pract_3.mat')
        n_row = randi(length(Pract_3.Prime));
        prime = char(Pract_3.Prime(n_row));
        target = char(Pract_3.WordsU(n_row));
    elseif condition == 4
        load('Pract_4.mat')
        n_row = randi(length(Pract_4.Prime));
        prime = char(Pract_4.Prime(n_row));
        target = char(Pract_4.NonWordsU(n_row)); 
    end    
elseif session == 1 
    if condition == 1 
        load('Cond_1.mat')
        n_row = randi(length(Cond_1.Prime));
        prime = char(Cond_1.Prime(n_row));
        target = char(Cond_1.WordsR(n_row));   
    elseif condition == 2
        load('Cond_2.mat')
        n_row = randi(length(Cond_2.Prime));
        prime = char(Cond_2.Prime(n_row));
        target = char(Cond_2.NonwordsR(n_row));
    elseif condition == 3
        load('Cond_3.mat')
        n_row = randi(length(Cond_3.Prime));
        prime = char(Cond_3.Prime(n_row));
        target = char(Cond_3.WordsU(n_row));
    elseif condition == 4
        load('Cond_4.mat')
        n_row = randi(length(Cond_4.Prime));
        prime = char(Cond_4.Prime(n_row));
        target = char(Cond_4.NonwordsU(n_row)); 
    end
end
end