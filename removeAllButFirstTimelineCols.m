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
    outTable(:,idxsToRemove) = [];
    tmp = outTable.(fIdx);
    outTable(:,fIdx) = [];
    outTable = [table(tmp, 'VariableNames', ["Timestamp"]) outTable];
end