var t:array[0..2000,0..2000] of longint;
    n:longint;
procedure update(i,k,x:longint);
var j:longint;
begin
 while (i<=n) do
  begin
   j:=k;
   while (j<=n) do
    begin
     t[i,j]:=t[i,j]+x;
     j:=j+(j and (-j));
    end;
   i:=i+(i and (-i));
  end;
end;
function get(i,k:longint):longint;
var x,j:longint;
begin
 x:=0;
 while i>0 do
  begin
   j:=k;
   while j>0 do
    begin
     x:=x+t[i,j];
     j:=j-(j and (-j));
    end;
   i:=i-(i and (-i));
  end;
 exit(x);
end;
procedure nhap;
var x,k,y,a,l,b,r,t1:longint;
begin
 read(x,n);
 while not seekeof do
  begin
   read(x);
   if x=3 then break;
   if x=1 then
    begin
     read(k,y,a);
     update(k+1,y+1,a);
    end;
   if x=2 then
    begin
     read(l,b,r,t1);
     writeln(get(r+1,t1+1)-get(r+1,b)-get(l,t1+1)+get(l,b));
    end;
  end;
end;
begin
 nhap;
end.
