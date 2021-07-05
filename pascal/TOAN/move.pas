{$H+}
uses math;
const oo=1000000007;
var  n,m:longint;
     l1,r1,l2,r2:array[0..100,0..10000] of longint;
     st:array[0..100] of string;
procedure nhap;
var  i,j,c:longint;
begin
 readln(n,m);
 for i:=1 to n do
  begin
   readln(st[i]);      c:=0;
   for j:=1 to m do
    if st[i][j]='1' then inc(c);
   if  c=0 then
    begin
     write(-1);
     halt;
    end;
  end;
end;
procedure khoitao;
var i,j,kq,last:longint;
begin
 for i:=1 to n do
  for j:=1 to m do
   begin
    l1[i,j]:=oo; l2[i,j]:=oo;
    r1[i,j]:=oo; r2[i,j]:=oo;
   end;
 for i:=1 to n do
  begin
   for j:=1 to m do
    if st[i][j]='1' then
     begin
      kq:=j;
      last:=j;
      break;
     end;
   for j:=kq to m do
    if st[i][j]='1' then
     begin
      last:=j;
      l1[i,j]:=last;
     end
    else l1[i,j]:=last;
   for j:=kq to m do l2[i,j]:=kq;
   for j:=m downto 1 do
    if st[i][j]='1' then
     begin
      kq:=j;
      last:=j;
      break;
     end;
   for j:=kq downto 1 do
   if st[i][j]='1' then
    begin
     last:=j;
     r1[i,j]:=last;
    end
   else r1[i,j]:=last;
   for j:=kq downto 1 do r2[i,j]:=kq;
  end;
end;
procedure xuli;
var i,j,d,d1,res,res1:longint;
begin
 res1:=oo;
 for j:=1 to m do
  begin
   res:=0;
    for i:=1 to n do
    if st[i][j]='0' then
     begin
       if l1[i,j]<>oo then d:=j-l1[i,j] else d:=oo;
       if l2[i,j]<>oo then d:=min(d,l2[i,j]+m-j) else d:=oo;
       if r1[i,j]<>oo then d1:=r1[i,j]-j else d1:=oo;
       if r2[i,j]<>oo then d1:=min(d1,m-r2[i,j]+j) else d1:=oo;
       if (d=oo) and (d1=oo) then continue;
       res:=res+min(d,d1);
     end;
    res1:=min(res,res1);
  end;
 write(res1);
end;
begin
 assign(input,'move.inp');reset(input);
 assign(output,'move.out');rewrite(output);
 nhap;
 khoitao;
 xuli;
 close(input); close(output);
end.
