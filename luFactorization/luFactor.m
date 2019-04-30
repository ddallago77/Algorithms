function [L,U,P]=luFactor(A)
%% Lu Factorization (4/2/19) 
% This function pivots N by N matixes and decomposes them in to upper and
% lower matices. The Code first Pivots the input matrix. Then using the new
% modified matrix it is decomposed into its upper and lower matrix. 
format short
[r,c]=size(A);
if r~=c
    error('The matrix inputed is not a square matrix')
end
Ao=A;
%At first the code pivots the matrix based on which row has the greatest
%value at the first column then the second, then third an so on. 
for l=1:r-1
[o,k]=max(abs(A(l:r,l)));
ipr=k+l-1;
if ipr~=l
    A([l,ipr],:)=A([ipr,l],:);
end
end
Pm=A;
L=eye(r,c);
% This section calculates the U and L 
% It calculates the U values by first calculating the factor that gets rid
% of the first term for every row. Then the second columbn of every row....
% The Factors are Stored in an Upper corner matrix then its flipped using '
for l=1:r-1
for k=l+1:r
    factor=A(k,l)/A(l,l);
    L(l,k)=factor;
    A(k,l:r)=A(k,l:r)-factor*A(l,l:r); 
end
end
U=A;
L=L';
% Then by left dividing the changed matrix by the Original Matrix the Pivot
% Matrix is given. 
P=Pm/Ao;

end
