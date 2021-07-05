uses math;
var ke,next,head,free,a,d,tt,dd,cha,b,pos:array[-200000..200000] of longint;
    n,pp,limit:longint;
    res:int64;
    ts:Array[0..200000] of int64;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tG:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   if free[a[i]]=0 then
    begin
     free[a[i]]:=1;
     inc(pp);
    end;
   pos[i]:=i;
  end;
 qsort(1,n);
 limit:=1;
 b[pos[1]]:=limit;
 for i:=2 to n do
 begin
  if a[i]<>A[i-1] then inc(limit);
  b[pos[i]]:=limit;
 end;
 a:=b;
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
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     if tt[a[v]]=0 then
      begin
       tt[a[v]]:=1;
       d[v]:=d[u]+1;
       res:=res+d[v];
      end
     else
      begin
       d[v]:=d[u];
       res:=res+d[v];
      end;
     DFS(v,u);
     if d[v]=d[u]+1 then tt[a[v]]:=0;
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to n do
  begin
   for j:=1 to n do
    begin
     d[j]:=0; tt[j]:=0;
    end;
   res:=1;
   d[i]:=1; tt[a[i]]:=1;
   DFS(i,-1);
   writeln(reS);
  end;
end;

procedure xuli1;
var  i:longint;
begin
 for i:=1 to n do writeln(n);
end;

procedure DFSs(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
 dd[u]:=1;
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     cha[v]:=u;
     if tt[a[v]]=0 then
      begin
       tt[a[v]]:=1;
       d[v]:=d[u]+1;
       res:=res+d[v];
      end
     else
      begin
       d[v]:=d[u];
       res:=res+d[v];
      end;
     DFSs(v,u);
     dd[u]:=dd[u]+dd[v];
     if d[v]=d[u]+1 then tt[a[v]]:=0;
    end;
   j:=next[j];
  end;
end;
procedure DFS1(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     ts[v]:=int64((dd[u]-dd[v]))*d[u]+ts[u];
     DFS1(v,u);
    end;
   j:=next[j];
  end;
end;
procedure xuli2;
var  i,j:longint; tmp,kq:int64;
begin
 d[1]:=1; tt[a[1]]:=1;    res:=1;
 DFSS(1,-1);
 DFS1(1,-1);
 for i:=1 to n do
  if i=1 then writeln(Res)
  else
   begin
    kq:=res+int64(d[i])*n;
    tmp:=int64(d[i])*dd[i]+ts[i];
    writeln(kq-2*tmp+n);
   end;
end;
begin
 assign(input,'colorgraph.inp');reset(input);
 assign(output,'colorgraph.out');rewrite(output);
 nhap;
 if pp=1 then xuli1
 else
 if  n<=5000 then xuli
 else xuli2;
 close(input); close(output);
end.
