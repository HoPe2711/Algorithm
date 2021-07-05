{$H+}
uses math;
var st:String;
    n,res:longint;
    sum,a,b,pos:array[0..200000] of longint;
function find(l,r,x:longint):longint;
var mid,tmp,kq:longint;
begin
 kq:=maxlongint;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tmp:=b[mid];
   if tmp=x then
    begin
     kq:=pos[mid];
     r:=mid-1;
    end
   else if tmp<x then l:=mid+1
   else r:=mid-1;
  end;
 exit(kq);
end;
procedure swap(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid,key,key1:longint;
begin
 i:=l;
 j:=r;
 mid:=l+random(r-l+1);
 key:=b[mid];
 key1:=pos[mid];
 repeat
  while (b[i]<key) or ((b[i]=key) and (pos[i]<key1)) do inc(i);
  while (b[j]>key) or ((b[j]=key) and (pos[j]>key1)) do dec(j);
  if i<=j then
   begin
    swap(b[i],b[j]);
    swap(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i,ans,tmp:longint;
begin
 readln(n);
 readln(st);
 for i:=1 to n do
  if st[i]='1' then a[i]:=1
  else a[i]:=0;
 for i:=1 to n do sum[i]:=sum[i-1]+a[i];
 for i:=1 to n do
  begin
   b[i]:=2*sum[i-1]-i+1;
   pos[i]:=i;
  end;
 qsort(1,n);
 for i:=1 to n do
  begin
   ans:=2*sum[i]-i;
   tmp:=find(1,n,ans);
   if (tmp<>maxlongint) and (tmp<=i) then res:=max(res,i-tmp+1);
  end;
 write(res);
end;
begin
// assign(input,'b873.inp'); reset(input);
 nhap;
// close(input);
end.
