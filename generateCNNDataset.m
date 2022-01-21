function [X, Y] = generateCNNDataset(LGWFiltered, RAFiltered, RDFiltered, SiStFiltered, StSiFiltered, tw, dt)
    Ts = 0;
    n = 0;
    
    function [TsSum, n] = addAllTs(inStruct)
        TsSum = 0;
        fn1 = string(fieldnames(inStruct));
        n = numel(fn1);
        for i1=1:n
            TsSum = TsSum + seconds(getSamplingTime(inStruct.(fn1(i1))));
        end
    end

    [Tstmp ntmp] = addAllTs(LGWFiltered);
    Ts = Ts + Tstmp;
    n = n + ntmp;
    [Tstmp ntmp] = addAllTs(RAFiltered);
    Ts = Ts + Tstmp;
    n = n + ntmp;
    [Tstmp ntmp] = addAllTs(RDFiltered);
    Ts = Ts + Tstmp;
    n = n + ntmp;
    [Tstmp ntmp] = addAllTs(SiStFiltered);
    Ts = Ts + Tstmp;
    n = n + ntmp;
    [Tstmp ntmp] = addAllTs(StSiFiltered);
    Ts = Ts + Tstmp;
    n = n + ntmp;
    Ts = Ts / n;

    n_increment = round(dt/Ts);

    fn = string(fieldnames(LGWFiltered));
    imWidth = size(LGWFiltered.(fn(1)), 2)-1;
    fprintf("Generating windows of size (%d, %d)\n", tw, imWidth);

%     n_windows = 0;
% 
%     function n = nWindows(inStruct, n_increment)
%         n = 0;
%         fn1 = string(fieldnames(inStruct));
%         for i1=1:numel(fn1)
%             n = n + (size(inStruct.(fn1(i1)), 1) / )
%         end
%     end
% 
%     X = zeros(n_increment, size(LGWFiltered.(fn(1)).Properties.VariableNames, 2)-1, 1, )

    function [X1, n1] = getX(inStruct, n_increment, tw)
        function [X2, n2] = getXTable(inTable, n_increment, tw)
            X2 = [];
            n2 = 0;
            for i2 = 1:n_increment:size(inTable, 1)
                if i2 + tw-1 <= size(inTable, 1)
                    n2 = n2 + 1;
                    window = table2array(inTable(i2:i2+tw-1, 2:end));
                    X2(1:tw, 1:imWidth, 1, n2) = reshape(window, [tw, imWidth, 1, 1]);
                end
            end
        end

        X1 = [];
        n1 = 0;

        fn1 = string(fieldnames(inStruct));
        for i1 = 1:numel(fn1)
            [X2, n2] = getXTable(inStruct.(fn1(i1)), n_increment, tw);
            X1(1:tw, 1:imWidth, 1, n1+1:n1+n2) = X2;
            n1 = n1 + n2;
        end
    end

    n_data = 0;

    X = [];
    Y = [];

    [Xtmp ntmp] = getX(LGWFiltered, n_increment, tw);
    X(1:tw, 1:imWidth, 1, n_data+1:n_data+ntmp) = Xtmp;
    Y(n_data+1:n_data+ntmp) = ones(ntmp, 1) * 1;
    n_data = n_data + ntmp;
    [Xtmp ntmp] = getX(RAFiltered, n_increment, tw);
    X(1:tw, 1:imWidth, 1, n_data+1:n_data+ntmp) = Xtmp;
    Y(n_data+1:n_data+ntmp) = ones(ntmp, 1) * 2;
    n_data = n_data + ntmp;
    [Xtmp ntmp] = getX(RDFiltered, n_increment, tw);
    X(1:tw, 1:imWidth, 1, n_data+1:n_data+ntmp) = Xtmp;
    Y(n_data+1:n_data+ntmp) = ones(ntmp, 1) * 3;
    n_data = n_data + ntmp;
    [Xtmp ntmp] = getX(SiStFiltered, n_increment, tw);
    X(1:tw, 1:imWidth, 1, n_data+1:n_data+ntmp) = Xtmp;
    Y(n_data+1:n_data+ntmp) = ones(ntmp, 1) * 4;
    n_data = n_data + ntmp;
    [Xtmp ntmp] = getX(StSiFiltered, n_increment, tw);
    X(1:tw, 1:imWidth, 1, n_data+1:n_data+ntmp) = Xtmp;
    Y(n_data+1:n_data+ntmp) = ones(ntmp, 1) * 5;
    n_data = n_data + ntmp;
    
    Y = categorical(Y);
end