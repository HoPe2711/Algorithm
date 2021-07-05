{$H+}
uses math;
const base=666013;
var st,st1:string;
    n,m:longint;
    f,g:array[0..500,0..500] of longint;
procedure nhap;
var i,j:longint;
begin
 readln(St);
 readln(St1);
 n:=length(st); m:=length(St1);
// g[0,0]:=1;
 for i:=1 to n do
  for j:=1 to m do
   if st[i]=st1[j] then
    begin
     if f[i,j]<f[i-1,j-1]+1 then
      begin
       f[i,j]:=max(f[i,j],f[i-1,j-1]+1);
       if f[i,j]>1 then  g[i,j]:=g[i-1,j-1]
       else g[i,j]:=1;
      end
     else if f[i,j]=f[i-1,j-1]+1 then g[i,j]:=(g[i,j]+g[i-1,j-1]) mod base;
    end
   else
    begin
     if f[i,j-1]<f[i-1,j] then
      begin
       g[i,j]:=g[i-1,j]  mod base ;
       f[i,j]:=max(f[i-1,j],f[i,j-1]);
      end
     else if f[i,j-1]>f[i-1,j] then
      begin
       g[i,j]:=g[i,j-1] mod base ;
       f[i,j]:=max(f[i-1,j],f[i,j-1]);
      end
     else
      begin
       f[i,j]:=max(f[i-1,j],f[i,j-1]);
       g[i,j]:=(g[i,j-1]+g[i-1,j]) mod base;
       if f[i-1,j-1]=f[i,j] then g[i,j]:=(g[i,j]-g[i-1,j-1]+base) mod base;
      end;
    end;
 write(f[n,m],' ',g[n,m]);
end;
begin
 assign(input,'substr.inp');reset(input);
 assign(output,'substr.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
