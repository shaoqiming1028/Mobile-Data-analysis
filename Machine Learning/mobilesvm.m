function [ M data ] = mobilesvm()
%MOBILESVM Summary of this function goes here
%   Detailed explanation goes here

% A = importdata('data1.txt');
% M = [];
% for i = 1:numel(A)
%     M=[M;json2mat(A{i})];
% end

M=json2mat('data1.txt');

%sensor list

[~,n1]=size(M.alist);
[~,n2]=size(M.glist);
[~,n3]=size(M.gvyList);
n=min(n3,min(n1,n2));

listlabel=[];
alistx=[];
alisty=[];
alistz=[];
glistx=[];
glisty=[];
glistz=[];
gvylistx=[];
gvylisty=[];
gvylistz=[];

for i=1:n
    al=M.alist{1,i};
    listlabel=[listlabel;al.lable];
    alistx=[alistx;al.x];   
    alisty=[alisty;al.y];
    alistz=[alistz;al.z];
    
    gl=M.glist{1,i};
    glistx=[glistx;gl.x];
    glisty=[glisty;gl.y];
    glistz=[glistz;gl.z];
    
    gvyl=M.gvyList{1,i};
    gvylistx=[gvylistx;gvyl.x];
    gvylisty=[gvylisty;gvyl.y];
    gvylistz=[gvylistz;gvyl.z];
end

data=[listlabel,alistx,alisty,alistz,glistx,glisty,glistz,gvylistx,gvylisty,gvylistz];

end

