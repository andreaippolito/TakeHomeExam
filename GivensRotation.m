function [givensMatrix] = GivensRotation(rho,sigma, problemDimension)
%GIVENSROTATION Summary of this function goes here
%   Detailed explanation goes here
s=sigma/sqrt(sigma^2+rho^2);
c=rho/sqrt(sigma^2+rho^2);
givensMatrix=[eye(problemDimension), zeros(problemDimension,1), zeros(problemDimension,1); zeros(problemDimension,1)', c, s; zeros(problemDimension,1)', -s, c];
end

