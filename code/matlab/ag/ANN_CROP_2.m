clc, clearvars, close all
load ('CaracteristicasT.mat')
%Crear el vector de caracteristicas (3 caracteristicas)
  
tr = size(Caracteristicas,1)*0.7;
te = size(Caracteristicas,1)*0.3;

x_train = Caracteristicas(1:tr,3:6)';
t_train = Caracteristicas(1:tr,7)';

% 'trainlm'	    %Levenberg-Marquardt
% 'trainbr'	    %Bayesian Regularization
% 'trainbfg'	%BFGS Quasi-Newton
% 'trainrp'	    %Resilient Backpropagation
% 'trainscg'	%Scaled Conjugate Gradient
% 'traincgb'	%Conjugate Gradient with Powell/Beale Restarts
% 'traincgf'	%Fletcher-Powell Conjugate Gradient
% 'traincgp'	%Polak-Ribiére Conjugate Gradient
% 'trainoss'	%One Step Secant
% 'traingdx'	%Variable Learning Rate Gradient Descent
% 'traingdm'	%Gradient Descent with Momentum
% 'traingd'	    %Gradient Descent

%     compet - Competitive transfer function.
%     elliotsig - Elliot sigmoid transfer function.
%     hardlim - Positive hard limit transfer function.
%     hardlims - Symmetric hard limit transfer function.
%     logsig - Logarithmic sigmoid transfer function.
%     netinv - Inverse transfer function.
%     poslin - Positive linear transfer function.
%     purelin - Linear transfer function.
%     radbas - Radial basis transfer function.
%     radbasn - Radial basis normalized transfer function.
%     satlin - Positive saturating linear transfer function.
%     satlins - Symmetric saturating linear transfer function.
%     softmax - Soft max transfer function.
%     tansig - Symmetric sigmoid transfer function.
%     tribas - Triangular basis transfer function.

nn= 1;
net = feedforwardnet([nn],'trainlm'); % [10,8,5] Construct a feedforward network with X hidden layer of size X.

% net.layers{1}.transferFcn = 'tansig';
% net.layers{2}.transferFcn = 'logsig';

net = train(net,x_train,t_train);
view(net)


x_test = Caracteristicas(tr+1:end,3:6)';
t_test = Caracteristicas(tr+1:end,7)';
t_net = net(x_test);
t_net = round(t_net);

perf = perform(net,t_net,t_test)



Metric=[];
Tp=0;Fn=0;Tn=0;Fp=0;

        for i=1:size(t_net,2)     
            if t_net(i) == 1
                if t_test(i) == 1  %% True Positive
                    Tp=Tp+1;  
                else
                    Fn=Fn+1;  %% False Negative
                end
            else
                if t_test(i) == 0  %% True Negative
                    Tn=Tn+1;
                else
                    Fp=Fp+1;  %% False Positive
                end      
            end             
        end 
MC = [Tp Fp; Fn Tn]
%%  Precision & Recall
TPR = Tp/(Tp+Fn);   % sensitivity, recall, hit rate, or true positive rate (TPR)
TNR = Tn/(Tn+Fp);   % specificity, selectivity or true negative rate (TNR)

PPV = Tp/(Tp+Fp);   % precision or positive predictive value (PPV)

NPV = Tn/(Tn+Fn); % negative predictive value (NPV)
FNR = Fn/(Fn+Tp); % miss rate or false negative rate (FNR)
FPR = Fp/(Fp+Tn); % fall-out or false positive rate (FPR)
FDR = Fp/(Fp+Tp); % false discovery rate (FDR)
FOR = Fn/(Fn+Tn); % false omission rate (FOR)
PT = (sqrt(TPR*(1-TNR)) + TNR - 1) / (TPR+TNR-1); %Prevalence Threshold (PT)
TS = Tp/(Tp+Fn+Fp); % Prevalence Threshold (PT)

ACC= (Tp + Tn)/(Tp+Tn+Fp+Fn); %accuracy (ACC)
BA = (TPR+TNR)/2;  % balanced accuracy (BA)

F1 = Tp/(Tp+(0.5*(Fp+Fn))); % F1 score
MCC = ((Tp*Tn)-(Fp*Fn))/sqrt((Tp+Fp)*(Tp+Fn)*(Tn+Fp)*(Tn+Fn)); %Matthews correlation coefficient (MCC)
FM = sqrt(PPV*TPR); %Fowlkes–Mallows index (FM)
BM = TPR + TNR -1; % informedness or bookmaker informedness (BM)
MK = PPV + NPV -1; % markedness (MK) or deltaP
MetricI=[TPR,TNR, PPV, NPV, FNR, FPR, FDR, FOR, PT, TS, ACC, BA,F1, MCC,FM, BM, MK];
Metric=[Metric ; MetricI];
%%
writematrix(Metric, 'Metric.xlsx');