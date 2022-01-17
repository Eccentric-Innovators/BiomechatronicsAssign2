function mergedTable = mergeWithTimestamp(l_table, r_table, tol)
    if class(l_table.(1)) == "double"
        l_table.(1) = milliseconds(l_table.(1));
    end
    if class(r_table.(1)) == "double"
        r_table.(1) = milliseconds(r_table.(1));
    end
    
    l_tt = table2timetable(l_table);
    r_tt = table2timetable(r_table);
    
    s = withtol(l_tt.(string(l_table.Properties.VariableNames(1))), tol);
    
    r_tt_match = r_tt(s, 1:end);
    
    mergedTable = [l_tt(r_tt_match.(string(r_table.Properties.VariableNames(1))),1:end), r_tt_match];
    
    mergedTable.Properties.DimensionNames(1) = cellstr('Time');
    mergedTable.Properties.VariableDescriptions(1) = cellstr('Time');
    mergedTable = timetable2table(mergedTable);
end