uses math;
var n,res,kq:longint;
    a:array[0..20,0..20] of longint;
    f:array[0..70000,0..20] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
  for i:=1 to n do
   begin
    for j:=0 to n-1 do read(a[i,j]);
    readln;
   end;
end;
function batbit(x,i:longint):longint;
 begin
  exit(x or (1 shl i));
 end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure xuli;
var i,j,stt,stt2:longint;
begin
  for i:=0 to n-1 do
    f[batbit(stt,i),1]:=a[1,i];
  for stt:=0 to 2**n-1 do
    for last:=1 to n do
      if getbit(stt,last)=1 then
        For j:=1 to n do
        If getbit(stt,j)=0 then
      begin
       stt2:=batbit(stt,j);
       f[stt2,i+1]:=min(f[stt2,last],f[stt,last]+a[j,last]);
      End;
 res:=high(longint);
 for i:=0 to 2**n-1 do
  begin
    res:=min(res,f[n,i]);
  end;
 write(res);
end;
begin
 assign(input,'lem3.inp');reset(input);
 assign(output,'lem3.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
