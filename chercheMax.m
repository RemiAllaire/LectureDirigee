%Script qui dessine le graphique de l'amplitude maximale observée selon i
%de la fonction de la force externe sin(i *t *pi). avec comme condition
%initiale

PositionInitiale = @(x)sin(8*pi*x);  %  À modifier selon les essais
VitesseInitiale =  @(x)sin(4*pi*x);


xx =0:0.01:10;
j = 100;
    yy = [];
    for i = 0:0.01:10
        yy = [yy, OndesSansMemoire(PositionInitiale,VitesseInitiale,@(t)sin(i*t*pi), 100,5)];
    end
    yy;
    figure
    plot(xx,yy)
    title('Amplitude maximale selon la force externe sin(i*t*pi)')
    xlabel('i')
    ylabel('Amplitude maximale')