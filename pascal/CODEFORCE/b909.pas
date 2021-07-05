var res,n,dem:longint;
    p,p1,free:array[0..10000] of longint;
procedure nhap;
var i,j,l,r,tt,ok:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   l:=1; r:=l+i-1;
   while r<=n do
    begin
     inc(dem);
     p[dem]:=l; p1[dem]:=r;
     inc(l); inc(R);
    end;
  end;
 for i:=1 to dem do
  begin
   tt:=n;
   for j:=dem downto 1 do
    if (free[j]=0) and (p1[j]=tt) then
     begin
      free[j]:=1;
      tt:=p[j]-1;
      if tt=0 then break;
     end;
   ok:=0;
   for j:=1 to dem do
    if free[j]=0 then ok:=1;
   if ok=0 then
    begin
     res:=i;
     break;
    end;
  end;
 write(res);
end;
begin
 assign(input,'b909.inp');reset(input);
 //assign(output,'b909.out');rewrite(output);
 nhap;
 close(input);
 //close(outpuT);
end.