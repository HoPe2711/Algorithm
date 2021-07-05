uses math;
var  found:boolean;
     n,k,canh,t,h:longint;
     free:Array[0..20000] of boolean;
     ke,next,head,id,a,x:array[0..200000] of longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,j:longint;
begin
 read(n,k);
 for i:=1 to 300*300 do
  begin
   ke[i]:=0;
   next[i]:=0;
   head[i]:=0;
   id[i]:=0;
  end;
 canh:=0;
 for i:=1 to n do read(a[i]);
 for i:=1 to n-1 do
  for j:=i+1 to n do
   if abs(a[j]-a[i])>=k then
    begin
     inc(Canh);
     add(canh,i,j);
    end;
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v] then
    begin
     free[v]:=false;
     if id[v]=0 then found:=true
     else dfs(id[v]);
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
var i,xlist,oldsize:longint;
begin
 for i:=1 to n do x[i]:=i;
 xlist:=n;
 while true do
  begin
   oldsize:=xlist;
   for i:=1 to n do free[i]:=true;
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
 writeln(xlist);
end;
begin
 assign(input,'prosol.inp');reset(input);
 assign(output,'prosol.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input); close(outpuT);
end.