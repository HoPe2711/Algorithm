uses math;
var res,n,m:longint;
    ke,next,head,ts,d:array[-100000..100000] of longint;
    free:array[0..100000] of boolean;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure khoitao;
var i:longint;
begin
 for i:=1 to n do d[i]:=1000000;
 d[1]:=0;
end;
function findmin:longint;
var i,kq:longint;
begin
 kq:=maxlongint;
 for i:=1 to n do
  if (kq>d[i]) and free[i] then
   begin
     kq:=d[i];
     findmin:=i;
   end;
end;
procedure xuli;
var i,j,u,v:longint;
begin
  fillchar(free,sizeof(free),true);
  for i:=1 to n do
   begin
    u:=findmin;
    free[u]:=false;
    j:=head[u];
    while j<>0 do
     begin
      v:=ke[j];
      if (d[v]>ts[j]) and free[v] then d[v]:=ts[j];
      j:=next[j];
     end;
    res:=max(res,d[u]);
   end;
  write(res);
end;
BEGIN
  assign(input,'how.inp');reset(input);
  assign(output,'how.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  close(input);close(output);
END.
