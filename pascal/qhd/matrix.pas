{$H+}
uses math;
var n,m,res:longint;
    st:array[0..2005] of string;
    a,h,f:array[0..2002,0..2002] of longint;
procedure nhap;
var i,j:longint;
begin
 readln(n,m);
 for i:=1 to n do
  begin
   readln(st[i]);
   for j:=1 to m do
    if st[i][j]='1' then a[i,j]:=1
    else a[i,j]:=0;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 for j:=1 to m do
  for i:=n downto 1 do
   if a[i,j]=0 then h[i,j]:=0
   else h[i,j]:=h[i+1,j]+1;
 for i:=1 to n do
  for j:=1 to m do
   if a[i,j]=0 then   f[i,j]:=0
   else f[i,j]:=min(f[i,j-1]+1,h[i,j]);
 for i:=1 to n do
  for j:=1 to m do res:=res+f[i,j];
 write(ReS);
end;
begin
 assign(input,'matrix.inp');reset(input);
 assign(output,'matrix.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.