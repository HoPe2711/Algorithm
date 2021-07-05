var a,deg,d:array[0..2000] of longint;
    n,i:longint;
begin
// assign(input,'b913.inp'); reset(input);
 read(n);
 for i:=1 to n-1 do
  begin
   read(a[i]);
   inc(deg[a[i]]); //inc(deg[i+1]);
  end;
 for i:=2 to n do
  if deg[i]=0 then inc(d[a[i-1]]);
 for i:=1 to n do
  if (deg[i]<>0) and (d[i]<3) then
   begin
    write('No');
    exit;
   end;
  write('Yes');
// close(inpuT);
end.