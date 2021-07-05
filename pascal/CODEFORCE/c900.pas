uses math;
var n,res,kq,maxx:longint;
    g,a,free,dd:array[0..200000] of longint;
procedure update(i,x:longint);
begin
 while i>0 do
  begin
   g[i]:=g[i]+x;
   i:=i-i and (-i);
  end;
end;
function get(i:longint):longint;
var t:longint;
begin
 t:=0;
 while i<=n+1 do
  begin
   t:=t+g[i];
   i:=i+i and (-i);
  end;
 exit(t);
end;
procedure nhap;
var i,tt:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   tt:=get(a[i]+1);
   if tt=1 then inc(free[maxx])
   else if tt=0 then dec(free[a[i]]);
   update(a[i],1);
   maxx:=max(maxx,a[i]);
  end;
 //dec(free[a[1]]);
 kq:=-2;
 for i:=1 to n do
  if kq<free[i] then
   begin
    kq:=free[i];
    res:=i;
   end;
 write(REs);
end;
begin
 //assign(input,'c900.inp');reset(input);
 nhap;
 //close(input);
end.
