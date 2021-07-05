uses math;
var  a,b,pos,tt,free:array[0..6000] of longint;
     f,trace,trace1:array[0..6000,0..3000] of longint;
     n,dem:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do read(b[i]);
 for i:=1 to n do pos[i]:=i;
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
  while a[i]>mid do inc(i);
  while a[j]<mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    doicho(pos[i],pos[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure truyvet(i,j:longint);
begin
 if (i=1) or (j=0) then exit;
 if trace1[i,j]+1=j then
  begin
   inc(dem);
   tt[dem]:=pos[i];
   free[i]:=1;
   truyvet(trace[i,j], trace1[i,j]);
  end
 else truyvet(i-1,j);
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=1 to i div 2 do trace1[i,j]:=-2;
 qsort(1,n);
 for i:=2 to n do
  for j:=1 to i div 2 do
    if f[i-1,j]<f[i-1,j-1]+b[i] then
     begin
      f[i,j]:=f[i-1,j-1]+b[i];
      trace[i,j]:=i-1;
      trace1[i,j]:=j-1;
     end
    else f[i,j]:=f[i-1,j];
 writeln(f[n,n div 2]);
 truyvet(n,n div 2);
// for i:=1 to dem do write(tt[i],' ');
 j:=1;
 for i:=dem downto 1 do
  begin
   writeln(pos[j],' ',tt[i]);
   inc(j);
   while free[j]=1 do inc(j);
  end;
end;
begin
 //assign(input,'vodivide.inp'); reset(input);
 nhap;
 xuli;
// close(input);
end.