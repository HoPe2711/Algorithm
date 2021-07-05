uses math;
var n,m:longint;
    a,b,f:array[0..1500] of longint;
procedure xuli;
var i,j,tg,tgt,res:longint;
begin
 res:=0;
 for i:=0 to m do f[i]:=0;
 for i:=1 to n do
  begin
  tg:=0; tgt:=0;
  for j:=1 to m do
   begin
    if a[i]=b[j] then  tg:=tgt+1;
    if a[i] >= 2*b[j] then tgt:=max(tgt,f[j]);
    if a[i]=b[j] then
     begin
      res:=max(res,tg);
      f[j]:=max(f[j],tg);
     end;
   end;
  end;
 writeln(res);
end;
procedure nhap;
var i,j,t:longint;
begin
 read(t);
 for j:=1 to t do
  begin
   read(n,m);
   for i:=1 to n do read(a[i]);
   for i:=1 to m do read(b[i]);
   xuli;
  end;
end;
begin
 nhap;
end.
