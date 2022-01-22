function outStruct = getOnlyColsStartWith(inStruct, stString)
    outStruct = inStruct;
    fn = string(fieldnames(inStruct));
    for i = 1:numel(fn)
        reqdCols = startsWith(string(inStruct.(fn(i)).Properties.VariableNames), stString);
        outStruct.(fn(i)) = [inStruct.(fn(i))(:, 1) inStruct.(fn(i))(:, reqdCols)];
    end
end