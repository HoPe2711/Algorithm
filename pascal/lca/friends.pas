uses math;
var time,n,l:longint;
    ke,head,next,ts,tin,tout,d:array[-1000000..1000000] of longint;
    f:array[0..1000000,0..20] of longint;
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
var i,u,c:longint;
begin
 read(n);
 for i:=1 to n-1 do
  begin
   read(u,c);
   add(i,i+1,u,c);
  end;
 f[1,0]:=1;
 l:=trunc(log2(n));
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 inc(time);
 tin[u]:=time;
 for j:=1 to l do f[u,j]:=f[f[u,j-1],j-1];
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>f[u,0] then
    begin
     f[v,0]:=u;
     d[v]:=d[u]+ts[j];
     DFS(v);
    end;
   j:=next[j];
  end;
 inc(time);
 tout[u]:=time;
end;
function anc(u,v:longint):boolean;
begin
 if (tin[u]<=tin[v]) and (tout[u]>=tout[v]) then exit(true);
 exit(false);
end;
function LCA(u,v:longint):longint;
var j:longint;
begin
 if anc(u,v) then exit(u);
 if anc(v,u) then exit(v);
 for j:=l downto 0 do
  if anc(f[u,j],v)=false then u:=f[u,j];
 exit(f[u,0]);
end;
procedure inkq;
var res,i,q,kq,kq1,p,p1,a,b,t:longint;
begin
 read(q);
 DFS(1);
 for i:=1 to q do
  begin
   read(a,b,t);
   kq:=LCA(1,a);
   kq1:=LCA(a,b);
   p:=min(d[b]+t,d[1]+d[a]-2*d[kq]);
   p1:=min(d[a]+d[b]-2*d[kq1],t);
   res:=p+p1;
   writeln(res);
  end;
end;
BEGIN
  assign(input,'friends.inp');reset(input);
  assign(output,'friends.out');rewrite(output);
  nhap;
  inkq;
 close(input);close(output);
END.
