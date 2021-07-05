var a,b,c,d:longint;
function gcd(a,b:longint):longint;
begin
 if a mod b=0 then exit(b);
 exit(gcd(b,a mod b));
end;
procedure nhap;
begin
 read(a,b,c,d);
 write(abs(int64(a)*d-int64(b)*c)-gcd(a,c)-gcd(b,d)+1);
end;
begin
 assign(input,'npairs.inp');reset(input);
 assign(output,'npairs.out');rewrite(output);
 nhap;
 close(input); close(output);
end.