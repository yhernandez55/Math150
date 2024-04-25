clear all
close all
clc

A = [1:3; 2:4; 4:6; 8:10];
x = [8; 6; 2];

tic
b1 = my_matvecprod(A,x)
toc

tic
b2 = A *x;
toc

function [b]= my_matvecprod(A,x)
%function to find Ax
%input :
%A, mxn matrix
%x, nx1 vector
%output: b, mxn vector
[m,n]=size(A);
%check size of x
if length(x) ~= n
    error('Error: incompatible sizes ');
end
b=zeros(m,1);

    tmp =0; %initialize ith component of b
    for j=1:n %row i dotted with b
        tmp=tmp+A(:,j)*x(j);
    end
b(:)=tmp; %store ith component of b
end