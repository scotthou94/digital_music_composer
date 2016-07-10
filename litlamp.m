%produce tunes using the song function

k = 0:1:12;
twelve = 440.*2.^(k./12);
A = twelve([1 3 5 6 8 10 12 13]);
fs=8000;

%the tunes are : majorA(3 2 1 2 3 3 3 2 2 2 3 5 5 3 2 1 2 3 3 3 2 2 2 3 2)
%I add some pauses in the notes as song(0,1) to make the tunes sound more
%natural
%the duration can be altered using the song function therefore I didn`t use
%the vector dur

y = [song(A(3),1.5) song(A(2),0.5) song(A(1),1) song(A(2),1) song(A(3),1) song(A(3),1) song(A(3),1) song(0,1)...
    song(A(2),1) song(A(2),1) song(A(2),1) song(0,1) song(A(3),1) song(A(5),1) song(A(5),1) song(0,1) song(A(3),1.5)...
    song(A(2),0.5) song(A(1),1) song(A(2),1) song(A(3),1) song(A(3),1) song(A(3),1) song(0,1) song(A(2),1.5)...
    song(A(2),0.5) song(A(3),1) song(A(2),1) song(A(1),2)];
soundsc(y,8000);
y = y/max(abs(y));
wavwrite(y,fs,16,'littlelamb.wav');