uses math;
var f,g,a,b,s:array[0..100000] of longint;
    n,t,k,t1,top,bot:longint;
procedure nhap;
var i:longint;
begin
 readln(n);
 for i:=1 to n do read(a[i]);
 fillchar(f,sizeof(f),0);
 fillchar(g,sizeof(g),0);
end;
Function Find(x:longint):longint;
Var
  l,r,mid,kq:longint;
  Begin
    kq:=top;
    l:=1;
    r:=top;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if s[mid]=x then exit(mid);
      if s[mid]>x  then
       begin
        kq:=min(kq,mid);
        r:=mid-1;
       end
      else l:=mid+1;
    End;
    exit(kq);
  End;
procedure xuli2;
var i:longint;
begin
 top:=1;
 s[1]:=a[1];
 f[1]:=1;
 for i:=2 to n do
  if a[i]>s[top] then
   begin
    inc(top);
    f[i]:=top;
    s[top]:=a[i];
   end
  else
   begin
    s[find(a[i])]:=a[i];
    f[i]:=find(a[i]);
   end;
end;
Function Find1(x:longint):longint;
Var
  l,r,mid,kq:longint;
  Begin
    kq:=bot;
    l:=1;
    r:=bot;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if s[mid]=x then exit(mid);
      if s[mid]<x  then
       begin
        kq:=min(kq,mid);
        r:=mid-1;
       end
      else l:=mid+1;
    End;
    exit(kq);
  End;
procedure xuli3;
var i:longint;
begin
 bot:=1;
 s[1]:=a[n];
 g[n]:=1;
 for i:=n-1 downto 1 do
  if a[i]<s[bot] then
   begin
    inc(bot);
    g[i]:=bot;
    s[bot]:=a[i];
   end
  else
   begin
    s[find1(a[i])]:=a[i];
    g[i]:=find1(a[i]);
   end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=b[(l+r) div 2];
    repeat
      while b[i] < key do inc(i);
      while b[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(b[i],b[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
procedure xuli;
var i,j:longint;
begin
 xuli2;
 xuli3;
 t:=0;
 for i:=1 to n do
  if f[i]+g[i]=top+1 then
   begin
    inc(t);
    b[t]:=a[i];
   end;
 qsort(1,t);
 for i:=1 to t do write(0,' ');
 writeln;
end;
BEGIN
  assign(input,'special.inp');reset(input);
  assign(output,'special.out');rewrite(output);
  readln(t1);
  for k:=1 to t1 do
   begin
    nhap;
    xuli;
   end;
  close(input);close(output);
END.
