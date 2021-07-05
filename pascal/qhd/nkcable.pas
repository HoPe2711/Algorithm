uses math;
var a,f:Array[0..100000] of longint;
    n:longint;
procedure nhap;
var  i:longint;
begin
  read(n);
  for i:=1 to n-1 do read(a[i]);
  f[1]:=0; f[2]:=a[1]; f[3]:=a[1]+a[2];
  for i:=4 to n do f[i]:=min(f[i-1],f[i-2])+a[i-1];
  write(f[n]);
end;
begin
 assign(input,'nkcable.inp');reset(input);
 assign(output,'nkcable.out');rewrite(output);
 nhap;
 close(input); close(output);
end.