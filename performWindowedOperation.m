function outTable = performWindowedOperation(inTable, tw, dt, func)
    Ts = seconds(getSamplingTime(inTable));
    n_increment = round(dt/Ts);
    
    outTable = inTable(1, 2:end);
    outTable.Properties.VariableNames = string(inTable.Properties.VariableNames(2:end)) + "_" + func;

%     fprintf("No. of rows: %d\nn_increment: %d\nNo. of windows: %d", size(inTable, 1), n_increment, round(size(inTable, 1)/n_increment))

    for i = 1:n_increment:size(inTable, 1)
        if i + tw-1 <= size(inTable, 1)
            window = table2array(inTable(i:i+tw-1, 2:end));
            if func == "mean"
                means = num2cell(mean(window));
                newRow = table(means{:}, 'VariableNames', outTable.Properties.VariableNames);
                outTable = [outTable; newRow];
            elseif func == "max"
                maxs = num2cell(max(window));
                newRow = table(maxs{:}, 'VariableNames', outTable.Properties.VariableNames);
                outTable = [outTable; newRow];
            elseif func == "min"
                mins = num2cell(min(window));
                newRow = table(mins{:}, 'VariableNames', outTable.Properties.VariableNames);
                outTable = [outTable; newRow];
            elseif func == "std"
                stds = num2cell(std(window));
                newRow = table(stds{:}, 'VariableNames', outTable.Properties.VariableNames);
                outTable = [outTable; newRow];
            elseif func == "rms"
                rmss = num2cell(rms(window));
                newRow = table(rmss{:}, 'VariableNames', outTable.Properties.VariableNames);
                outTable = [outTable; newRow];
            elseif func == "maxgrad"
                maxgrads = num2cell(max(gradient(window)));
                newRow = table(maxgrads{:}, 'VariableNames', outTable.Properties.VariableNames);
                outTable = [outTable; newRow];
            elseif func == "zero_crossings"
                signs = sign(window) - 1;
                zc = xor(signs(2:end,:), signs(1:end-1,:));
                nzc = num2cell(sum(zc));
                newRow = table(nzc{:}, 'VariableNames', outTable.Properties.VariableNames);
                outTable = [outTable; newRow];
            end
        end
    end
    outTable(1,:) = [];
end