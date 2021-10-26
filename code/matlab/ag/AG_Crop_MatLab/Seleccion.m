function Poblacion_Hijos = Seleccion( nPob,Poblacion )
p = 100;  %porcentaje de seleccion
%PoblacionO = [];
%[Poblacion] = Ssort(Poblacion);
        % for i = 1 : round(nPob*(p/100)), PoblacionO{i} = Poblacion{i}; end
        % nPob = size(PoblacionO,2); 
        
Poblacion_Hijos=Ruleta(nPob,Poblacion);
%PoblacionO = Poblacion;
%Poblacion_Hijos = PoblacionO;
end
