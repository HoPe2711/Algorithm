uses math;
var n,a,b:longint;
    c,f:array[0..200,0..200] of longint;
    dd:array[0..200,0..200] of boolean;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a,b);
   if a>b then doicho(a,b);
   c[a,b]:=1;
  end;
end;
function tinh(i,j:longint):longint;
var h,tg:longint;
begin
 if dd[i,j] then exit(f[i,j]);
 dd[i,j]:=true;
 if i=j then
 begin
  f[i,j]:=0;
  exit(f[i,j]);
 end;
 tg:=0;
 for h:=i to j do
  if tg<tinh(i,h)+tinh(h,j)+c[i,j] then tg:=tinh(i,h)+tinh(h,j)+c[i,j];
 f[i,j]:=tg;
 exit(f[i,j]);
end;
BEGIN
  assign(input,'planset.inp');reset(input);
  assign(output,'planset.out');rewrite(output);
  nhap;
  write(tinh(0,2*n-1));
  close(input);close(output);
END.
