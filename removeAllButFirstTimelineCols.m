function outTable = removeAllButFirstTimelineCols(inTable)
    % Collect all column names ending with "Timestamp"
    colNames = string(inTable.Properties.VariableNames);
    timestampColNames = colNames(endsWith(colNames, "Timestamp"));

    % Remove all but the first "R_Timestamp" or "L_Timestamp" column
    fIdx = numel(timestampColNames);
    for i=numel(timestampColNames):-1:1
        if (endsWith(timestampColNames(i), "R_Timestamp") || endsWith(timestampColNames(i), "L_Timestamp"))
            fIdx = i;
        end
    end
    outTable = inTable;
    idxsToRemove = timestampColNames([1:fIdx-1 fIdx+1:numel(timestampColNames)]);
%     fprintf("%s, ", idxsToRemove);
%     fprintf("\n");
    outTable(:,idxsToRemove) = [];
%     fprintf("Cols in table after removal:\n")
%     fprintf("%s, ", string(outTable.Properties.VariableNames));
%     fprintf("\n");
    tmp = outTable.(timestampColNames(fIdx));
    outTable(:,timestampColNames(fIdx)) = [];
    outTable = [table(tmp, 'VariableNames', ["Timestamp"]) outTable];
end