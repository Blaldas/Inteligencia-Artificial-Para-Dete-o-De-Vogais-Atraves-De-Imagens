function alineaC_parte3
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_1\*.jpg');
input = zeros(784,1505);
target = zeros(5,1505);
i = 1;

for n = 1 : size(d)
    folder = getfield(d, {i}, 'folder');  % folder é a pasta
    nome = getfield(d, {i}, 'name');      %  vai buscar cada imagem
    img = strcat(folder, '/', nome);      % cria localização final
    imagem_arr = imbinarize(imread(img));
    vector = imagem_arr(:);
    input(:, i) = vector;                       % cada coluna é uma imagem
    i = i + 1;
end

target(1, 1) =1;
target(2, 2) =1;
target(3, 3) =1;
target(4, 4) =1;
target(5, 5) =1;




%a
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_2\A\*.jpg');
i =1;
j=6;
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

i =1;
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
    j = j + 1;   
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
    j = j + 1;
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
    j = j + 1;
    
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
    j = j + 1;
      
end


net = feedforwardnet([5,5]);
%net = patternnet([10]);
 
% FUNCAO DE ATIVACAO DA CAMADA DO INICIO
net.layers{1}.transferFcn = 'tansig';
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA/MEIO
net.layers{2}.transferFcn = 'tansig';
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{3}.transferFcn = 'purelin';

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