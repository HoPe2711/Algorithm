uses math;
var n,tmp,res,dem,canh:longint;
    free:array[-1001..1001,-1001..1001] of longint;
    visit,deg:array[0..2000000] of longint;
    ke,next,head:Array[-300000..300000] of longint;
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
var i,v,y,x,u,last:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(x,y,u,v);
   if free[x,y]=0 then
    begin
     inc(Dem);
     free[x,y]:=dem;
    end;
   if free[u,v]=0 then
    begin
     inc(Dem);
     free[u,v]:=dem;
    end;
   add(i,free[x,y],free[u,v]);
  end;
 canh:=n;
 for x:=-1000 to 1000 do
  begin
  last:=0;
  for y:=-1000 to 1000 do
   if free[x,y]<>0 then
    begin
     if last<>0 then
      begin
       inc(canh);
       add(canh,free[x,y],last);
      end;
     last:=free[x,y];
    end;
  end;
 for x:=-1000 to 1000 do
 begin
  last:=0;
  for y:=-1000 to 1000 do
   if free[y,x]<>0 then
    begin
     if last<>0 then
      begin
       inc(canh);
       add(canh,free[y,x],last);
      end;
     last:=free[y,x];
    end;
 end;
end;
procedure DFS(u:longint);
var  j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if visit[v]=0 then
    begin
     visit[v]:=1;
     if deg[v] mod 2=1 then inc(tmp);
     DFS(v);
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var i,j,v:longint;
begin
 for i:=1 to dem do
  begin
   j:=head[i];
   while j<>0 do
    begin
     v:=ke[j];
     inc(deg[i]);
     j:=next[j];
    end;
  end;
 for i:=1 to dem do
  if visit[i]=0 then
   begin
    tmp:=0;
    if deg[i] mod 2=1 then inc(tmp);
    visit[i]:=1;
    DFS(i);
    if tmp=0 then inc(res)
    else res:=res+tmp div 2;
   end;
 write(REs);
end;
begin
 assign(input,'archi.inp');reset(input);
 assign(output,'archi.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
