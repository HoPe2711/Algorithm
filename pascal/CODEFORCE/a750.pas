var   n,k,tt,kq,res:longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 tt:=240-k;  res:=n+1;
 for i:=1 to n do
 begin
  kq:=kq+i*5;
  if kq>tt then
   begin
    res:=i; break;
   end;
 end;
 write(res-1);
end;
begin
// assign(input,'a750.inp');reset(input);
 nhap;
// close(input);
end.