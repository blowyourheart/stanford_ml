%generate data from normal distribution.
clc;
clear all;
mu_true= [0;20];
mu_true'
sigma_true = [2; 3.5];
sigma_true'
phi_true = [0.4; 0.6];
phi_true'
k = 2;
N = 300;
R1 = normrnd(mu_true(1,:), sigma_true(1,:),N * phi_true(1), 1);
R2 = normrnd(mu_true(2,:), sigma_true(2,:),N * phi_true(2), 1);
%merge
R = [R1;R2];
%shuffle the data
r = randperm(size(R,1));
R=R(r,:);

[mu,sigma,phi, log_like]=MGM(R,2, 100, 1e-7);
mu'
sigma'
phi'