%T is the X coordinate of your graph (time tag).
%Notice: The amplitude is irrelevant here.
T = [1, 2, 5, 6, 7, 10, 12, 14];

%Create all possible combinations of indexes of T.
[Y, X] = meshgrid(1:length(T));

%G matrix is the combinations of all gaps:
%T(1) - T(1), T(2) - T(1), T(3) - T(1)...
%It is inefficient to compute all gaps (even in reverse and T(1) - T(1)),
%But it is a common way to solve problems using Matlab.
G = T(X) - T(Y);

%Ignore sign of gaps.
G = abs(G);

%Remove all gaps that are not multiple of 4 with 0.1 hysteresis.
%Remove gaps like 5, 11, and 12.7...
G(abs(mod(G, 4)) > 0.1) = 0;

%C is a counter vector - counts all gaps that are not zeros.
%Now C holds the number of elements in the relevant series of each time sample.
C = sum(G > 0, 1);

%Only indexes belongs to the maximum series are valid.
ind = (C == max(C));

%Result: time tags belongs to the longest series.
resT = T(ind)