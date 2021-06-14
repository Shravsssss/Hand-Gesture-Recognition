function TrainData() 

    g=alexnet;
    %Alexnet is a convolutional neural network and has 25 layers
    layers=g.Layers;
    %layer 23 = fc8 = Fully Connected = 1000 fully connected layer
    %7 = output which should be equal to number of classes (folders = none,zero,one,two,three,four,five)
    layers(23)=fullyConnectedLayer(7); 
    %layer 25 = Output = Classification Output = Crossentropyex with 'tench' and 999 other classes
    layers(25)=classificationLayer;
    allImages=imageDatastore('Hand Dataset','IncludeSubfolders',true, 'LabelSource','foldernames');
    %sgdm = Schotastic Gradient Descent with Momentum
    %epoch = full training cycle on the entire training data set
    %28 iterations per epoch
    opts=trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64,'Shuffle','every-epoch','Plots','training-progress');
    myNet1=trainNetwork(allImages,layers,opts);
    save myNet1;
    
end