var i,n,x,y,dem,dem1:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(X,y);
   if x>0 then inc(dem)
   else inc(dem1);
  end;
 if dem<=1 then
  begin
   write('Yes');
   exit;
  end;
 if dem1<=1 then
  begin
   write('Yes');
   exit;
  end;
 write('No');
end.