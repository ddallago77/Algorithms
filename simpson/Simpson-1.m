function [I] = Simpson(x,y)
%% Dominic Dallago 4/18/19
%This Funciton estimates the intergral of evenly spaced x values and any y
%vlaues. It first checks to make sure the x array is evenly spaced and x
%and y are the same length. It aproximates using the 1/3 rule the intergral
%of the funciton. If the x and y inputs are odd it estimates the final
%interval using the trapazodial rule. 
l=length(x);
ly=length(y);
% This sextion test if the input arrays are the same dimesnion 
if l~=ly
    error("The two arrays inputed are not the same length")
end
%This section checks to see if the intervals are equally spaced
%First it creates an array of all the differences of the x values
%Then is takes a number from that array and finds how many decimal places
%it goes to. 
%Then using that it can calculate the round off error if a user puts in .333 then
%0.667
%So then an array of differences of the differences array is made and if
%any of those values are greater than the possible round off error we know
%it is not evenly spaced
i=1;
a=zeros(1,l-1);
while i<l
    a(i)=x(i+1)-x(i);
    i=i+1;
end
%this is here because if the a value was 0 it meant it wasn't spaced right
%and the num2str failed
if a(2)==0
    error('x is not evenly spaced')
end
c=a(2);
%This changes the number to text then creates a 1X2 array of numbers before
%and after decimal. Then converts numbers after into an interger.
half = regexp(num2str(c), '\.', 'split');
numb_dec=str2double(half{2});
d=0;
%This counts the numbers of that integer to discover decimal places
while numb_dec>1
    numb_dec=numb_dec/10;
    d=d+1;
end
%difference of 'a' array is 'b'
b=zeros(1,l-2);
for i=1:l-2
    b(i)=a(i+1)-a(i);
end
b=abs(b);
% find the differnce error by numbers out to decimal places so it is +-
% that
differror=10^-d+10^-(d+1);
%'c' is the true or false matrix and if everyone is not false it's not
%evenly spaced 
c=b<=differror;
if sum(c)~=length(c)
    error('X values are not equally spaced')
end

odds=0;
evens=0;
% This part is for 3 inputs of x&y
if l==3 
    I=(x(3)-x(1))*(y(1)+4*y(2)+y(3))/6
end 
%This part is for even length arrays, It does a sum of all the even and odd
%n functions. Then it calcultes the intergral. Using those sums.
if mod(l,2)==0
   h=(x(l)-x(1));
   be=y(1)+y(l);
   for i=1:(l-2)/2
   odds=y(2*i)+odds;
   evens=y(1+2*i)+evens;
   end
   I=h/(3*(l-1))*(be+4*evens+2*odds)
end
%This section is for odd number arrays. It first ignores the last term of the array
%Then calculates the intergral like the even function. At the end it adds
%the trapazoid estimate to give the final aproximation 
if mod(l,2)==1&&l~=3
    l=l-1;
h=(x(l)-x(1));
   be=y(1)+y(l);
   for i=1:(l-2)/2
   odds=y(2*i)+odds;
   evens=y(1+2*i)+evens;
   end
   trap=(x(l+1)-x(l))*((y(l)+y(l+1))/2);
   I=h/(3*(l-1))*(be+4*evens+2*odds)+trap
   warning('Odd number of x inputs last x interval evaluated with trapozodial rule')
end
end

