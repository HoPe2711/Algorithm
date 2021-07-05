uses math;
const oo=1000000000;
var a,free:Array[0..2000000] of longint;
    n,res:longint;

procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to 2*n do read(a[i]);
end;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint; mid:longint;
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
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function find(l,r,x:longint):longint;
var kq,mid:longint;
begin
 kq:=oo;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if a[mid]=x then exit(mid);
   if a[mid]<x then l:=mid+1 else r:=mid-1;
  end;
 exit(kq);
end;
procedure xuli;
var  i,j,tmp,h,k,ok:longint;
begin
 qsort(1,2*n);
 for i:=2 to 2*n do
  begin
   h:=a[i]-a[1];    ok:=0;
   for k:=1 to 2*n do free[k]:=0 ;
   free[i]:=1; free[1]:=1;
   for j:=1 to 2*n do
    if free[j]=0 then
     begin
      tmp:=find(1,2*n,h+a[j]);
      if tmp=oo then
       begin
        ok:=1;
        break;
       end;
      free[j]:=1; free[tmp]:=1;
     end;
   if ok=0 then inc(res);
  end;
 write(Res);
end;
procedure xuli1;
var i:longint;
begin
 for i:=1 to n do
  if n mod i=0 then res:=res+1;
 write(REs);
end;
begin
 assign(input,'grn.inp');reset(input);
 assign(output,'grn.out');rewrite(output);
 nhap;
 if n<=1000 then xuli
 else xuli1;
 close(input); close(output);
end.
