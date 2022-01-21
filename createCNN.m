function layers = createCNN(X, Y)
    inputShape = size(X, [1, 2, 3]);
    outputShape = numel(categories(Y));
    layers = [
        imageInputLayer(inputShape)
	    
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
	    
        fullyConnectedLayer(outputShape)
        softmaxLayer
        classificationLayer];
end