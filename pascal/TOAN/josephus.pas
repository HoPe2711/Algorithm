var n,m,p,y:int64;
procedure nhap;
var nn,mm:int64;
begin
 read(n,m);
 read(p,y);
 inc(p);
 nn:=n+1;
 mm:=m-1;
 while p>n do p:=p+(p-nn) div mm-n;
 write(p-1,' ');
end;
begin
 assign(input,'josephus.inp');reset(input);
 assign(output,'josephus.out');rewrite(output);
 nhap;
 close(input); close(output);
end.