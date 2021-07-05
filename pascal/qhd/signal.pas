uses math;
var n,b:longint;
    res:longint;
    a:array[0..200001] of longint;
    f,g:array[0..200001] of longint;
procedure nhap;
var i:longint;
begin
 read(n,b);
 for i:=1 to n do
  begin
   read(a[i]);
   f[i]:=max(f[i-1],a[i]);
  end;
 for i:=n downto 1 do g[i]:=max(g[i+1],a[i]);
 res:=-1;
 for i:=2 to n-1 do
  if (f[i-1]>=b+a[i]) and (g[i+1]>=b+a[i]) then res:=max(Res,f[i-1]+g[i+1]-2*a[i]);
 write(res);
end;
begin
 assign(input,'signal.inp');reset(input);
 assign(output,'signal.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
