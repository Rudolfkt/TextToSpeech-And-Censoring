
%Windows based Assembly
NET.addAssembly('System.Speech');

%Defining argunents
userPrompt = 'What do you want to hear?;';
titleBar = 'Text to Speech ';
defaultString = 'Well damn, I prefer Python programming to MATLAB programming!';

% Getting user's text  
finishedmessage = inputdlg(userPrompt, titleBar, 5, {defaultString});
fin = string(lower(finishedmessage)) ;

%censor words.
swearwords = ["Shit", "shitty", "damn", "arse", "bitch", "twat", "bollocks"];  
fin = erase(fin,swearwords) ;
disp(fin)
 
%For empty box
if isempty(fin)
  return;
end % Exit programme if they clicked Cancel.

AudioSound = System.Speech.Synthesis.SpeechSynthesizer; %accessed lib from .net assembly
AudioSound.Volume = 85;
AudioSound.Rate = -1;
Speak(AudioSound, fin);

