function outStruct = interpolateAll(inStruct)
    outStruct = inStruct;
    fn = string(fieldnames(inStruct));
    for i = 1:numel(fn)
        if any(isnan(table2array(inStruct.(fn(i)))), "all")
%             fprintf("%s before: %d\n", fn(i), sum(isnan(table2array(inStruct.(fn(i)))), "all"))
            outStruct.(fn(i)) = interpolateNaNs(inStruct.(fn(i)));
%             fprintf("%s after: %d\n", fn(i), sum(isnan(table2array(outStruct.(fn(i)))), "all"))
        end
    end
end