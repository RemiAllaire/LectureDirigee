%Script qui dessine le graphique de l'amplitude maximale observée selon i
%de la fonction de la force externe sin(i *t *pi). avec comme condition
%initiale

PositionInitiale = @(x) sin(x*pi*4);  %  À modifier selon les essais
VitesseInitiale =  @(x) 2*sin(x*pi*3);


xx =0:0.01:10;
j = 100;
    yy = [];
    for i = 0:0.01:10
        yy = [yy, OndesSansMemoire(PositionInitiale,VitesseInitiale,@(t)sin(i*t*pi), 50,10)];
    end
    yy;
    figure
    plot(xx,yy)
    title('Amplitude maximale selon la force externe sin(i*t*pi)')
    xlabel('i')
    ylabel('Amplitude maximale')