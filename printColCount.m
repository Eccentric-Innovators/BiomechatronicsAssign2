function printColCount(DataStruct)
    for i=1:numel(fieldnames(DataStruct))
        fn = fieldnames(DataStruct);
        fprintf("%s has %d columns.\n", string(fn(i)), size(DataStruct.(string(fn(i))), 2))
    end
end