var m,n:longint;
    f:array[1..500,1..500] of longint;
procedure nhap;
begin
 read(m,n);
end;
function tinh(a,b:longint):longint;
var c,res:longint;
begin
 if f[a,b]<>0 then exit(f[a,b]);
 if a>b then exit(tinh(b,a));
 if a=b then
  begin
   f[a,b]:=1;
   exit(f[a,b]);
  end;
 res:=a*b;
 for c:=1 to a div 2 do
  if res> (tinh(c,b)+tinh(a-c,b)) then res:= tinh(c,b)+tinh(a-c,b);
 for c:=1 to b div 2 do
  if res> (tinh(a,c)+tinh(a,b-c)) then res:= tinh(a,c)+tinh(a,b-c);
 f[a,b]:=res;
 exit(f[a,b]);
end;
BEGIN
  assign(input,'catvai.inp');reset(input);
  assign(output,'catvai.out');rewrite(output);
  nhap;
  write(tinh(m,n));
  close(input);close(output);
END.
