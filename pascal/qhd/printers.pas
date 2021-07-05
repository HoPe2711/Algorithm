uses math;
const oo=high(int64);
var  w,h,a,b:array[0..100001] of longint;
     f:Array[0..100001] of int64;
     n,dem,dem1:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(w[i],h[i]);
end;
procedure doicho(Var x,y:longint);
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
 key:=w[mid];
 key1:=h[mid];
 repeat
  while (w[i]<key) or ((w[i]=key) and (h[i]<key1)) do inc(i);
  while (w[j]>key) or ((w[j]=key) and (h[j]>key1)) do dec(J);
  if i<=j then
   begin
    doicho(w[i],w[j]);
    doicho(h[i],h[j]);
    inc(I); dec(j);
   end;
 until i>j;
 if i<R then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i,tmp,j,tungduong:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  if w[i]<>w[i+1] then
   begin
    inc(Dem1);
    a[dem1]:=w[i];
    b[dem1]:=h[i];
   end;
 tungduong:=b[dem1];
 dem:=1; w[dem]:=a[dem1]; h[dem]:=b[dem1];
 for i:=dem1-1 downto 1 do
 if b[i]>tungduong then
  begin
   inc(DEm);
   w[dem]:=a[i]; h[dem]:=b[i];
   tungduong:=max(tungduong,b[i]);
  end;
 qsort(1,dem);
 for i:=1 to dem do f[i]:=oo;
 for i:=1 to dem do
 begin
  tmp:=h[i];
  for j:=i-1 downto 0 do
   begin
    f[i]:=min(F[i],f[j]+int64(w[i])*tmp);
    tmp:=max(tmp,h[j]);
   end;
 end;
 write(f[dem]);
end;
begin
 assign(input,'printers.inp');reset(input);
 assign(output,'printers.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.