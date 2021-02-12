function testaPasta3(net)
%a
d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_3\A\*.jpg');
input = zeros(784,500);
target = zeros(5,500);

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

% SIMULAR
 out = sim(net, input);

% %VISUALIZAR DESEMPENHO
 
 plotconfusion(target, out) % Matriz de confusao

%Calcula e mostra a percentagem de classificacoes corretas no total dos exemplos
r=0;
for i=1:size(out,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(target(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end

accuracy = r/size(out,2)*100;
fprintf('Precisao total %f\n', accuracy)



























end