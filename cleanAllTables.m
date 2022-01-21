function outStruct = cleanAllTables(inStruct)
    outStruct = inStruct;
    fn = string(fieldnames(outStruct));
    for i = 1:numel(fn)
%         fprintf("%s, removing cols:\n", fn(i));
%         fprintf("before:\n");
%         fprintf("%s, ", string(inStruct.(fn(i)).Properties.VariableNames));
%         fprintf("\nCols removed by timestamp func:\n");
        outStruct.(fn(i)) = removeAllButFirstTimelineCols(outStruct.(fn(i)));
%         fprintf("after timestamp func:\n");
%         fprintf("%s, ", string(outStruct.(fn(i)).Properties.VariableNames));
%         fprintf("\nCols removed by annotation func:\n");
        outStruct.(fn(i)) = removeAnnotationCols(outStruct.(fn(i)));
%         fprintf("end:\n");
%         fprintf("%s, ", string(outStruct.(fn(i)).Properties.VariableNames));
%         fprintf("\n\n");
    end
end