function testaPasta1(net)

d = dir('C:\Users\P\Desktop\isec\2º ano\cr\TP_CR\Pasta_1\*.jpg');
input = zeros(784,5);
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

 target = [1 0 0 0 0,
           0 1 0 0 0,
           0 0 1 0 0,
           0 0 0 1 0,
           0 0 0 0 1];


% % SIMULAR
 out = sim(net, input);
 
% % Treinar a rede
 %net2 = net;
 
% %VISUALIZAR DESEMPENHO
 
 plotconfusion(target, out); % Matriz de confusao
 
      

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
fprintf('Precisao teste %f\n', accuracy)


end