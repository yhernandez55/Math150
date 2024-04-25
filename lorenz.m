

function dx = lorenz(t,x,Beta)
% beta(1)=sigma;
% beta(2)=rho;
% beta(3)=beta;
dx = [
    Beta(1)*(x(2)-x(1)); 
    x(1)*(Beta(2)-x(3))-x(2);
    x(1)*x(2)-Beta(3)*x(3);
    ];
end