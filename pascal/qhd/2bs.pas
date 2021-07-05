uses math;
var n,a,b:longint;
    f,h:array[0..100,0..100] of longint;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=1 to n do
   if h[i,j]=1 then f[i,j]:=f[i-1,j-1]+1
   else f[i,j]:=max(f[i,j-1],f[i-1,j]);
end;
BEGIN
  assign(input,'2bs.inp');reset(input);
  assign(output,'2bs.out');rewrite(output);
  read(n);
   while not seekeof do
   begin
    read(a,b);
    h[a,b]:=1;
   end;
  xuli;
  write(f[n,n]);
  close(input);close(output);
END.
