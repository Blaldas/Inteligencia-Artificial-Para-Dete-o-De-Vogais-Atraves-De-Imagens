function alineaA()

d = dir('C:\Users\P\Desktop\isec\2∫ ano\cr\TP_CR\Pasta_1\*.jpg');
input = zeros(784,5);
i = 1;
for n = 1 : size(d)
    folder = getfield(d, {i}, 'folder');  % folder È a pasta
    nome = getfield(d, {i}, 'name');      %  vai buscar cada imagem
    img = strcat(folder, '/', nome);      % cria localizaÁ„o final
    imagem_arr = imbinarize(imread(img));
    vector = imagem_arr(:);
    input(:, i) = vector;                       % cada coluna È uma imagem
    i = i + 1;
    disp(input);
end

 target = [1 0 0 0 0,
           0 1 0 0 0,
           0 0 1 0 0,
           0 0 0 1 0,
           0 0 0 0 1];

% %Cria√ß√£o de rede neuronal com 10 neur√≥nios com 1 camada escondida

%net = feedforwardnet([10]);
%net = feedforwardnet([3 2 2 1]);
net = patternnet(10);
 
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
%net.layers{1}.transferFcn = 'tansig';
% FUNCAO DE ATIVACAO DA CAMADA DE SAIDA
net.layers{1}.transferFcn = 'purelin';
%net.layers{2}.transferFcn = 'purelin';
%net.layers{3}.transferFcn = 'purelin';

% FUNCAO DE TREINO 
net.trainFcn = 'trainlm';
% NUMERO DE EPOCAS DE TREINO
net.trainParam.epochs=100;

net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 1;
net.divideParam.valRatio = 0;
net.divideParam.testRatio = 0;
                

% treinar a rede
[net,tr] = train(net, input, target);
 view(net);
 disp(tr)
% % SIMULAR
 out = sim(net, input);
 
% % Treinar a rede
 %net2 = net;
 
% %VISUALIZAR DESEMPENHO
 
 plotconfusion(target, out) % Matriz de confusao
 
 plotperf(tr)         % Grafico com o desempenho da rede nos 3 conjuntos           

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


% SIMULAR A REDE APENAS NO CONJUNTO DE TESTE
TInput = input(:, tr.testInd);
TTargets = target(:, tr.testInd);

out = sim(net, TInput);


%Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
r=0;
for i=1:size(tr.testInd,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(TTargets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end
accuracy = r/size(tr.testInd,2)*100;
fprintf('Precisao teste %f\n', accuracy)
 end