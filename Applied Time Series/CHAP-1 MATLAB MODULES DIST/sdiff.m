function y=sdiff(x,T,nd)
%
%   y=sdiff(x,T,nd)
%
% x = input series
% T = period of differencing
% nd = no. of times to difference
ddata=x;
for j=1:nd
    ddata=ddata(T+1:end)-ddata(1:end-T);
end
y=ddata;
