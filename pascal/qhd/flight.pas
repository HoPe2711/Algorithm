uses math;
const oo=1000000000;
var ke,next,head:array[-10000..10000] of longint;
    d:array[0..2500] of longint;
    ok:boolean;
    free:array[0..2500] of boolean;
    n,res:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure dfs(u,s:longint);
var j,v:longint;
begin
 j:=head[u];  free[u]:=true;
 while j<>0 do
  begin
   v:=ke[j];
   if (v<>s) and (free[v]=false) then
   if d[v]<d[u]+1 then
    begin
     d[v]:=d[u]+1;
     dfs(v,s);
    end;
   j:=next[j];
  end;
end;

procedure xuli;
var i,u,v,tt,kq,qmax,qmax1,j,res1,h:longint;
begin

 fillchar(free,sizeof(free),false);
 fillchar(d,sizeof(d),0);
 DFS(1,-1);
 tt:=0; kq:=0;
  for i:=1 to n do
   if tt<d[i] then
    begin
     tt:=d[i];
     kq:=i;
    end;


   fillchar(d,sizeof(d),0);
   fillchar(free,sizeof(free),false);
   DFS(kq,-1);
   for i:=1 to n do res:=max(res,d[i]);
 h:=res;
 for j:=1 to n-1 do
  begin
   u:=ke[j];
   v:=ke[-j];
   qmax:=0;  tt:=0; kq:=0;
   fillchar(free,sizeof(free),false);
   fillchar(d,sizeof(d),0);
   DFS(u,v);
   for i:=1 to n do
   if tt<d[i] then
    begin
     tt:=d[i];
     kq:=i;
    end;


   fillchar(d,sizeof(d),0);
   fillchar(free,sizeof(free),false);
   DFS(kq,v);
   for i:=1 to n do qmax:=max(qmax,d[i]);


   qmax1:=0;  tt:=0; kq:=0;
   fillchar(d,sizeof(d),0);
   fillchar(free,sizeof(free),false);
   DFS(v,u);
   for i:=1 to n do
   if tt<d[i] then
    begin
     tt:=d[i];
     kq:=i;
    end;


   fillchar(d,sizeof(d),0);
   fillchar(free,sizeof(free),false);
   DFS(kq,u);
   for i:=1 to n do qmax1:=max(qmax1,d[i]);
   res1:=0;
   res1:=max(max(qmax,qmax1),(qmax+1) div 2+(qmax1+1) div 2+1);
   res:=min(res,res1);
   //if res=h then ok:=true;
  end;
 if (res=h) then res:=-1;
 write(res);
end;
begin
 assign(input,'flight.inp');reset(input);
 assign(output,'flight.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
