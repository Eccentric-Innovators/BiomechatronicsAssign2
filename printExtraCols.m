function printExtraCols(DataStruct)
    fn = fieldnames(DataStruct);
    colNames = DataStruct.(string(fn(1))).Properties.VariableNames;
    for i=2:numel(fn)
        colNames = intersect(colNames, DataStruct.(string(fn(i))).Properties.VariableNames);
    end
    for i=1:numel(fn)
        extraCols = string(setdiff(DataStruct.(string(fn(i))).Properties.VariableNames, colNames));
        fprintf("Extra column names (%d exist) in %s are:\n", numel(extraCols), string(fn(i)))
        fprintf("%s, ", extraCols)
        fprintf("\n")
        fprintf("\n")
    end
end