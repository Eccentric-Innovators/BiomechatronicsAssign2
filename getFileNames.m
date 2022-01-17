function FileList = getFileNames(Folder)
    FileList = strings();
    FolderInfo = dir(Folder);
    for j=3:numel(FolderInfo)
        FileList(end+1) = fullfile(Folder,FolderInfo(j).name);
    end
    FileList(1) = [];
end