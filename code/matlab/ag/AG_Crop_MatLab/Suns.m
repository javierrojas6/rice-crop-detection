function [hijo,hijo2]=Suns(Padre1,Padre2)
%Generacion de Hijos, por el metodo de filas random, es decir en el
%padre1 tomaremos 3 filas y en el padre2 tomaremos 7 filas y crearemos un
%hijo, y el otro hijo sera creado inversamente.

hijo=[];
hijo2=[];
filas=[];

%% Hijo 1
numeroDat = randi([1 size(Padre1,2)],1);
pos = randi([1 size(Padre1,2)],1,numeroDat);

hijo = Padre1;
    for i = 1 : size(pos,2)
        hijo(pos(i)) = Padre2(pos(i));
    end
%% Hijo 2
numeroDat = randi([1 size(Padre1,2)],1);
pos = randi([1 size(Padre1,2)],1,numeroDat);

hijo2 = Padre2;
    for i = 1 : size(pos,2)
        hijo2(pos(i)) = Padre1(pos(i));
    end

 end









