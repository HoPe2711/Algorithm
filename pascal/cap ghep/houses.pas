uses math;
var ke,next,head,a,p,x,y,id:array[0..2000000] of longint;
    n,m,canh:longint;
    free:array[0..2000000] of boolean;
    found:boolean;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,j:longint;
begin
 read(n,m);
 for i:=1 to n do read(a[i],p[i]);
 for i:=1 to m do read(x[i],y[i]);
 for i:=1 to n do
  for j:=1 to m do
   if (x[j]>a[i]) and (y[j]<=p[i]) then
    begin
     inc(Canh);
     add(canh,i,j);
    end;
end;
procedure dfs(u:longint);
var  j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v] then
    begin
     free[v]:=false;
     if id[v]=0 then found:=true
     else DFS(id[v]);
     if found then
      begin
       id[v]:=u;
       exit;
      end;
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var  i,oldsize,xlist:longint;
begin
 for i:=1 to n do x[i]:=i;
 xlist:=n;
 while true do
  begin
   oldsize:=xlist;
   for i:=1 to m do free[i]:=true;
   for i:=xlist downto 1 do
    begin
     found:=false;
     DFS(x[i]);
     if found then
      begin
       x[i]:=x[xlist];
       dec(xlist);
      end;
    end;
   if xlist=oldsize then break;
  end;
 write(n-xlist);
end;
begin
 assign(input,'houses.inp');reset(input);
 assign(output,'houses.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.