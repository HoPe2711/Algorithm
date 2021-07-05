uses math;
var a,pos,b,g:array[1..30000] of longint;
    n,limit,tmp,res:longint;
procedure nhap;
var i:longint;
begin
 readln(n);
 for i:=1 to n do
  begin
   read(a[i]);
   pos[i]:=i;
  end;
end;
procedure update(i,x:longint);
begin
 while i<=limit do
  begin
   g[i]:=max(g[i],x);
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):longint;
var x:longint;
begin
  x:=0;
  while i>0 do
   begin
    x:=max(x,g[i]);
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
    key:=a[l+random(r-l+1)];
    repeat
      while a[i] < key do inc(i);
      while a[j] > key do dec(j);
      if i <= j then
      Begin
        swap(a[i],a[j]);
        swap(pos[i],pos[j]);
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
 qsort(1,n);
 b[pos[1]]:=1;
 limit:=1;
 for i:=2 to n do
  begin
   if a[i]<>a[i-1] then limit:=limit+1;
   b[pos[i]]:=limit;
  end;
 for i:=1 to n do
  begin
   tmp:=get(b[i])+1;
   update(b[i],tmp) ;
   res:=max(res,tmp);
  end;
end;
BEGIN
  assign(input,'lis.inp');reset(input);
  //assign(output,'');rewrite(output);
  nhap;
  xuli;
  writeln(res);
  close(input);//close(output);
END.
