var dd,h:array[0..1000000] of longint;
    n,res:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(h[i]);
 for i:=1 to n do
  begin
   if dd[h[i]]=0 then inc(Res)
   else dec(dd[h[i]]);
   inc(Dd[h[i]-1]);
  end;
 write(res);
end;
begin
 assign(input,'minarrows.inp');reset(input);
 assign(output,'minarrows.out');rewrite(output);
 nhap;
 close(input); close(output);
end.