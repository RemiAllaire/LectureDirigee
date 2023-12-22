function amplitudeMax = OndesSansMemoire(p,v,f,N, T)
% p fonction de la position initiale
% v fonction de la vitesse initiale
% f fonction de la force externe
% N nombre de points
% T durée de la simulation


DeltaX  = 1/N;  %En assumant que la longueur de la corde est 1
DeltaT  = (DeltaX)^2/2; %S'assure que 2*DeltaT <= DeltaX^2 pour la stabilité.
M = ceil(T/DeltaT)

% Condition initiale
% En assumant que les extremités de la corde sont fixée
%On obtient p(0) = p(L) = 0
%           v(0) = v(L) = 0

% U(0,x) = p(x); U(1,x) = p(x) + DeltaT*v(x)

U0 = p(linspace(0,1,N+1)).';
U1 = U0 + DeltaT * v(linspace(0,1,N+1)).';

lambda = (DeltaT/DeltaX)^2;
% Matrice de ?transition?
H = diag(2*(1-lambda)*ones(N+1,1)) + diag(lambda*ones(N,1),-1) + diag(lambda*ones(N,1),1);
H(1,1) = 1;H(1,2)= 0; H(N+1,N) = 0; H(N+1,N+1) = 1;

% Récursion où pour chaque unité de temps, on cherche le maximum observé de
% l'amplitude pour tous les points. On garde à la fin, le maximum observé
% pour toutes les unités de temps, soit la durée de la .
amplitudeMax = 0;
for i=3:M+1
    U = H * U1 - U0 + DeltaT^2 *f(i*DeltaT)*ones(N+1,1);

    maxLocal = max(abs(U));
    if  maxLocal > amplitudeMax
        amplitudeMax = maxLocal;
    end
    U0 = U1;
    U1 = U;
end
%U
size(U);
amplitudeMax;
return