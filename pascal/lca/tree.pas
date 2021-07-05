uses math;
var ke,next,head,ts,d,tin,tout,g,poss,pos,t,tt,a,val,res,tp,val1,id,b,c,pos1:array[-200000..200000] of longint;
    n,m,l,dem,pp,dem1:longint;
    f:array[0..100000,0..20] of longint;
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

procedure updatE(i,x:longint);
begin
 while i<=n+1 do
  begin
   g[i]:=g[i]+x;
   i:=i+i and (-i);
  end;
end;
function get(i:longint):longint;
begin
 get:=0;
 while i>0 do
  begin
   get:=get+g[i];
   i:=i-i and (-i);
  end;
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 inc(dem);   d[u]:=1;
 inc(pp); tp[u]:=pp;
 tin[u]:=dem;
 for j:=1 to l do f[u,j]:=f[f[u,j-1],j-1];
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>f[u,0] then
    begin
     f[v,0]:=u;
     t[v]:=ts[j];
     DFS(v);
     d[u]:=d[v]+d[u];
    end;
   j:=next[j];
  end;
 inC(dem);
 tout[u]:=dem;
end;
function ans(u,v:longint):boolean;
begin
 if (tin[u]<=tin[v]) and (tout[u]>=tout[v]) then exit(true);
 exit(false);
end;
function LCA(u,v:longint):longint;
var j:longint;
begin
 if ans(u,v) then exit(u);
 if ans(v,u) then exit(v);
 for j:=l downto 0 do
  if ans(f[u,j],v)=false then u:=f[u,j];
 exit(F[u,0]);
end;


procedure nhap;
var i,u,v,c:longint;
begin
 readln(n,m);
 for i:=1 to n-1 do
  begin
   readln(u,v,c);
   add(i,u,v,c);
  end;
 l:=trunc(log2(n));
 f[1,0]:=1;
 DFS(1);
end;

procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort1(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=tt[l+random(r-l+1)];
 repeat
  while tt[i]<mid do inc(i);
  while tt[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(tt[i],tt[j]);
    doicho(id[i],id[j]);
    doicho(poss[i],poss[j]);
    inc(I); dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;

procedure xuli;
var i,u,v,h:longint; x:char;
begin
 dem:=0;
 for i:=1 to m do
  begin
   read(x);
   if x='P' then
    begin
     readln(u,v,h);
     inc(Dem1);
     b[dem1]:=u;
     c[dem1]:=v;
     val1[dem1]:=h;
     pos1[dem1]:=i;
    end
   else
    begin
     readln(u,h);
     inc(dem);
     a[dem]:=u;
     val[dem]:=h;
     pos[dem]:=i;
    end;
  end;
 for i:=2 to n do
  begin
   id[tp[i]]:=i;
   tt[tp[i]]:=t[i];
   poss[tp[i]]:=tp[i];
  end;
 qsort1(2,n);
end;


procedure qsort2(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=val1[l+random(r-l+1)];
 repeat
  while val1[i]<mid do inc(i);
  while val1[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(val1[i],val1[j]);
    doicho(b[i],b[j]);
    doicho(c[i],c[j]);
    doicho(pos1[i],pos1[j]);
    inc(I); dec(j);
   end;
 until i>j;
 if i<r then qsort2(i,r);
 if l<j then qsort2(l,j);
end;
procedure truyvan1;
var i,j,tg:longint;
begin
 qsort2(1,dem1);     j:=2;
 for i:=1 to dem1 do
  begin
   while (j<=n) and (tt[j]<=val1[i]) do
    begin
     update(poss[j],1);
     update(poss[j]+d[id[j]],-1);
     inc(j);
    end;
   tg:=lca(b[i],c[i]);
   res[pos1[i]]:=get(tp[b[i]])+get(tp[c[i]])-get(tp[tg]);
  end;
end;


procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=val[l+random(r-l+1)];
 repeat
  while val[i]<mid do inc(i);
  while val[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(val[i],val[j]);
    doicho(a[i],a[j]);
    doicho(pos[i],pos[j]);
    inc(I); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;

procedure truyvan2;
var i,j:longint;
begin
 for i:=1 to n do g[i]:=0;
 qsort(1,dem);
 j:=2;
 for i:=1 to dem do
  begin
   while (j<=n) and (tt[j]<=val[i]) do
    begin
     update(poss[j],1);
     inc(j);
    end;
   res[pos[i]]:=get(tp[a[i]]+d[a[i]]-1)-get(tp[a[i]]);
  end;
end;

procedure inkq;
var i:longint;
begin
 for i:=1 to m do writeln(res[i]);
end;
begin
 assign(input,'tree.inp');reset(input);
 assign(output,'tree.out');rewrite(output);
 nhap;
 xuli;
 truyvan1;
 truyvan2;
 inkq;
 close(input); close(output);
end.