function newfname = xlsx2tsv(xlsfname,newfname)
% Convert an xlsx file into a tsv file
% FORMAT newfname = xlsx2tsv(xlsfname,newfname)
%
% INPUTS:
% xlsfname       - Input xls (or xlsx) file name (string)
%
% OPTIONAL INPUTS:
% newfname       - Output tsv file name (string)
%
% EXAMPLES:
% >> xlsx2tsv('data.xlsx') % Output 'data.tsv'
% >> xlsx2tsv('data.xlsx','out.tsv')
%__________________________________________________________________________
% Copyright (C) 2022-2023 Daisuke MATSUYOSHI
% Released under the MIT license
% $Id: xlsx2tsv 0007 2023-07-04Z $

% Read xlsx
xlsdata = readcell(xlsfname);
% Deal with missing cells
xlsdata(cellfun(@(x) any(ismissing(x)), xlsdata)) = {''};

if nargin < 2
    [pth,nam] = fileparts(xlsfname);
    newfname = fullfile(pth,[nam '.tsv']);
end
[pth,nam,ext] = fileparts(newfname);
if ~strcmp(ext,'.tsv')
    ext = '.tsv';
    newfname = fullfile(pth,[nam ext]);
end
tsvwrite(newfname,xlsdata(1,:),xlsdata(2:end,:));
