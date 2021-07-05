uses math;
var limit,n,m,s,dem,res:longint;
    ke,next,head:array[-100000..100000] of longint;
    a,pos,pos1,pos2,tp,kq,colour,child,cha,c,d,rush,t,next1:array[0..200000] of longint;
procedure doicho(var x,y:longint);
var
 tg:longint;
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
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
     doicho(pos[i],pos[j]);
     doicho(a[i],a[j]);
     inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
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
 read(n,m,s);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
 for i:=1 to n do
  begin
   read(a[i]);
   pos[i]:=i;
  end;
 qsort(1,n);
 limit:=1;
 colour[pos[1]]:=limit;
 for i:=2 to n do
  begin
   if a[i]<>a[i-1] then inc(limit);
   colour[pos[i]]:=limit;
  end;
end;
procedure DFS1(u:longint);
var j,v:longint;
begin
 inc(Dem);
 tp[dem]:=u;
 child[u]:=1;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>cha[u] then
    begin
     cha[v]:=u;
     dfs1(v);
     child[u]:=child[u]+child[v];
    end;
   j:=next[j];
  end;
end;


procedure xuli1;
var i,t1:longint;
begin
 DFS1(s);
 fillchar(pos,sizeof(pos),0);
 for i:=1 to n do rush[tp[i]]:=i;
 for i:=1 to m do
  begin
   read(t1);
   c[i]:=rush[t1];
   d[i]:=c[i]+child[t1]-1;
   pos2[i]:=i;
  end;
 for i:=1 to n do
  begin
   next1[i]:=pos[colour[tp[i]]];
   pos1[i]:=i;
   pos[colour[tp[i]]]:=i;
  end;
end;


procedure update(i,x:longint);
begin
 while i<=n do
  begin
   t[i]:=t[i]+x;
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):longint;
var x:longint;
begin
  x:=0;
  while i>0 do
   begin
    x:=x+t[i];
    i:=i-(i and (-i));
   end;
  exit(x);
end;


Procedure swap(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort2(l,r:longint);
Var
  i,j:longint;
  key:longint;
Begin
    i:=l;
    j:=r;
    key:=next1[l+random(r-l+1)];
    repeat
      while next1[i] < key do inc(i);
      while next1[j] > key do dec(j);
      if i <= j then
      Begin
        swap(next1[i],next1[j]);
        swap(pos1[i],pos1[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort2(l,j);
    if i < r then Qsort2(i,r);
End;
Procedure Qsort1(l,r:longint);
Var
  i,j:longint;
  key:longint;
Begin
    i:=l;
    j:=r;
    key:=c[l+random(r-l+1)];
    repeat
      while c[i] < key do inc(i);
      while c[j] > key do dec(j);
      if i <= j then
      Begin
        swap(c[i],c[j]);
        swap(d[i],d[j]);
        swap(pos2[i],pos2[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort1(l,j);
    if i < r then Qsort1(i,r);
End;


procedure print;
var i,j:longint;
begin
 qsort2(1,n);
 qsort1(1,m);
 j:=1;
 for i:=1 to m do
  begin
   while (next1[j]<=c[i]-1) and (j<=n) do
    begin
     update(pos1[j],1);
     inc(j);
    end;
   res:=get(d[i])-get(c[i]-1);
   kq[pos2[i]]:=res;
  end;
 for i:=1 to m do writeln(kq[i]);
end;
begin
 assign(input,'coltree.inp');reset(input);
 assign(output,'coltree.out');rewrite(output);
 nhap;
 xuli1;
 print;
 close(input); close(output);
end.
