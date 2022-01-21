function dataset = combineAndAddOneHot(LGW, RA, RD, SiSt, StSi)
    function data = combine(inStruct)
        fn = string(fieldnames(inStruct));
        data = inStruct.(fn(1));
        for i = 2:numel(fn)
            data = [data; inStruct.(fn(i))];
        end
    end

    LGWData = combine(LGW);
    RAData = combine(RA);
    RDData = combine(RD);
    SiStData = combine(SiSt);
    StSiData = combine(StSi);

    function outData = addOneHotCols(inData, idx)
        nRows = size(inData, 1);
        oneHotCols = zeros(nRows, 5);
        oneHotCols(:, idx) = ones(nRows, 1);
        oneHotCols = array2table(oneHotCols, "VariableNames", ["LGW", "RA", "RD", "SiSt", "StSi"]);
        outData = [inData oneHotCols];
    end

    LGWData = addOneHotCols(LGWData, 1);
    RAData = addOneHotCols(RAData, 2);
    RDData = addOneHotCols(RDData, 3);
    SiStData = addOneHotCols(SiStData, 4);
    StSiData = addOneHotCols(StSiData, 5);

    fprintf("Merged:\n");
    fprintf("%d rows from LGW\n", size(LGWData, 1));
    fprintf("%d rows from RA\n", size(RAData, 1));
    fprintf("%d rows from RD\n", size(RDData, 1));
    fprintf("%d rows from SiSt\n", size(SiStData, 1));
    fprintf("%d rows from StSi\n", size(StSiData, 1));

    dataset = [LGWData; RAData; RDData; SiStData; StSiData];
end