function Ts = getSamplingTime(inTable)
    if class(inTable.(1)) == "double"
        inTable.(1) = milliseconds(inTable.(1));
    end
    timestamps = inTable.(1);
    Ts = (timestamps(end) - timestamps(1))/numel(timestamps);
end