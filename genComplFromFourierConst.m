% Following "M-ARY MUTUALLY ORTHOGONAL COMPLEMENTARY GOLD CODES"
% We generate sequences of constant magnitude
% and take their IFFT.
% The real and imaginary parts should be constant.

lenSeq = 5;

freqVect = zeros(lenSeq,1);
for i = 1:lenSeq
    % Pick a random real magnitude for this sequence element
    realMag = rand();
    imMag = sqrt(1-realMag^2);   
    
    freqVect(i) = realMag + sqrt(-1)*imMag;
end

% Take the inverse Fourier transform
timeVect = ifft(freqVect);
xcorr(timeVect);
% seq1 = real(timeVect)
% seq2 = imag(timeVect)
% xcorr(seq1,seq1) + xcorr(seq2,seq2)
% dot(seq1,seq2)

% Doesn't seem to work.
% I think there needs to be more restrictions on the codes.

% "generated by applying an IDFT to N +1 bipolar Gold sequences"
goldseq = comm.GoldSequence('FirstPolynomial','x^5+x^2+1',...
    'SecondPolynomial','x^5+x^4+x^3+x^2+1',...
    'FirstInitialConditions',[0 0 0 0 1],...
    'SecondInitialConditions',[0 0 0 0 1],...
    'Index',4,'SamplesPerFrame',10);
x = step(goldseq)
timeVect = ifft(x);
seq1 = real(timeVect);
seq2 = imag(timeVect);
xcorr(seq1,seq1) + xcorr(seq2,seq2)
dot(seq1,seq2)

% These seem to be orthogonal but not complementary...


