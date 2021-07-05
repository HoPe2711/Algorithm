uses math;
var n,res,k:longint;
    s,s1,a,pos:array[0..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do
  begin
   read(a[i]);
   s[i]:=s[i-1] xor a[i];
   s1[i]:=s[i];
   pos[i]:=i;
  end;
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=s1[(l+r) div 2];
    repeat
      while s1[i] < key do inc(i);
      while s1[j] > key do dec(j);
      if i <= j then
      Begin
      doicho(s1[i],s1[j]);
      doicho(pos[i],pos[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
function find(l,r,x:longint):longint;
var mid,kq:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if s1[mid]>=x then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
procedure xuli;
var l,x,y:longint;
begin
 qsort(1,n);
 for l:=1 to n do
  begin
   x:=find(1,n,0 xor s[l-1]);
   y:=find(1,n,int64(2)**k xor s[l-1]);
   if x<>0 then
   if pos[x]>=l then res:=max(res,pos[x]-l);
  end;
 write(res);
end;
begin
 assign(input,'funbit.inp');reset(input);
 assign(output,'funbit.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
