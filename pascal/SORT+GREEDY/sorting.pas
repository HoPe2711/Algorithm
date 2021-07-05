uses math;
var  a,pos:array[1..10000] of longint;
     dd:array[1..10000] of boolean;
     n,res:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   readln(a[i]);
   pos[i]:=i;
  end;
end;
procedure doicho(var x,y:longint);
var  tg:longint;
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
    key:=a[(l+r) div 2];
    repeat
      while a[i] < key do inc(i);
      while a[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(a[i],a[j]);
      doicho(pos[i],pos[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
procedure xuli;
var q,n1,sum,q1,i,j:longint;
begin
 qsort(1,n);
 fillchar(dd,sizeof(dd),true);
 q:=a[1];
 for i:=1 to n do
  if dd[i] then
   begin
    n1:=1;
    sum:=a[i];
    q1:=a[i];
    dd[i]:=false;
    j:=pos[i];
    while dd[j] do
     begin
      inc(n1);
      inc(sum,a[j]);
      dd[j]:=false;
      j:=pos[j];
     end;
    res:=res+min(sum+(n1-2)*q1,sum+(n1+1)*q+q1);
   end;
 write(res);
end;
BEGIN
  assign(input,'sorting.inp');reset(input);
  assign(output,'sorting.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
