var n,k,res:longint;
    free:array[0..100000] of boolean;
    x,vt,v:array[0..100000] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(vt[i],v[i]);
 for i:=1 to n do x[i]:=vt[i]+v[i]*k;
end;
procedure xuli;
var i,j:longint;
begin
 for i:=n downto 1 do
 if free[i]=false then
  begin
   for j:=i-1 downto 1 do
    if x[i]<=x[j] then free[j]:=true;
   inc(Res);
  end;
 write(res);
end;
begin
 assign(input,'running.inp');reset(input);
 assign(output,'running.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.