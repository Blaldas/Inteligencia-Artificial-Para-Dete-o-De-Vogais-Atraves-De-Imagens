function alineaC_parte2()

%a
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_3\A\*.jpg');
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
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_3\E\*.jpg');
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
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_3\I\*.jpg');
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
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_3\O\*.jpg');
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
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_3\U\*.jpg');
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

net = feedforwardnet([10]);
%net = patternnet([5,5]);
 
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{1}.transferFcn = 'tansig';
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA/MEIO
%net.layers{2}.transferFcn = 'tansig';
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{2}.transferFcn = 'purelin';

% FUNCAO DE TREINO 
net.trainFcn = 'trainlm';
% NUMERO DE EPOCAS DE TREINO
net.trainParam.epochs=20;

net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0;
                

% COMPLETAR: treinar a rede
[net] = train(net, input, target);
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%MUDAR CONFORME A PASTA A TESTAR
%testaPasta1(net);
%testaPasta2(net);
testaPasta3(net);


end