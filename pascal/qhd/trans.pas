uses math;
var n,c:longint;
    base:int64;
    f,s:array[-1001..1001,-10001..10001] of int64;
procedure nhap;
begin
 read(n,c);
 base:=1000000007;
end;
procedure xuli;
var i,t,tt:longint;
begin
 f[1,0]:=1;
 for t:=0 to c do
  begin
   s[1,t]:=1;
  end;
 for i:=2 to n do
  for t:=0 to c do
   begin
    f[i,t]:=((s[i-1,t]) mod base - (s[i-1,t-i]) mod base +base) mod base;
    s[i,t]:=((s[i,t-1]) mod base+(f[i,t]) mod base) mod base;
   end;
 write(f[n,c] mod base);
end;
BEGIN
  assign(input,'trans.inp');reset(input);
  assign(output,'trans.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
