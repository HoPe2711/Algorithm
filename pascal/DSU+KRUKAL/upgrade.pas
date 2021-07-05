uses math;
const oo=maxlongint;
var ke,next,head,ts,p,p1,val,lab,tin,tout:ARRAY[-500000..500000] of longint;
    f,dmin:Array[0..200000,0..25] of longint;
    n,m,res,canh,l,dem:longint;
    kq:int64;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[i]:=c; ts[-i]:=c;
end;
procedure nhap;
var  i,u,v,c:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,c);
  // add(i,u,v,c);
   p[i]:=u; p1[i]:=v;
   val[i]:=c;
  end;
end;

procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint; mid:longint;
begin
 i:=l;
 j:=r;
 mid:=val[l+random(r-l+1)];
 repeat
  while val[i]>mid do inc(i);
  while val[j]<mid do dec(j);
  if i<=j then
   begin
    doicho(val[i],val[j]);
    doicho(p[i],p[j]);
    doicho(p1[i],p1[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function gettrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=gettrout(lab[u]);
 exit(lab[u]);
end;
procedure buildtree;
var  i,u,v:longint;
begin
 qsort(1,m);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to m do
  begin
   u:=p[i]; v:=p1[i];
   if gettrout(u)<>gettrout(v) then
    begin
     lab[lab[u]]:=lab[v];
     inc(Canh);
     add(canh,u,v,val[i]);
    end;
  end;
 l:=trunc(log2(n)); f[1,0]:=1;
end;
procedure DFS(u:longint);
var i,v,j:longint;
begin
 inc(dem);
 tin[u]:=dem;
 for i:=1 to l do
  begin
   f[u,i]:=f[f[u,i-1],i-1];
   dmin[u,i]:=min(dmin[u,i-1],dmin[f[u,i-1],i-1]);
  end;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>f[u,0] then
    begin
     f[v,0]:=u;      dmin[v,0]:=ts[j];
     dfs(v);
    end;
   j:=next[j];
  end;
 inc(dem); tout[u]:=dem;
end;
function anc(u,v:longint):boolean;
begin
 if (tin[u]<=tin[v]) and (tout[u]>=tout[v]) then exit(true);
 exit(false);
end;
function LCA(u,v:longint):longint;
var i:longint;
begin
 if anc(u,v) then
  begin
   for i:=l downto 0 do
    if anc(f[v,i],u)=false then
     begin
      res:=min(REs,dmin[v,i]);
      v:=f[v,i];
     end;
   res:=min(REs,dmin[v,0]);
   exit(u);
  end;
 if anc(v,u) then
  begin
   for i:=l downto 0 do
    if anc(f[u,i],v)=false then
     begin
      res:=min(REs,dmin[u,i]);
      u:=f[u,i];
     end;
   res:=min(REs,dmin[u,0]);
   exit(v);
  end;
 for i:=l downto 0 do
  if anc(f[u,i],v)=false then
   begin
    res:=min(REs,dmin[u,i]);
    u:=f[u,i];
   end;
 res:=min(REs,dmin[u,0]);
 exit(f[u,0]);
end;

procedure xuli;
var i,tmp,j:longint;
begin
 for i:=1 to n do
  for j:=0 to l do dmin[i,j]:=oo;
 DFS(1);
 for i:=1 to m do
  begin
   res:=oo;
   tmp:=LCA(p[i],p1[i]);
   tmp:=LCA(p1[i],p[i]);
   if val[i]<res then kq:=kq+res-val[i];
  end;
 write(kq);
end;
begin
 assign(input,'upgrade.inp');reset(input);
 assign(output,'upgrade.out');rewrite(output);
 nhap;
 buildtree;
 xuli;
 close(input); close(output);
end.
