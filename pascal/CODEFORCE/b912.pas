uses math;
var n,k,tmp,res:int64; i:longint;
begin
 read(n,k);
 tmp:=1;
 for i:=1 to 61 do
  begin
   if tmp>n then
    begin
     res:=2**(i-1)-1;
     break;
    end;
   tmp:=tmp*2;
  end;
 if k=1 then res:=n;
 write(Res);
end.