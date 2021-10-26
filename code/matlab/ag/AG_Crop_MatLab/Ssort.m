function [PoblacionO] = Ssort(Poblacion)
nPob = size(Poblacion,2);
f = [];
for i = 1 : nPob
    f = [f, Poblacion{i}.fitness ];
end
[val idx]=sort(f); val = flip(val); idx = flip(idx);
PoblacionO = [];
for i = 1 : nPob
    PoblacionO{i} = Poblacion{idx(1,i)};
end

end

