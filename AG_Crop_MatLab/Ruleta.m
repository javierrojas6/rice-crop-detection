function Poblacion_Hijos=Ruleta(nPob,Poblacion)
%Funcion ruleta, consiste en generar una nueva poblacion de acuerdo al
%mejor seleccionado en la Ruleta: Los mas aptos estaran en juego y los
%malos quedaran por fuera, seran evaluados de acuerdo al fitness dado para
%cada individuo
random=[];
T=0;
X={};
Poblacion_Hijos={};
for k=1:nPob
    P=rand(1);
    random=[random P];
end

for j=1:size(random,2)
   
    for i=1:size(Poblacion,2)
       T = T + Poblacion{1,i}.Percent;
        if( T >= random(1,j))
        
            X{1,j} = Poblacion{1,i};
            i=1;
            T=0;
        end
        
    end  

end

Poblacion_Hijos=X;
end
