function [net] = getNetB()

%a
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_2\A\*.jpg');
input = zeros(784,1000);
target = zeros(5,1000);

i =1;
j=1;
for n = 1 : size(d)
    
    folder = getfield(d, {i}, 'folder');        % folder é a pasta
    nome = getfield(d, {i}, 'name');            % vai buscar cada imagem
    img = strcat(folder, '/', nome);            % cria localização final
    arr = imbinarize(imread(img));              % guarda a imagem em forma de array
    arr = arr(:);                               %%transfoirma a imagem de array para um vector de 1 coluna
    input(:, j) = arr;                          % cada coluna é uma imagem
    target(:, j) = [1, 0, 0, 0, 0];
    i = i + 1;
    j = j + 1 ;
      
end

%e
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_2\E\*.jpg');
i =1;
for n = 1 : size(d)
    
    folder = getfield(d, {i}, 'folder');        % folder é a pasta
    nome = getfield(d, {i}, 'name');            % vai buscar cada imagem
    img = strcat(folder, '/', nome);            % cria localização final
    arr = imbinarize(imread(img));              % guarda a imagem em forma de array
    arr = arr(:);                               %%transfoirma a imagem de array para um vector de 1 coluna
    input(:, j) = arr;                          % cada coluna é uma imagem
    target(:, j) = [0, 1, 0, 0, 0];
    i = i + 1;
    j = j + 1 ;  
end

%I
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_2\I\*.jpg');
i =1;
for n = 1 : size(d)
    
    folder = getfield(d, {i}, 'folder');        % folder é a pasta
    nome = getfield(d, {i}, 'name');            % vai buscar cada imagem
    img = strcat(folder, '/', nome);            % cria localização final
    arr = imbinarize(imread(img));              % guarda a imagem em forma de array
    arr = arr(:);                               %%transfoirma a imagem de array para um vector de 1 coluna
    input(:, j) = arr;                          % cada coluna é uma imagem
    target(:, j) = [0, 0, 1, 0, 0];
    i = i + 1;
    j = j + 1 ;
end
%O
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_2\O\*.jpg');
i =1;
for n = 1 : size(d)
    
    folder = getfield(d, {i}, 'folder');        % folder é a pasta
    nome = getfield(d, {i}, 'name');            % vai buscar cada imagem
    img = strcat(folder, '/', nome);            % cria localização final
    arr = imbinarize(imread(img));              % guarda a imagem em forma de array
    arr = arr(:);                               %%transfoirma a imagem de array para um vector de 1 coluna
    input(:, j) = arr;                          % cada coluna é uma imagem
    target(:, j) = [0, 0, 0, 1, 0];
    i = i + 1;
    j = j + 1 ;
    
end
%U
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_2\U\*.jpg');
i =1;
for n = 1 : size(d)
    
    folder = getfield(d, {i}, 'folder');        % folder é a pasta
    nome = getfield(d, {i}, 'name');            % vai buscar cada imagem
    img = strcat(folder, '/', nome);            % cria localização final
    arr = imbinarize(imread(img));              % guarda a imagem em forma de array
    arr = arr(:);                               %%transfoirma a imagem de array para um vector de 1 coluna
    input(:, j) = arr;                          % cada coluna é uma imagem
    target(:, j) = [0, 0, 0, 0, 1];
    i = i + 1;
    j = j + 1 ;
      
end

%net = feedforwardnet(10);
net = patternnet([20,20]);
 
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'tansig';
net.layers{3}.transferFcn = 'purelin';


% FUNCAO DE TREINO 
net.trainFcn = 'trainlm';
% NUMERO DE EPOCAS DE TREINO
net.trainParam.epochs=100;

net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 0.7;
net.divideParam.valRatio = 0.15;
net.divideParam.testRatio = 0.15;
                

% COMPLETAR: treinar a rede
[net,tr] = train(net, input, target);
 %view(net);
 %disp(tr)
% % SIMULAR                                 ver se simular é necessário
% out = sim(net, input);