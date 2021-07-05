uses math;
var n,res,kq:longint;
    f,g,a:array[1..100001] of longint;
function gcd(a,b:longint):longint;
begin
 if a*b=0 then exit(a+b);
 if a mod b=0 then exit(b);
 exit(gcd(b,a mod b));
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   if i>1 then f[i]:=gcd(f[i-1],a[i]) else f[1]:=a[1];
  end;
 g[n]:=a[n];
 for i:=n-1 downto 1 do g[i]:=gcd(g[i+1],a[i]);
end;
procedure xuli;
var i:longint;
begin
 res:=0;
 for i:=1 to n do
 if (i>1) and (i<n) then
  begin
   if res<gcd(f[i-1],g[i+1]) then
    begin
     res:=gcd(f[i-1],g[i+1]);
     kq:=i;
    end;
  end
 else if i=1 then
  begin
   if res<g[i+1] then
    begin
     res:=g[i+1];
     kq:=1;
    end;
  end
 else
  if res<f[i-1] then
   begin
    res:=f[i-1];
    kq:=n;
   end;
 write(kq,' ',res);
end;
begin
 assign(input,'seqgcd.inp');reset(input);
 assign(output,'seqgcd.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
