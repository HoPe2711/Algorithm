uses math;
const oo=high(int64) div 2;
var n,q,dem,canh,val:longint;
    res:int64;
    ke,next,head,ts,ke1,next1,head1,tin,tout,stack,fa,fb,nail,l:array[-500000..500000] of longint;
    ff,free:array[0..500000,0..20] of longint;
    d:array[0..500000] of int64;
    tt,empty:Array[0..500000] of boolean;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[i]:=c;
 ts[-i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,q);
 for i:=1 to n-1 do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
 ff[1,0]:=1;
 val:=trunc(log2(n));
end;

procedure DFS(u:longint);
var j,v:longint;
begin
 inc(dem);
 tin[u]:=dem;
 for j:=1 to val do ff[u,j]:=ff[ff[u,j-1],j-1];
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>ff[u,0] then
    begin
      ff[v,0]:=u;
      d[v]:=d[u]+ts[j];
      DFS(v);
    end;
   j:=next[j];
  end;
 inc(dem);
 tout[u]:=dem;
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
 for j:=val downto 0 do
  if anc(ff[u,j],v)=false then u:=ff[u,j];
 exit(ff[u,0]);
end;

procedure histogram;
var i,top:longint;
begin
 stack[0]:=0;
 top:=0;
 for i:=1 to dem do
  begin
   while (top>0) and (tout[nail[i]]>=tout[nail[stack[top]]]) do dec(top);
   l[i]:=stack[top];
   inc(top);
   stack[top]:=i;
  end;
end;

procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=nail[l+random(r-l+1)];
 repeat
  while tin[nail[i]]<tin[mid] do inc(i);
  while tin[nail[j]]>tin[mid] do dec(j);
  if i<=j then
   begin
    doicho(nail[i],nail[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;


procedure add1(i,u,v:longint);
begin
 ke1[i]:=v;
 next1[i]:=head1[u];
 head1[u]:=i;
 ke1[-i]:=u;
 next1[-i]:=head1[v];
 head1[v]:=-i;
end;
procedure buildtree;
var j,kk,hh,i:longint;
begin
 qsort(1,dem);  hh:=dem;
 for j:=2 to hh do
  begin
   kk:=lca(nail[j],nail[j-1]);
   if tt[kk]=false then
    begin
     inc(dem);
     nail[dem]:=kk;
    end;
   tt[kk]:=true;
  end;
 qsort(1,dem);
 histogram;
 for i:=1 to dem do
 if (nail[i]<>nail[l[i]]) and (l[i]<>0) then
  begin
   inc(canh);
   add1(canh,nail[i],nail[l[i]]);
  end;
end;

procedure DFSS(u:longint);
var  j,v:longint;
begin
 j:=head1[u];
 empty[u]:=false;
 if free[u,1]<>0 then fa[u]:=u;
 if free[u,2]<>0 then fb[u]:=u;
 while j<>0 do
  begin
   v:=ke1[j];
   if empty[v] then
    begin
     DFSS(v);
     if (fa[v]<>-1) and ((fa[u]=-1) or (d[fa[u]]>d[fa[v]])) then fa[u]:=fa[v];
     if (fb[v]<>-1) and ((fb[u]=-1) or (d[fb[u]]>d[fb[v]])) then fb[u]:=fb[v];
    end;
   j:=next1[j];
  end;
end;
procedure dptree;
var i,u,j:longint;
begin
 DFSS(nail[1]);
 res:=oo;
 for i:=1 to dem do
  begin
   u:=nail[i];
   if (fa[u]<>-1) and (fb[u]<>-1) then res:=min(Res,d[fa[u]]+d[fb[u]]-2*d[u]);
  end;
 writeln(res);
 for j:=1 to dem do
  begin
   u:=nail[j];
   free[u,1]:=0; free[u,2]:=0;
   tt[u]:=false;
   fa[u]:=-1; fb[u]:=-1; empty[u]:=true;
   head1[u]:=0;
   l[u]:=0;
   next1[j]:=0; ke1[j]:=0;
  end;
end;


procedure xuli;
var i,j,s,t,a,b:longint;
begin
 for i:=0 to n do
  begin
   fa[i]:=-1; fb[i]:=-1;  empty[i]:=true;
  end;
 DFS(0);
 for i:=1 to q do
  begin
   read(s,t);
   dem:=0;  canh:=0;
   for j:=1 to s do
    begin
     read(a);
     inc(dem);           tt[a]:=true;
     nail[dem]:=a;   free[a,1]:=1;
    end;
   for j:=1 to t do
    begin
     read(b);
     if tt[b]=false then
      begin
       inc(dem);
       nail[dem]:=b;
      end;
     free[b,2]:=1;
     tt[b]:=true;
    end;
   buildtree;
   dptree;
  end;
end;
begin
 assign(input,'factories.inp');reset(input);
 assign(output,'factories.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
