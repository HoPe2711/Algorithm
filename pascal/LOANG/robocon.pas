uses math;
const oo=1000000000;
      q:array[1..6] of longint=(0,1,1,0,1,1);
      q1:array[1..6] of longint=(1,0,1,-1,0,-1) ;
var n,k,x,y,res,f,r:longint;
    d,d1:array[0..500,0..500] of longint;
    a:array[0..500,0..500] of boolean;
    queu,queu1:array[0..5000000] of longint;
procedure nhap;
var i,x,y:longint;
begin
 read(n,k);
 for i:=1 to k do
  begin
   read(x,y);
   a[x,y]:=true;
  end;
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
procedure BFS(s,s1:longint);
var i,j,u,v:longint;
begin
 for i:=1 to n do
  for j:=1 to n do d[i,j]:=oo;
 d[s,s1]:=0;
 f:=1; r:=0;
 push(s,s1);
 while f<=r do
  begin
   pop;
   for i:=1 to 3 do
    begin
     u:=x+q[i];
     v:=y+q1[i];
     if (u>=1) and (u<=n) and (v>=1) and (v<=n) then
      if (a[u,v]=false) and (d[u,v]>d[x,y]+1) then
       begin
        d[u,v]:=d[x,y]+1;
        push(u,v);
       end;
    end;
  end;
end;
procedure BFS1(s,s1:longint);
var i,j,u,v:longint;
begin
 for i:=1 to n do
  for j:=1 to n do d1[i,j]:=oo;
 d1[s,s1]:=0;
 f:=1; r:=0;
 push(s,s1);
 while f<=r do
  begin
   pop;
   for i:=4 to 6 do
    begin
     u:=x+q[i];
     v:=y+q1[i];
     if (u>=1) and (u<=n) and (v>=1) and (v<=n) then
      if (a[u,v]=false) and (d1[u,v]>d1[x,y]+1) then
       begin
        d1[u,v]:=d1[x,y]+1;
        push(u,v);
       end;
    end;
  end;
end;
procedure xuli;
var  i,j:longint;
begin
 BFS(1,1);
 BFS1(1,n);
 res:=oo;
 for i:=1 to n do
  for j:=1 to n do
   if (d[i,j]<>oo) and (d1[i,j]<>oo) then res:=min(res,max(d[i,j],d1[i,j]));
 write(res);
end;
begin
// assign(input,'robocon.inp'); reset(input);
// assign(output,'robocon.out');rewrite(output);
 nhap;
 xuli;
// close(input); close(output);
end.