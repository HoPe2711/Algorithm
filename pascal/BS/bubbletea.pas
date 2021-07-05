uses math;
var n,k:longint;
    kq,mid:int64;
    ke,next,head,ts,vt,free,d,tt,f:array[-100000..100000] of longint;
    dis,p:array[0..100000] of int64;
    ok:boolean;
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
 read(n,k);
 for i:=1 to k do
  begin
   read(u);
   free[u]:=1;
  end;
 for i:=1 to n-1 do
  begin
   reaD(u,v,c);
   add(i,u,v,c);
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
var i,j:longint;  mid,tg:int64;
begin
 i:=l;
 j:=r;
 mid:=p[random(r-l+1)+l];
 repeat
  while p[i]<mid do inc(i);
  while p[j]>mid do dec(J);
  if i<=j then
   begin
    tg:=p[i];
    p[i]:=p[j];
    p[j]:=tg;
    doicho(tt[i],tt[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;

procedure DFS(u,o:longint);
var j,v,i,res,l,r,mid1:longint; res1,tmp:int64;
begin
 if ok=false then exit;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>o then
    begin
     dis[v]:=dis[u]+ts[j];
     DFS(v,u);
    end;
   j:=next[j];
  end;
 if free[u]=1 then
  begin
   d[u]:=1;
   tt[1]:=u;
  end
 else d[u]:=0;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>o then
    if d[v] mod 2 =1 then
     begin
      inc(d[u]);
      tt[d[u]]:=f[v];
     end;
   j:=next[j];
  end;

 if d[u] mod 2 =0 then
  begin
   for i:=1 to d[u] do p[i]:=dis[tt[i]];
   qsort(1,d[u]);
   for i:=1 to d[u] div 2 do kq:=max(kq,p[i]+p[d[u]-i+1]-dis[u]*2);
   if kq>mid then ok:=false;
  end
 else
  begin
   for i:=1 to d[u] do p[i]:=dis[tt[i]]-dis[u];
   qsort(1,d[u]);
   l:=1;
   r:=d[u];  res:=0; res1:=0;
   while l<=r do
    begin
     mid1:=(l+r) div 2;
     i:=1; j:=d[u];
     tmp:=0;
     while i<j do
      begin
       if (i=mid1) then
        begin
         inc(i); continue;
        end;
       if j=mid1 then
        begin
         dec(j); continue;
        end;
       tmp:=max(tmp,p[i]+p[j]);
       inc(I); dec(j);
      end;
     if tmp<=mid then
      begin
       res:=mid1;
       res1:=tmp;
       r:=mid1-1;
      end
     else l:=mid1+1;
    end;
   f[u]:=tt[res]; kq:=max(kq,res1);
   if f[u]=0 then ok:=false;
  end;
end;

function check:boolean;
var i:longint;
begin
 for i:=1 to n do
  begin
   d[i]:=0;
   tt[i]:=0;
   p[i]:=0;
   vt[i]:=0;
   f[i]:=0;
  end;
 ok:=true;
 kq:=0;
 DFS(1,-1);
 if kq>mid then ok:=false;
 exit(ok);
end;
procedure xuli;
var l,r,res:int64;
begin
 l:=1;
 r:=10**15;
 res:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check then
    begin
     res:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 write(Res);
end;
begin
 assign(input,'bubbletea.inp');reseT(input);
 assign(output,'bubbletea.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
