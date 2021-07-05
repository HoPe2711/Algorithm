var n,t,h,res:longint;
    a:array[0..800] of longint;
    pos:array[0..60000] of longint;
procedure nhap;
var i:longint;
begin
 fillchar(pos,sizeof(pos),0);
 read(n);
 for i:=1 to n do read(a[i]);
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
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i,j,k:longint;
begin
 qsort(1,n);
 res:=0;
 for i:=1 to n-2 do
  for j:=i+1 to n-1 do
   for k:=j+1 to n do
    if a[i]+a[j]>=a[k] then inc(res);
  writeln(res);
end;
procedure xuli1;
var  i,last,j:longint;
begin
 qsort(1,n);   res:=0;
 for i:=2 to n+1 do
  if a[i]<>a[i-1] then pos[a[i-1]]:=i-1;
 last:=0;
 for i:=1 to a[n]+a[n-1] do
  if pos[i]=0 then pos[i]:=last
  else last:=pos[i];
 for i:=1 to n-2 do
  for j:=i+1 to n-1 do res:=res+pos[a[i]+a[j]]-j;
 writeln(Res);
end;
begin
 assign(input,'tamgiac.inp'); reset(input);
 assign(output,'tamgiac.out'); rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   if n<100 then xuli
   else xuli1;
  end;
 close(input); close(output);
end.