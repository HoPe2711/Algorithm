{$H+}
uses math;
const base=1735537773;
var n,k:longint;
    st:array[0..50] of string;
    pow,val,id:array[0..200000] of longint;
    hash:array[0..50,0..200001] of longint;
procedure nhap;
var i,j:longint;
begin
  readln(n,k);
  for i:=1 to n do readln(st[i]);
  pow[0]:=1;
  for i:=1 to 200000 do pow[i]:=(int64(pow[i-1])*27) mod base;
  for i:=1 to n do
   for j:=1 to length(st[i]) do hash[i,j]:=(int64(hash[i,j-1])*27+ord(st[i,j])-48 )  mod base;

end;
function gethash(x,i,j:longint):longint;
begin
 exit((hash[x,j]-int64(hash[x,i-1])*pow[j-i+1] mod base+base) mod base);
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
 mid:=val[key]; mid1:=id[key];
 repeat
  while (val[i]<mid) or ((val[i]=mid) and (id[i]<mid1)) do inc(i);
  while (val[j]>mid) or ((val[j]=mid) and (id[j]>mid1)) do dec(j);
  if i<=j then
   begin
    doicho(val[i],val[j]);
    doicho(id[i],id[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function check(x:longint):boolean;
var dem,i,j,last,kk,limit:longint;
begin
 dem:=0;
 for i:=1 to n do
  begin
   j:=1;
   while j+x-1<=length(st[i]) do
    begin
     inc(dem);
     id[dem]:=i;
     val[dem]:=gethash(i,j,j+x-1);
     inc(j);
    end;
  end;
 qsort(1,dem);
 last:=val[1];  kk:=1;       limit:=id[1];
 for i:=2 to dem do
 begin
  if val[i]<>last then
   begin
    last:=val[i];
    limit:=id[i];
    kk:=1;
   end
  else
   begin
    if id[i]<>limit then
     begin
      inc(kk);
      limit:=id[i];
     end;
   end;
  if kk=k then exit(true);
 end;
 exit(False);
end;
procedure xuli;
var l,r,mid,res:longint;
begin
 l:=1; r:=200000;  res:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 write(res);
end;
begin
 //assign(input,'vo17tv.inp');reset(input);
 //assign(output,'vo17tv.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.