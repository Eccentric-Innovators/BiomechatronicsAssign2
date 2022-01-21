function outStruct = generateFeaturesForAllTables(inStruct, tw, dt)
    outStruct = inStruct;
    fn = string(fieldnames(outStruct));
    for i = 1:numel(fn)
        outStruct.(fn(i)) = performWindowedOperation(inStruct.(fn(i)), tw, dt, "max");
        outStruct.(fn(i)) = [outStruct.(fn(i)) performWindowedOperation(inStruct.(fn(i)), tw, dt, "min")];
        outStruct.(fn(i)) = [outStruct.(fn(i)) performWindowedOperation(inStruct.(fn(i)), tw, dt, "mean")];
        outStruct.(fn(i)) = [outStruct.(fn(i)) performWindowedOperation(inStruct.(fn(i)), tw, dt, "std")];
        outStruct.(fn(i)) = [outStruct.(fn(i)) performWindowedOperation(inStruct.(fn(i)), tw, dt, "rms")];
        outStruct.(fn(i)) = [outStruct.(fn(i)) performWindowedOperation(inStruct.(fn(i)), tw, dt, "maxgrad")];
        outStruct.(fn(i)) = [outStruct.(fn(i)) performWindowedOperation(inStruct.(fn(i)), tw, dt, "zero_crossings")];
    end
end