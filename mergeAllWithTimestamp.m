function mergedWithTimestamps = mergeAllWithTimestamp(table, tol)
    mergedWithTimestamps = mergeWithTimestamp(table(:,1:10), table(:,11:20), tol);
    for i=21:10:numel(table.Properties.VariableNames)-3
        mergedWithTimestamps = mergeWithTimestamp(mergedWithTimestamps, table(:,i:i+9), tol);
    end
end