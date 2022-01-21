function layers = createCNN(X, Y)
    inputShape = size(X, [1, 2, 3]);
    outputShape = size(Y, 1);
    layers = [
        imageInputLayer([28 28 1])
	    
        convolution2dLayer(3,16,'Padding',1)
        batchNormalizationLayer
        reluLayer
	    
        maxPooling2dLayer(2,'Stride',2)
	    
        convolution2dLayer(3,32,'Padding',1)
        batchNormalizationLayer
        reluLayer
	    
        maxPooling2dLayer(2,'Stride',2)
	    
        convolution2dLayer(3,64,'Padding',1)
        batchNormalizationLayer
        reluLayer
	    
        fullyConnectedLayer(10)
        softmaxLayer
        classificationLayer];
end