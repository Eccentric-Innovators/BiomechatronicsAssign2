function outTable = lowPass(inTable)
    Ts = seconds(getSamplingTime(inTable));

    % Sampling frequency
    Fs = 1/Ts;
    
    % Nyquist frequency
    Fn = Fs/2;
    
    % Order of the Low Pass Filter
    order = 2;
    
    % Cutoff frequency of the filter (find by trial and error)
    fcut = 22;
    
    % Returns transfer function coefficients for a butterworth filter
    [b,a] = butter(order, fcut/(Fn/2), "low");
    
    % Perform the filtering
    filteredData = num2cell(filter(b, a, table2array(inTable(:, 2:end))),1);

    vn = string(inTable.Properties.VariableNames);

    outTable = table(inTable.(1), filteredData{:}, 'VariableNames', vn);
end