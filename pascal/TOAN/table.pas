var a:array[-2001..2001,-2001..2001] of int64;
    n,m,r:longint;
procedure nhap;
var i:longint;
begin
 read(n,m,r);
 for i:=1 to m do
  begin
   read(a[1,i]);
   a[1,i]:=a[1,i] mod r;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 for j:=1 to m do a[2,j]:=(a[1,j-1]+a[1,j]+a[1,j+1]) mod r;
 for i:=3 to n do
  begin
   a[i,1]:=(2*a[i-1,2]+a[i-1,1]) mod r;
   if i=3 then
   for j:=2 to m-1 do a[i,j]:=(2*a[i-1,j-1] mod r + 2*a[i-1,j+1] mod r- a[i-2,j] mod r +a[i-1,j]+r) mod r
   else
   for j:=2 to m-1 do a[i,j]:=(2*a[i-1,j-1] mod r + 2*a[i-1,j+1] mod r- 2*a[i-2,j] mod r +a[i-1,j]+r) mod r;
   a[i,m]:=(2*a[i-1,m-1]+a[i-1,m]) mod r;
  end;
 for j:=1 to m do write(a[n,j],' ');
end;
begin
 assign(input,'table.inp');reset(input);
 assign(output,'table.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
