function outTable = removeAnnotationCols(inTable)
    % Collect all column names ending with "Timestamp"
    colNames = string(inTable.Properties.VariableNames);
    annotationColNames = colNames(startsWith(colNames, "Annotation"));

    % Remove all "Annotation" columns
    outTable = inTable;
%     fprintf("%s, ", annotationColNames);
%     fprintf("\n");
    outTable(:,annotationColNames) = [];
end