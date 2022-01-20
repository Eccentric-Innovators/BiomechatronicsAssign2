function outStruct = cleanAllTables(inStruct)
    outStruct = inStruct;
    fn = string(fieldnames(outStruct));
    for i = 1:numel(fn)
        outStruct.(fn(i)) = removeAllButFirstTimelineCols(outStruct.(fn(i)));
        outStruct.(fn(i)) = removeAnnotationCols(outStruct.(fn(i)));
    end
end