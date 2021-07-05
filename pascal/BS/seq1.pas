uses math;
const oo=200001;
var n,k:longint;
    pos:Array[0..200000] of longint;
    a:array[0..200000] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do
  begin
   read(a[i]);
   pos[i]:=i;
  end;
end;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tG:=x;
 X:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;    tg:int64;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    //doicho(a[i],a[j]);
    tg:=a[i];
    a[i]:=a[j];
    a[j]:=tg;
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function find(l,r:longint;x:int64):longint;
var mid:longint;
begin
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if a[mid]=x then exit(mid);
   if a[mid]<x then l:=mid+1
   else r:=mid-1;
  end;
 exit(oo);
end;
procedure xuli;
var i,tt:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  begin
   tt:=find(1,n,k+a[i]);
   if (tt<>oo) and (pos[tt]<>pos[i]) then
    begin
     writeln(pos[tt],' ',pos[i]);
     exit;
    end;
  end;
 write(0,' ',0);
end;
begin
 //assign(input,'seq.inp');reset(input);
 //assign(output,'seq.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.
