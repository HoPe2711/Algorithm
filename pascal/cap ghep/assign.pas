uses math;
var ke,next,head,id,x:array[-200000..200000] of longint;
    xlist,n,m,p:longint;
    free:Array[-200000..200000] of boolean;
    found:boolean;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(m,n,p);
 for i:=1 to p do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u:longint);
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
var oldsize,i:longint;
begin
 for i:=1 to m do x[i]:=i;
 xlist:=m;
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
     if oldsize=xlist then break;
  end;
 writeln(m-xlist);
 for i:=1 to n do write(id[i],' ');
end;
begin
 assign(input,'assign.inp');reset(input);
 assign(output,'assign.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.