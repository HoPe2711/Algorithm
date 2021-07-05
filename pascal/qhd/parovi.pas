const base=1000000000;
var n,m:longint;
    c,c1:array[0..200] of longint;
    f:array[0..200,0..20] of int64;
procedure sinh;
var i,j:longint;
begin
 m:=0;
 for i:=1 to n-1 do
  for j:=i+1 to n do
   begin
    inc(m);
    c[m]:=i;
    c1[m]:=j;
   end;
end;
procedure qhd;
var i,j:longint;
begin
 for i:=1 to m do
 for j:=1 to n do f[i,j]:=0;
 f[0,1]:=1;
 for i:=0 to m-1 do
  for j:=1 to n do
   begin
    if (c[i+1]<=j) and (c1[i+1]>=j) then f[i+1,c1[i+1]]:=(f[i,j]+f[i+1,c1[i+1]]) mod base;
    f[i+1,j]:=f[i,j] ;
   end;
end;
begin
 assign(input,'parovi.inp'); reset(input);
 assign(output,'parovi.out'); rewrite(output);
 while not seekeof do
  begin
   read(n);
   sinh;
   qhd;
   writeln(f[m,n]);
  end;
 close(input);
 close(output);
end.