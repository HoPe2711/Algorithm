uses math;
const oo=1000000001;
var f,r,m,n,x,y:longint;
    res:int64;
    a:array[0..100,0..500] of longint;
    d:array[0..100,0..500] of int64;
    queu,queu1:array[0..1000000] of longint;
   // free:array[0..100,0..500] of boolean;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
end;
procedure push(x,y:longint);
begin
 inc(r);
 queu[r]:=x;
 queu1[r]:=y;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure BFS;
var i,qq:longint;
begin
 r:=0; f:=1;
 for i:=1 to n do
  begin
   push(1,i);
   d[1,i]:=a[1,i];
  end;
 while f<=r do
  begin
   pop;
   if x<m then
   if  (d[x+1,y]>d[x,y]+a[x+1,y])  then
    begin
     d[x+1,y]:=d[x,y]+a[x+1,y];
     push(x+1,y);
    end;
   if y<n then
    if (d[x,y+1]>d[x,y]+a[x,y+1]) then
     begin
      d[x,y+1]:=d[x,y]+a[x,y+1];
      push(X,y+1);
     end;
   if y>1 then
    if (d[x,y-1]>d[x,y]+a[x,y-1]) then
     begin
      d[x,y-1]:=d[x,y]+a[x,y-1];
      push(X,y-1);
     end;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to m do
  for j:=1 to n do d[i,j]:=oo;
 bfs;
 res:=oo;
 for i:=1 to n do res:=min(res,d[m,i]);
 write(res);
end;
BEGIN
  assign(input,'sign.inp');reset(input);
  assign(output,'sign.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
