uses math;
const oo=maxlongint;
var ke,next,head,ts,tin,tout:Array[-100000..100000] of longint;
    n,l,dem,res,res1:longint;
    f,dmax,dmin:array[0..100000,0..20] of longint;
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
var i,u,v,c:longint;
begin
 read(n);
 for i:=1 to n-1 do
  begin
   read(u,v,c);
   add(i,u,v,c);
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
   dmax[u,i]:=max(dmax[u,i-1],dmax[f[u,i-1],i-1]);
   dmin[u,i]:=min(dmin[u,i-1],dmin[f[u,i-1],i-1]);
  end;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>f[u,0] then
    begin
     f[v,0]:=u;  dmax[v,0]:=ts[j];    dmin[v,0]:=ts[j];
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
      res1:=max(REs1,dmax[v,i]);
      v:=f[v,i];
     end;
   res:=min(REs,dmin[v,0]);
   res1:=max(REs1,dmax[v,0]);
   exit(u);
  end;
 if anc(v,u) then
  begin
   for i:=l downto 0 do
    if anc(f[u,i],v)=false then
     begin
      res:=min(REs,dmin[u,i]);
      res1:=max(REs1,dmax[u,i]);
      u:=f[u,i];
     end;
   res:=min(REs,dmin[u,0]);
   res1:=max(REs1,dmax[u,0]);
   exit(v);
  end;
 for i:=l downto 0 do
  if anc(f[u,i],v)=false then
   begin
    res:=min(REs,dmin[u,i]);
    res1:=max(REs1,dmax[u,i]);
    u:=f[u,i];
   end;
 res:=min(REs,dmin[u,0]);
 res1:=max(REs1,dmax[u,0]);
 exit(f[u,0]);
end;
procedure xuli;
var i,j,k,p,q,trans:longint;
begin
 for i:=1 to n do
  for j:=0 to l do
   begin
    dmax[i,j]:=0;
    dmin[i,j]:=oo;
   end;
 DFS(1);
 read(k);
 for i:=1 to k do
  begin
   read(p,q);
   res:=oo; res1:=0;
   trans:=LCA(p,q);
   trans:=LCA(q,p);
   writeln(res,' ',res1);
  end;
end;
begin
// assign(input,'lubenica.inp');reset(input);
// assign(output,'lubenica.out');rewrite(output);
 nhap;
 xuli;
// close(input);
// close(output);
end.
