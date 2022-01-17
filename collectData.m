function DataStruct = collectData(FileList)
    DataStruct = struct();
    for i=1:numel(FileList)
        fieldName = split(FileList(i),"\");
        fieldName = split(fieldName(end),".");
        fieldName = split(fieldName(1));
        fieldName = strip(fieldName(1),"both","_");
        DataStruct.(fieldName) = readtable(FileList(i));
    end
end