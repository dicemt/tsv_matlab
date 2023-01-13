# tsv_matlab
Author: Daisuke Matsuyoshi (National Institutes for Quantum Science and Technology ([QST](https://www.qst.go.jp/site/qst-english/)) and [Araya, Inc.](https://www.araya.org/))

Simple functions for processing tsv files using MATLAB (convert xlsx to tsv, read and write tsv)

# Usage

## Basic usage
```matlab
xlsx2tsv('data.xlsx','out.tsv')
tsv2xlsx('data.tsv','out.xlsx')
tsvwrite('data.tsv',{'height','weight'},[180 85; 170 70])
tsvwrite('data.tsv',{'id','food'},{'25'  'apple'; '64' 'orange'})
tsvwrite('data.tsv',{'id','value'},[1 1024; 2 512])
```

