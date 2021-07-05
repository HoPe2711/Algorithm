var res,x,n:longint;
    a,truoc,f:array[1..10000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var i,j:longint;
begin
 f[1]:=1;
 for i:=2 to n do
  begin
   f[i]:=1;
   for j:=1 to n do
    if (f[i]<f[j]+1) and (a[j]<a[i]) then
     begin
      f[i]:=f[j]+1;
      truoc[i]:=j;
     end;
  end;
 res:=0;
 for i:=1 to n do
  if res<f[i] then
  begin
   res:=f[i];
   x:=i;
  end;
 writeln(res);
end;
procedure duyet(x:longint);
begin
 if x=0 then exit;
 duyet(truoc[x]);
 write(a[x]);
end;
BEGIN
  assign(input,'so.inp');reset(input);
  assign(output,'so.out');rewrite(output);
  nhap;
  xuli;
  duyet(x);
  close(input);close(output);
END.



