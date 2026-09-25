addpath('./tools')

validateInput = 0 % insert your data
validateTarget = 0 % insert your data
trainInput = 0 % insert your data
trainTarget = 0 % insert your data

Layers = [ ...
imageInputLayer([64,64, 3],'Normalization','none','Name','input')
convolution2dLayer(5,80,'Stride',2,'Name','conv1')
swishLayer
convolution2dLayer(3,600,'Stride',2,'Name','conv2')
swishLayer
convolution2dLayer(2,60,'Stride',2,'Name','conv3')
swishLayer
fullyConnectedLayer(1400,'Name','fc')
clipLayer(1,'Clipping Layer')
regressionLayer('Name','output')
];


options = trainingOptions(...
    'sgdm', ...
    'MaxEpochs',1000,...
    'Shuffle','every-epoch',...
    'ValidationData',{validateInput,validateTarget},...
    'ValidationPatience',Inf,...,
    'ValidationFrequency', 10000,...
    'InitialLearnRate',0.006,...
    'Momentum',0.95,...
    'L2Regularization',1e-4,...
    'Plots','training-progress',...
    'ExecutionEnvironment','gpu','MiniBatchSize',1280);

[net,netinfo] = trainNetwork(trainInput,trainTarget,Layers,options);



