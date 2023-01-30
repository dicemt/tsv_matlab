function tsvwrite(outfname,header,data)
% Write tsv
% FORMAT tsvwrite(outfname,header,data)
%
% INPUTS:
% outfname       - Output file name (string)
% header         - Header (cell array)
% data           - Data (cell matrix or numeric matrix)
%__________________________________________________________________________
% Copyright (C) 2022-2023 Daisuke MATSUYOSHI
% Released under the MIT license
% $Id: tsvwrite 0005 2023-01-30Z $

[pth,nam,ext] = fileparts(outfname);
if ~strcmp(ext,'.tsv');
    ext = '.tsv';
    outfname = fullfile(pth,[nam ext]);
end

% header
fid = fopen(outfname,'w');
if numel(header) == 1
    fprintf(fid,'%s\n',header{1});
else
    fprintf(fid,'%s\t',header{1:end-1});
    fprintf(fid,'%s\n',header{end});
end
fclose(fid);

% data
if ~iscell(data)
    data = arrayfun(@num2str, data, 'UniformOutput', 0);
end

fid = fopen(outfname,'a');
if size(data,2) == 1
    for i=1:size(data,1)
        fprintf(fid,'%s\n',data{i,end});
    end
else
    for i=1:size(data,1)
        fprintf(fid,'%s\t',data{i,1:end-1});
        fprintf(fid,'%s\n',data{i,end});
    end
end
fclose(fid);
