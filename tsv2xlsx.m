function newfname = tsv2xlsx(tsvfname,newfname)
% Convert a tsv file into an xlsx file
% FORMAT newfname = tsv2xlsx(tsvfname,newfname)
%
% INPUTS:
% tsvfname       - Input tsv file name (string)
%
% OPTIONAL INPUTS:
% newfname       - Output xlsx file name (string)
%
% EXAMPLES:
% >> tsv2xlsx('data.tsv') % Output 'data.xlsx'
% >> tsv2xlsx('data.tsv','out.xlsx')
%__________________________________________________________________________
% Copyright (C) 2022-2023 Daisuke MATSUYOSHI
% Released under the MIT license
% $Id: tsv2xlsx 0005 2023-06-14Z $

[~,~,raw] = tsvread(tsvfname);
if nargin < 2
    [pth,nam] = fileparts(tsvfname);
    newfname = fullfile(pth,[nam '.xlsx']);
end

[pth,nam,ext] = fileparts(newfname);
if ~strcmp(ext,'.xlsx');
    ext = '.xlsx';
    newfname = fullfile(pth,[nam ext]);
end

writecell(raw,newfname);

