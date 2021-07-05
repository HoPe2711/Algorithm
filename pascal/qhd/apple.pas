uses math;
var res,n,k:longint;
    f:array[0..1001,0..1,0..1001] of boolean;
procedure nhap;
var i,j,gt:longint;
    kq:real;
begin
 read(n,k);
 f[0,0,n]:=true;
 for i:=1 to k do
  for j:=0 to 1 do
   for gt:=0 to n do
    if f[i-1,j,gt] then
      if j=1 then f[i,0,gt]:=true
      else
       begin
        if gt<>0 then f[i,1,gt-1]:=true;
        f[i,gt mod 2,trunc(gt div 2)]:=true;
       end;
 for i:=0 to n do
  for j:=0 to 1 do
   if f[k,j,i] then inc(res);
 writeln(res);
 for i:=0 to n do
  for j:=0 to 1 do
   if f[k,j,i] then
    begin
     kq:=i;
     if j=1 then kq:=kq+0.5;
     write(kq:0:1,' ');
    end;
end;
begin
 assign(input,'apple.inp');reset(input);
 assign(output,'apple.out');rewrite(output);
 nhap;
 close(input); close(output)
end.