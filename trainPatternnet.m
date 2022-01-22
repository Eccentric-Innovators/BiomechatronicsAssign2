function [net, tr] = trainPatternnet(X, Y, epochs)

    assert(nargin >= 2, "X and Y are required.");

    if nargin == 2
        epochs = 500;
    end
    
    % Create a Pattern Recognition Network
    net = patternnet(25, 'traingdm');
    
    % Set up Division of Data for Training, Validation, Testing Subsets
    net.divideParam.trainRatio = 80/100;
    net.divideParam.valRatio = 0/100;
    net.divideParam.testRatio = 20/100;
    
    net.trainParam.epochs = epochs;
    net.trainParam.showWindow = false;
    
    % Train the Network
    [net, tr] = train(net, X, Y);
end