%ALGORITMO GENETICO PARA LA CARACTERIZACION DE CULTIUVOS
%% PSUDOCODIGO
%INICIO
%POBLACION INICIAL & EVALUAR INDIVIDUOS
%INDIVIDUO APTO?<---------------
%                              |
%SI                NO          |
%FIN               SELECCION   |
%                  CRUCE       |
%                  MUTACION-----
%% INICIO
clc, clearvars, close all

Sdk.val =randi([0 100],1,8)./100; % INDIVIDUO INIT
 
Sdk.apt=0;      % fitness inicial
Sdk.apt_pond=0; % fitness inicial ponderado
Sdk.Percent=0;  % valor de referencia

Percent=0.12;    % porcentaje de mutacion
nPob=100;        % numero de poblacion a crear
Poblacion ={};   % poblacion almacenada en una estructura
Poblacion_out={};% hijos generados
iteracion = 50; % No. iteraciones o genmeraciones

% poblacion inicial
Poblacion = llenarsdk(nPob,Sdk); 

% Calculo fitness para cada sdk
X=0;
Media=0;
Ceros = zeros(1,iteracion);
Ceros2 =zeros(1,iteracion);
Alv = [];%almacenamiento de mejores fitness
Temporal =0;
sdk_maximo=[];
%% Fitness
load('CaracteristicasTB2')
Ndata = round(size(Caracteristicas,1)*0.01);   
b = 0;
    while b == 0 % seleccion aleatoria de muestras para evaluar aptitud %%Ndata
        dat = Caracteristicas( [randi([1, size(Caracteristicas,1)],1,Ndata)]',:);
        m = [ (sum(dat(:,7)==0)) (sum(dat(:,7)==1))]; m = min(m)/max(m);
        if m >= 0.95
            b = 1;
        else
            dat = Caracteristicas( [randi([1, size(Caracteristicas,1)],1,Ndata)]',:); 
        end
    end, b = 0; 
[Poblacion,Porcion] = Evaluacion_Fitness(Poblacion, dat); % fit de  la poblacion inicial
%% EVOLUCION
%for i = 1:iteracion
A = 0;
i = 1;
while (i <= iteracion) %|| (A <= 0.90))
    % SELECCION: Funcion de Ruleta --> los mejores en la ruleta en la poblacion y crea una nueva poblacion
    Poblacion_Hijos = Seleccion(nPob,Poblacion);

    % CRUCE: funcion de creación de hijos
    [Poblacion_out,Porcion]=cruce(Poblacion_Hijos,nPob,dat);
    % MUTACION: acorde a la medida de variación
    [Mutex,Porcion]= Mutacion(Sdk,Poblacion_out,nPob,Percent,dat);
     A = Mutex{1}.fitness;

    % poblacion de salida
    Poblacion=Mutex; nPob = size(Poblacion,2);
    
    %Grafica
    figure(1)
    clf
    hold on, %subplot(2,1,1)
    Media = Porcion/nPob;
    Ceros(1,i) = A;
    Ceros2(1,i) = Media;
    plot(Ceros,' --g')
    hold on
    plot(Ceros2,' --b')
    legend('Fitness Maximun','Population mean fitness')
    set(gca,'FontSize',10);
    set(gca,'XTick','');
    %subplot(2,1,2)
    

    clc
    m=i;
    disp('Numero de Iteracion: ')
    disp(m)
    disp('Media de Poblacion: ')
    disp(Media)
    disp('Fitnes maximo obtenido: ')
    disp(A)   
    i = i +1;
end

%% Grafica en 3D
scrsz = get(0,'ScreenSize');      
Tam_Fig = [scrsz(3)/10 scrsz(4)/10 9*scrsz(3)/10 9*scrsz(4)/10]; 
tam = 3; %para graficar
Color_1 = [17, 122, 101];  Color_1 = Color_1 /225; 
Color_2 = [128, 139, 150]; Color_2 = Color_2/225;
h = figure('Name','Simulation Plot Window','NumberTitle','off','Position',Tam_Fig);
        
c1 = Caracteristicas(Caracteristicas(:,7)==0,3:6);
scatter3(c1(:,1),c1(:,2),c1(:,4),tam,c1(:,3),'filled')    % Suelo
ax = gca;
hold on
c2 = Caracteristicas(Caracteristicas(:,7)==1,3:6);
scatter3(c2(:,1),c2(:,2),c2(:,4),tam+4,c2(:,3),'filled')% VEG1 
ax = gca;
        
ax.XDir = 'reverse';
xlabel('Red'), ylabel('Green'), zlabel('Red-Edge')
cb = colorbar;                                    
cb.Label.String = 'Infrared-NIR';
[~, objh]=legend({'Ground','Vegetation'},'location', 'northeast', 'Fontsize', 14);
objhl = findobj(objh, 'type', 'line'); %// objects of legend of type line


% R = (Mutex{1}.ag)*100;
% 
% [X,Y,Z] = meshgrid(R(1):.1:R(2), R(3):.1:R(4), R(5):.1:R(6)  );
% s = surf(X,Y,Z,'FaceAlpha',0.5)
% 
% s = surf(R(1):1:R(2), R(3):1:R(4), R(5):1:R(6),'FaceAlpha',0.5)