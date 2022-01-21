function outTable = interpolateNaNs(inTable)
%     fprintf("before: %d\n", sum(isnan(table2array(inTable)), "all"))
    outTable = inTable;
    for i = 2:numel(inTable.Properties.VariableNames)
        x = inTable.(1);
        y = inTable.(i);
        t = all(~isnan([x,y]),2);
        outTable.(i) = interp1(x(t),y(t),x,'pchip','extrap');
    end
%     fprintf("after: %d\n", sum(isnan(table2array(outTable)), "all"))
end