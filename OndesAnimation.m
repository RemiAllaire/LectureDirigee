function OndesAnimation(p,v,f,N, T)
% p fonction de la position initiale
% v fonction de la vitesse initiale
% f fonction de la force externe
% N nombre de points
% T durée de la simulation


DeltaX  = 1/N;  %En assumant que la longueur de la corde est 1
M = ceil(T)*N;
DeltaT  = T/M; %S'assure que DeltaT <= DeltaX 

% Condition initiale
% En assumant que les extremités de la corde sont fixée
%On obtient p(0) = p(L) = 0
%           v(0) = v(L) = 0

% U(0,x) = p(x); U(1,x) = p(x) + DeltaT*v(x)

U0 = p(linspace(0,1,N+1));
U1 = U0 + DeltaT * v(linspace(0,1,N+1));

lambda = (DeltaT/DeltaX)^2;
% Matrice de ?transition?
H = diag(2*(1-lambda)*ones(N+1,1)) + diag(lambda*ones(N,1),-1) + diag(lambda*ones(N,1),1);
H(1,1) = 1;H(1,2)= 0; H(N+1,N) = 0; H(N+1,N+1) = 1;

%Récursion avec mémoire pour créer animation
U = zeros(N+1,M+1);
U(:,1) = U0;
U(:,2) = U1;
for i=3:M+1
    U(:,i) = H * U(:,i-1) - U(:,i-2) + DeltaX*DeltaT *f(i*DeltaT)*ones(N+1,1);
end

%Animation

for i =1:M+1
    x = linspace(0, 1, N+1);
    y = U(:,i);
    
    plot(x,y)
    axis([0 1 -3 3])
    pause(0.01)
end
