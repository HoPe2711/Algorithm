uses math;
var  a:array[0..200000] of int64;
     res,res1,k:int64;
     n:longint;
procedure doicho(Var x,y:int64);
var tg:int64;
begin
 tG:=x;
 X:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint;   mid:int64;
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
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var  i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
 a[n+1]:=k;
 qsort(1,n);
 for i:=1 to n do
  begin
   if res1+a[i]<a[i+1] then
    begin
     if res1+a[i]>k then break;
     inc(res);
     res1:=res1+a[i];
    end;
  end;
 write(res,' ',res1);
end;
begin
 assign(input,'coincol.inp');reset(input);
 assign(output,'coincol.out');rewrite(output);
 nhap;
 //xuli;
 close(input); close(output);
end.