var n,m:longint;
    res:int64;
    first,last,a,b:array[0..100001] of longint;
procedure nhap;
var  i:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(a[i],b[i]);
   first[i]:=b[i];
   last[i]:=b[i]+n-a[i];
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid,mid1,key:longint;
begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 mid1:=last[key]; mid:=first[key];
 repeat
  while (first[i]<mid) or ((first[i]=mid) and (last[i]>mid1)) do inc(i);
  while (first[j]>mid) or ((first[j]=mid) and (last[j]<mid1)) do dec(j);
  if i<=j then
   begin
    doicho(last[i],last[j]);
    doicho(first[i],first[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i,l,tt:longint;
begin
 qsort(1,m);
 l:=last[1];  res:=int64((l-first[1]+1))*(l-first[1]+2) div 2;
 for i:=2 to m do
  if first[i]>l then
   begin
    res:=int64((last[i]-first[i]+1))*(last[i]-first[i]+2) div 2+res;
    l:=last[i];
   end
  else if (first[i]<=l) and (last[i]>l) then
   begin
    tt:=l-first[i]+1;
    res:=int64((last[i]-first[i]+1))*(last[i]-first[i]+2) div 2-int64(tt)*(tt+1) div 2+res;
    l:=last[i];
   end;
 write(Res);
end;
begin
 assign(input,'pyramid.inp');reset(input);
 assign(output,'pyramid.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.