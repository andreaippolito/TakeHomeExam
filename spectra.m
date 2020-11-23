function [Eigenvalues, SpectralRadius] = spectra(Matrix)
%SPECTRA Summary of this function goes here
%   Detailed explanation goes here
Eigenvalues=eig(Matrix);
SpectralRadius=max(abs(Eigenvalues));
end

