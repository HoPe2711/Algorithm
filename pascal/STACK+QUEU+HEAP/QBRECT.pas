uses math;
var h,stack,l,r:array[0..1001] of longint;
    a:array[1..1000,1..1000] of longint;
    res,n,m:longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
end;
procedure timl;
var top,j:longint;
begin
 top:=0;
 stack[0]:=0;
 for j:=1 to n do
  begin
   while (top>0) and (h[j]<=h[stack[top]]) do dec(top);
   l[j]:=stack[top]+1;
   inc(top);
   stack[top]:=j;
  end;
end;
procedure timr;
var top,j:longint;
begin
 top:=0;
 stack[0]:=n+1;
 for j:=n downto 1 do
  begin
   while (top>0) and (h[j]<=h[stack[top]]) do dec(top);
   r[j]:=stack[top];
   inc(top);
   stack[top]:=j;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to m do
  begin
   for j:=1 to n do  h[j]:=(h[j]+1)*a[i,j];
   timl;
   timr;
   for j:=1 to n do
   res:=max(res,h[j]*(r[j]-l[j]));
  end;
 write(res);
end;
begin
 nhap;
 xuli;
end.