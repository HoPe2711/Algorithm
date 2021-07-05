uses math;
var  a,b,c,res:longint;
procedure nhap;
var  i:longint;
begin
 read(a,b,c);   res:=-1;
 for i:=1 to a do
 if (2*i<=b) and (4*i<=c) then res:=max(res,7*i);
 if res=-1 then res:=0;
 write(res);
end;
begin
 nhap;
end.