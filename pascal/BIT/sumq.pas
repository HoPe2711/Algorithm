var n,m:longint;
    a,t:array[0..15000] of longint;
procedure update(i,x:longint);
begin
 while i<=n do
  begin
   t[i]:=t[i]+x;
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):longint;
begin
 get:=0;
 while i<>0 do
  begin
   get:=get+t[i];
   i:=i-(i and (-i));
  end;
end;
procedure nhap;
var i,x,p,q:longint;
begin
 read(n,m);
 for i:=1 to n do
  begin
   read(a[i]);
   update(i,a[i]);
  end;
 for i:=1 to m do
  begin
   read(x);
   if x=1 then
    begin
     read(p,q);
     writeln(get(q)-get(p-1));
    end
   else
    begin
     read(p,q);
     update(p,-q);
    end;
  end;
end;
begin
 assign(input,'sumq.inp');reset(input);
 assign(output,'sumq.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
