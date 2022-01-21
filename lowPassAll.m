function outStruct = lowPassAll(inStruct)
    outStruct = inStruct;
    fn = string(fieldnames(outStruct));
    for i = 1:numel(fn)
        outStruct.(fn(i)) = lowPass(inStruct.(fn(i)));
    end
end