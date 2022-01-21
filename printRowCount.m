function printRowCount(DataStruct)
    for i=1:numel(fieldnames(DataStruct))
        fn = fieldnames(DataStruct);
        fprintf("%s has %d rows.\n", string(fn(i)), size(DataStruct.(string(fn(i))), 1))
    end
end