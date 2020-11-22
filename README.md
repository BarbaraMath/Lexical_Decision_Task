# Lexical Decision Task Documentation

### General Info
The underlying processes of word semantic memory have been in the center of research interest in psycholinguistics for many decades. The Lexical Decision Task is a test excessively used in the literature, where the participant is presented with stimluli and needs to identify whether they are words or pseudo-words. It has been demonstrated (White, 1986) that when presenting a non-word, participants' response time is generally slower, a finding which suggests that non-words require more mental comparisons in the lexicon. More specifically, it has been addressed that the number of potential associations between the word presented and the words that are stored in the lexicon is increased, especially when the non- word is phonetically/orthographically legal.

What is more, it has been observed that decision maker is able to identify the correct word faster, when they are presented with pairs of semantically related words (e.g. doctor- nurse) in comparison to unrelated stimuli (e.g. doctor – butter). This phenomenon is called _semantic priming_ and it occurs because the priming word activates related concepts in the lexicon, facilitating the recognition of the word presented afterwards (Joordens & Becker, 1997).

### Stimuli
The word pairs are based on the study of White (1986), but many of them have been assigned randomly to their opposite category (related words-related non-words and vice versa). Also, the pseudo-words were created by the Multilingual Pseudo-word Generator 'Wuggy' (Keuleers & Brysbaert, 2010) and consist of degraded real words with an overlap of 2/3. We collected 45 pairs<sup>1</sup> in each of the four categories, resulting in 180 trials. Participants are presented with pairs of words; first the priming word flashes very quickly, and then the target word is presented, and they have to decide if it is a word or a pseudo-word. In an effort to manipulate the difficulty of the task, we chose only non-words that are orthographically legal (e.g. pluset). We avoided orthographically illegal words (e.g. brnae) and pseudo- homophones (e.g. brane) (Yap, Balota & Tan, 2012).

<sup>1</sup> word pairs have not been uploaded yet, neither the condition mat files, which are requested in order to run the experiment

### Hypotheses:
1. RTs for recognizing semantically related words will be faster than RT for recognizing semantically unrelated words.
2. There will be more false positive errors for non-word versions in the semantically related condition than in the unrelated one.

### Requirements:

1. Prompt the participant for details: participant number (anonymity), gender, age
2. Instructions ← address to participant to be as fast as possible while being accurate
3. Design: black screen, white letters
4. Practice Trials: 16 (four from each category)
5. Trial:
  - a. fixation cross (2000 ms)
  - b. prime (150 ms)
  - c. blank screen (650 ms)
  - d. target word - (no time limitation in response time)
  - e. response that corresponds to button press: 'l' for word, 'a' for non-word
  - f. feedback: correct/incorrect on the screen with red/green color
6. Stimuli: randomization of all 180 pairs
  - a. prime related - word (dolphin-shark)
  - b. prime unrelated - word (butter-doctor)
  - c. prime related – non-word (puppy - cet)
  - d. prime unrelated – non-word (table - dack)
7. There will be one break after half of the trials have passed (90 trials)
8. Dependent Variables: They will be stored in a structure for each trial.
  - a. Reaction time
  - b. Accuracy (1 for correct, 0 for incorrect)
  
### Global Design

**Main Script**
- Participant Details
- Instructions
- Pre allocation of data storage strufture
- Trial & Condition Counters
- Pick random condition
  - **Pick word**:
    - Pick random prime & its corresponding target word based on random condition
- While the selected pair does not exist in the condition matrix
- Fix counters in each trial
  - **Dependent Function**
    - Plot fixation cross, prime, target
    - Reaction Time
    - Buttonpress
    - Correctness
- Store Data
- Save Data per participant
- End

### Bugs & Limitations 

1. Unlimited presentation of the target word: the target words are being presented until the participant makes a response (with unlimited duration). The problem can be solved by using Kb built-in-functions in Psychtoolbox. We tried to control for this problem with instructing every participant to respond as fast as possible. Therefore, this instruction is crucial for the current code.

2. Controlling the stimuli presentation: in the main script we constructed a matrix that will keep track of number of random rows that were selected in each loop, but in order to do it we needed to initialize four counters for each condition. This process might consume more memory and time for processing and continuing with the script.

3. Writing instructions within a script: based on the fact that instructions are too long it will make the script longer and wider in size. In the future it might be useful to use a combination of read text built-in-functions or uploading the text from .doc or .txt files, transferring them to a char variable and plotting them to a figure.

_This code was co-created with Tiffany Matej Hrkalovic._

### References

- Joordens, S., & Becker, S. (1997). The long and short of semantic priming effects in lexical decision. Journal of Experimental Psychology: Learning, Memory, and Cognition, 23(5), 1083 -1105.
- Keuleers, E., &Brysbaert, M. (2010). Wuggy: A multilingual pseudoworgenerator. Behavior Research Methods 42(3), 627-633.
- White, H. (1986). Semantic priming of nonwords in lexical decision. The American journal of psychology, 479-485.
- Yap, M. J., Balota, D. A., & Tan, S. E. (2013). Additive and interactive effects in semantic priming: Isolating lexical and decision processes in the lexical decision task. Journal of Experimental Psychology: Learning, Memory, and Cognition, 39(1), 140.
