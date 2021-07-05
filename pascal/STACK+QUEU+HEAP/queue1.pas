uses math;
var n,k:longint;
    l,r:array[0..1000000] of longint;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   l[i]:=i-1;
   if i<>n then r[i]:=i+1 else r[i]:=0;
  end;
 read(k);
 for i:=1 to k do
  begin
   read(u,v);
   if l[v]=u then continue;
   if l[u]=v then
    begin
     r[l[v]]:=u;
     l[r[u]]:=v;
     l[u]:=l[v];
     l[v]:=u;
     r[v]:=r[u];
     r[u]:=v;
     continue;
    end;
   r[l[u]]:=r[u];
   l[r[u]]:=l[u];
   r[l[v]]:=u;
   l[u]:=l[v];
   r[u]:=v;
   l[v]:=u;
  end;
 for i:=1 to n do writeln(l[i],' ',r[i]);
end;
begin
 assign(input,'queue.inp');reset(input);
 assign(output,'queue.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
