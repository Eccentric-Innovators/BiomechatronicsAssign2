function checkForNan(inStruct)
    fn = string(fieldnames(inStruct));
    for i = 1:numel(fn)
        fprintf("%s has %d NaNs.\n", fn(i), sum(isnan(table2array(inStruct.(fn(i)))), 'all'))
    end
end