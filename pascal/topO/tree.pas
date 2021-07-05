uses math;
const oo=maxlongint;
var ke,next,head,a,d,con:array[-10000..10000] of longint;
    res,n,sum:longint;
    f:Array[0..5000,0..5000] of longint;
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
 for i:=1 to n do
  begin
   read(a[i]);
   sum:=sum+a[i];
  end;
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
// d[u]:=1;
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     con[u]:=v;
     DFS(v,u);
    // d[u]:=d[u]+d[v];
    end;
   j:=next[j];
  end;
end;
procedure DFSS(u,p:longint);
var v,k,k1,j,tg:longint;
begin
 j:=head[u];
 if con[u]=0 then
  begin
   f[u,1]:=abs(a[u]-1);
   d[u]:=1;
   f[u,0]:=a[u];
   exit;
  end;
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     DFSS(v,u);
     d[u]:=d[v]+d[u];
     if d[u]=d[v] then
      for k:=d[u] downto 0 do f[u,k]:=f[v,k]
     else
      begin
       for k:=d[u] downto 0 do
        begin
         tg:=oo;
         for k1:=0 to min(d[v],k) do
          if (f[u,k-k1]<>oo) and (f[v,k1]<>oo) then tg:=min(f[u,k-k1]+f[v,k1],tg);
         f[u,k]:=tg;
        end;
      end;
    end;
   j:=next[j];
  end;
 for k:=0 to d[u] do f[u,k]:=f[u,k]+abs(a[u]-k);
end;
procedure xuli;
var  i,j:longint;
begin
 for i:=1 to n do
  for j:=1 to n do f[i,j]:=oo;
 DFS(1,-1);
 DFSS(1,-1);
 res:=oo;
 for j:=0 to n do res:=min(Res,f[1,j]);
 write(REs);
end;
begin
 assign(input,'tree.inp');reseT(input);
 assign(output,'tree.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
