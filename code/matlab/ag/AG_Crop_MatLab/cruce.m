function [poblacion_out,Porcion]=cruce(Poblacion,nPob,dat)


%funcion de creacion de hijos
%[hijo,hijo2]=Suns(Padre1,Padre2)
poblacion_out={};
poblacion_out=Poblacion;
for n=1:2:nPob/2
    [hijo,hijo2] = Suns(poblacion_out{1,n}.ag,poblacion_out{1,n+1}.ag);
    
    poblacion_out{1,n}.ag=hijo;
    poblacion_out{1,n+1}.ag=hijo2;
end

[poblacion_out,Porcion] = Evaluacion_Fitness(poblacion_out, dat);

%[poblacion_out] = Ssort(poblacion_out);

end