var ke,next,head:array[1..10000000] of longint;
    dd,n,m,q,p:longint;
    free:array[1..10000000] of boolean;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
 read(q,p);
end;
procedure DFS(u,k:longint);
var v,j:longint;
begin
 free[u]:=false;
 j:=head[u];
 while j<>0 do
 begin
  v:=ke[j];
  if v=k then
   begin
    dd:=1;
    exit;
   end;
  if free[v] then
   begin
    free[v]:=false;
    DFS(v,k);
   end;
  j:=next[j];
 end;
end;
procedure  xuli;
begin
  fillchar(free,sizeof(free),true);
  DFS(q,p);
  if dd=1 then
   begin
    write('yes');
    exit;
   end;
  dd:=0;
  fillchar(free,sizeof(free),true);
  DFS(p,q);
  if dd=1 then
   begin
    write('no');
    exit;
   end;
  write('unknown');
end;
begin
 assign(input,'taller.inp');reset(input);
 assign(output,'taller.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
