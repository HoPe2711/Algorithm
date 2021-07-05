var res,n:longint;
    a,b,colour:array[0..300000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do
  begin
    read(b[i]);
    a[i+n]:=b[i];
    colour[i]:=1;
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
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(colour[i],colour[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var  i,j:longint;
begin
 qsort(1,2*n);
 i:=1;  j:=1;
// for i:=1 to 2*n do write(a[i],' ');
{ while i<=(2*n-1) do
  begin
    if colour[i]<>colour[i+1] then
     begin
      inc(res);
      i:=i+2;
     end
    else inc(i);
  end;       }
  while i<=2*n-1 do
   begin
    if j>2*n then break;
    while j<=2*n do
     if colour[i]<>colour[j] then
      begin
       inc(res);
       i:=j+1;
       j:=j+2;
       break;
      end
     else inc(j);
   end;
 write(res);
end;
begin
 nhap;
 xuli;
end.
