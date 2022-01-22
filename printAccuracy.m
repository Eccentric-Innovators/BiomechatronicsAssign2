function printAccuracy(X, Y, n, epochs)
    
    assert(nargin >= 2, "X and Y are required");

    if nargin == 2
        n = 10;
    end
    if nargin < 4
        epochs = 500;
    end

    cs = [];

    for i = 1:n
        [net, tr] = trainPatternnet(X, Y, epochs);
        tInd = tr.testInd;
        tstOutputs = net(X(:,tInd));
        [c,~] = confusion(Y(:,tInd),tstOutputs);
        cs(i) = c;
    end

    fprintf("Mean classification error of test set from %d trials: %f\n", n, mean(cs));
    fprintf("Mean classification accuracy of test set from %d trials: %f%%\n", n, mean(100*(1-cs)));
    fprintf("Std classification error of test set from %d trials: %f\n", n, std(cs));
    fprintf("Std classification accuracy of test set from %d trials: %f%%\n", n, std(100*(1-cs)));
    figure();
    bar(100.*(1-cs));
    xlabel("Trials");
    ylabel("Accuracies")
end