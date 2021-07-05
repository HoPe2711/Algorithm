var n,k,limit:longint;
    res:int64;
    s,t,b,a,pos,g:array[0..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do
  begin
   read(a[i]);
   if a[i]<k then g[i]:=-1
   else g[i]:=1;
   pos[i]:=i;
  end;
 for i:=1 to n do s[i]:=s[i-1]+g[i];
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
Procedure Qsort(l,r:longint);
Var
  i,j:longint;
  key:longint;
  Begin
    i:=l;
    j:=r;
    key:=s[l+random(r-l+1)];
    repeat
      while s[i] < key do inc(i);
      while s[j] > key do dec(j);
      if i <= j then
      Begin
        swap(s[i],s[j]);
        swap(pos[i],pos[j]);
        inc(i);
        dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
procedure xuli;
var i:longint;
begin
 qsort(0,n);
 b[pos[0]]:=1;
 limit:=1;
 for i:=1 to n do
  begin
   if s[i]<>s[i-1] then limit:=limit+1;
   b[pos[i]]:=limit;
  end;
 update(b[0],1);
 for i:=1 to n do
  begin
   res:=get(b[i])+res;
   update(b[i],1);
  end;
end;
begin
  {assign(input,'KMEDIAN.inp');reset(input);
  assign(output,'KMEDIAN.out');rewrite(output);   }
  nhap;
  xuli;
  write(res);
 { close(input);close(output); }
end.
