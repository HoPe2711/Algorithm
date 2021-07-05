uses math;
var ke,next,head,ts,b,t,tt,pos:Array[-200000..200000] of longint;
    x,y,k,q,n,m,limit,maxx:longint;
    free:Array[0..200000] of boolean;
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
 read(n,m,q);
 for i:=1 to n do
  begin
   read(t[i]);
   pos[i]:=i;
  end;
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
   maxx:=max(maxx,c);
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
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=t[l+random(r-l+1)];
 repeat
  while t[i]<mid do inc(i);
  while t[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(t[i],t[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(J);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure build;
var i:longint;
begin
 qsort(1,n);
 limit:=1; b[pos[1]]:=limit;
 for i:=2 to n do
  begin
   if t[i]<>t[i-1] then inc(limit);
   b[pos[i]]:=limit;
  end;
 t:=b;
end;

procedure DFS(u,val:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if ts[j]<=val then
    if free[v]=false then
     begin
      free[v]:=true;
      tt[t[v]]:=1;
      dfs(V,val);
     end;
   j:=next[j];
  end;
end;
function check(mid:longint):boolean;
var i,latdot:longint;
begin
 for i:=1 to n do
  begin
   free[i]:=false;
   tt[i]:=0;
  end;
 free[x]:=true;
 tt[t[x]]:=1;
 DFS(x,mid);
 if free[y]=false then exit(false);
 latdot:=0;
 for i:=1 to limit do
  if tt[i]=1 then inc(latdot);
 if latdot<k then exit(false);
 exit(true);
end;


procedure xuli;
var l,r,mid,res,i:longint;
begin
 for i:=1 to q do
  begin
   read(x,y,k);
   res:=-1;
   l:=1;
   r:=maxx;
   while l<=r do
    begin
     mid:=(l+r) div 2;
     if check(mid) then
      begin
       res:=mid;
       r:=mid-1;
      end
     else l:=mid+1;
    end;
   writeln(Res);
  end;
end;
begin
 assign(input,'travel.inp');resET(input);
 assign(output,'travel.out');rewrite(output);
 nhap;
 build;
 xuli;
 close(input); close(output);
end.