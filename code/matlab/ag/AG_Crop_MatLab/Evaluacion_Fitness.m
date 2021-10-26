function [Poblacion,Porcion] = Evaluacion_Fitness(Poblacion, dat)
Porcion=0;
% fitnes a cada individuo
for k=1:size(Poblacion,2)
    fitness=Fun_fitness(Poblacion{1,k}.ag,dat);%funcion fitness
    Poblacion{1,k}.fitness=fitness;
    Porcion = Porcion + Poblacion{1,k}.fitness;
    
end

%porcion de porcentaje de fitness a cada poblacion.val
for porck = 1:size(Poblacion,2)
     Porcion_Div = Poblacion{1,porck}.fitness/Porcion;
     Poblacion{1,porck}.Percent=Porcion_Div;   
end

end