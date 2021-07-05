uses math;
type arr=array[0..200] of longint;
var a,b,c,o,pos:Arr;
    n,k,dem:longint;
    free:Array[0..200,0..200,0..200] of longint;
    val:array[0..200,0..3] of longint;
    res:int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do
  begin
   read(a[i],b[i],c[i]);
   pos[i]:=i;
   read(a[i+n],b[i+n],c[i+n]);
   pos[i+n]:=i+n;
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
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=o[l+random(r-l+1)];
 repeat
  while o[i]<mid do inc(i);
  while o[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(o[i],o[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure build(var x:arr);
var i,limit:longint;
begin
 o:=x;
 inc(dem);
 for i:=1 to 2*n do pos[i]:=i;
 qsort(1,2*n);
 limit:=1;
 x[pos[1]]:=limit;
 for i:=2 to 2*n do
  begin
   if o[i]<>o[i-1] then
    begin
     inc(limit);
     val[limit,dem]:=o[i]-o[i-1];
    end;
   x[pos[i]]:=limit;
  end;
end;
procedure xuli;
var x,y,z,i:longint;
begin
 for i:=1 to n do
  for x:=a[i] to a[i+n]-1 do
   for y:=b[i] to b[i+n]-1 do
    for z:=c[i] to c[i+n]-1 do inc(free[x+1,y+1,z+1]);
 for x:=1 to 100 do
  for y:=1 to 100 do
   for z:=1 to 100 do
    if free[x,y,z]>=k then res:=res+int64(val[x,1])*val[y,2]*val[z,3];
 write(res);
end;
begin
 assign(input,'cube.inp');reset(input);
 assign(output,'cube.out');rewrite(output);
 nhap;
 build(a);
 build(b);
 build(c);
 xuli;
 close(inpuT); close(output);
end.