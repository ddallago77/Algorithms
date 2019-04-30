function[root,fx,ea,iter]=falsePosition(func,xl,xu,ea,maxiter)
% Check if input is valid 
switch nargin
    case 3
        ea=0.0001;
        maxiter=200;
    case 4
        maxiter=200;
    case 5 
    otherwise 
        error('To many or not enough inputs')
end
fxl=func(xl);
fxu=func(xu);
if fxu*fxl>0
    error('There is no root in between the Inputs') 
end 
eaprox=100;
iter=0;
x1=2*xu;
%run code till aproximate error or max iteration is completed 
while eaprox>ea&&iter<maxiter
    %find root value 
    root=xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    %count iterations
    iter=iter+1;
    % Find error 
    eaprox=abs((x1-root)/root*100);
    %replace bound values 
    if func(xl)*func(root)>0
        xl=root;
    end
    if func(xu)*func(root)>0
        xu=root;
    end 
    % x1 stores root value for next loop to calculate error
    x1=root;
end
root=x1;
fx=func(root);
ea=eaprox;
iter=iter;
fprintf('Estimated %s = %f\n\n','root',root)
fprintf('The funciton value of the estimated root is %f\n\n',fx)
fprintf('This is using %f iterations with an aproximate error of %f',iter,ea)