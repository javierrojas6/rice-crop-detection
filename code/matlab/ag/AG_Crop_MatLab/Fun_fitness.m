function fitness=Fun_fitness(sdk,dat)%evalua el fitness por columnas y cuadriculas
TP = 0;
TN = 0;
FP = 0;
FN = 0;

for i = 1 : size(dat,1)
    value = dat(i,3:7); % RED - GREEN - EDGE -NIR
    % Reglas
    RED = false; GREEN = false; EDGE = false; NIR = false;
    if value(5) == 1
        if (value(1) >= sdk(1)) && (value(1) <= sdk(2)), RED = true; end
        if (value(2) >= sdk(3)) && (value(2) <= sdk(4)), GREEN = true; end
        if (value(3) >= sdk(5)) && (value(3) <= sdk(6)), EDGE = true; end
        if (value(4) >= sdk(7)) && (value(4) <= sdk(8)), NIR = true; end
        
        if (RED==true) && (GREEN==true) && (EDGE==true) && (NIR==true)
            TP = TP +1;
        else
            FP = FP +1;
        end
    end
    
    RED = false; GREEN = false; EDGE = false; NIR = false;
    if value(5) == 0
        if (value(1) <= sdk(1)) || (value(1) >= sdk(2)), RED = true; end
        if (value(2) <= sdk(3)) || (value(2) >= sdk(4)), GREEN = true; end
        if (value(3) <= sdk(5)) || (value(3) >= sdk(6)), EDGE = true; end
        if (value(4) <= sdk(7)) || (value(4) >= sdk(8)), NIR = true; end
        
          if (RED==true) && (GREEN==true) && (EDGE==true) && (NIR==true)
            TN = TN +1;
        else
            FN = FN +1;
        end
    end
 
end
    
P1 = TP/(TP+FP);
P2 = TN/(TN+FN);
fitness = (P1*0.5)+(P2*0.5);
end
%comprobacion por cuadriculas