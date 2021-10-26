function Poblacion = llenarsdk(nPob,Sdk)

for k=1:nPob
    Sdk_out = [];
    for i = 1 : 4
        p1 = randi([0 99],1,1);
        p2 = randi([p1+1 100],1,1);
        Sdk_out = [Sdk_out, [p1/100 p2/100]];
    end
    
    Poblacion{1,k}.ag=Sdk_out;
end
end

