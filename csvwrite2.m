function csvwrite2(outfname,header,data)
% Write csv
% FORMAT csvwrite2(outfname,header,data)
%
% INPUTS:
% outfname       - Output file name (string)
% header         - Header (cell array)
% data           - Data (cell matrix or numeric matrix)
%__________________________________________________________________________
% Copyright (C) 2023 Daisuke MATSUYOSHI
% Released under the MIT license
% $Id: csvwrite2 0007 2023-06-14Z $

[pth,nam,ext] = fileparts(outfname);
if ~strcmp(ext,'.csv')
    ext = '.csv';
    outfname = fullfile(pth,[nam ext]);
end

% header
if ~iscell(header)
    error('2nd argument is not a cell array.')
end
fid = fopen(outfname,'w');
if numel(header) == 1
    fprintf(fid,'%s\n',header{1});
else
    fprintf(fid,'%s,',header{1:end-1});
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
        fprintf(fid,'%s,',data{i,1:end-1});
        fprintf(fid,'%s\n',data{i,end});
    end
end
fclose(fid);
