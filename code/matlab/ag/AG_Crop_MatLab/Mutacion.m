function [ Mutacion,Porcion] = Mutacion( Sdk,Poblacion,nPob,Percent,dat)
%funcion de mutacion
for s=1:nPob
    random_mut=rand(1);
    if (random_mut<=Percent)
        ag = Poblacion{1,s}.ag;
        v = randi([1,size(ag,2)],1);
        if (ag(v) + ag(v)*0.2)<=1
            ag(v) = ag(v) + ag(v)*0.2; 
        else
            ag(v) = ag(v) - ag(v)*0.2;
        end
        Mutacion{1,s}.ag = ag;
    else
        Mutacion{1,s}= Poblacion{1,s};
    end

end

[ Mutacion,Porcion] = Evaluacion_Fitness( Mutacion,dat);
[Mutacion] = Ssort(Mutacion);

for i = 1 : 30
    m =  llenarsdk(1,Sdk);
    Mutacion{70+i} = m{1}; 
end
MutacionF = [];
%% eliminar individuos no validos (malas mutaciones)
j = 1;
for i = 1 : size(Mutacion,2)
    if (Mutacion{i}.ag(1) < Mutacion{i}.ag(2) ) && (Mutacion{i}.ag(3) < Mutacion{i}.ag(4) ) && (Mutacion{i}.ag(5) < Mutacion{i}.ag(6) ) && (Mutacion{i}.ag(7) < Mutacion{i}.ag(8) )
        MutacionF{j}.ag = Mutacion{i}.ag;
        j = j+1;
    end
end
ii= 0;
for i = 1 : (nPob - j)
    pp = llenarsdk(1,Sdk);
    if (pp{1}.ag(1) < pp{1}.ag(2) ) && (pp{1}.ag(3) < pp{1}.ag(4) ) && (pp{1}.ag(5) < pp{1}.ag(6) ) && (pp{1}.ag(7) < pp{1}.ag(8) )
        MutacionF{j+ii}.ag = pp{1}.ag; 
        ii = ii+1;
    end
end

Poblacion = llenarsdk(1,Sdk); 

%% asignar fitness
[ Mutacion,Porcion] = Evaluacion_Fitness( MutacionF,dat);
[Mutacion] = Ssort(Mutacion);



end

