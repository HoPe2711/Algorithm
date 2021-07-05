uses math;
var n,k,m:longint;
    res:int64;
    p:array [1..5000] of longint;
    f:array [1..5000,0..1024] of int64;
function getbit(stt,j:longint):longint;
 begin
  exit((stt shr j) and 1);
 end;
function check(stt,i:longint):boolean;
var j:longint;
    tmp:int64;
 begin
  tmp:=0;
  for j:=0 to k-1 do
   if getbit(stt,j)=1 then tmp:=tmp+p[i-j];
  if tmp>=m then exit(true)
  else exit(false);
 end;
procedure nhap;
var i:longint;
 begin
  read(n,k,m);
  for i:=1 to n do read(p[i]);
 end;
procedure xuly;
var i,j,l,stt,stt2:longint;
 begin
  l:=2**k-1;
  res:=high(int64);
  for i:=k to n do
   for stt:=0 to l do f[i,stt]:=high(int64);
  for stt:=0 to l do
   if check(stt,k) then
    begin
     f[k,stt]:=0;
     for j:=0 to k-1 do
      if getbit(stt,j)=1 then inc(f[k,stt],p[k-j]);
    end;
  for i:=k to n-1 do
   for stt:=0 to l do
    if (check(stt,i)) and (f[i,stt]<>high(int64)) then
     begin
      stt2:=(stt shl  1) and l;
      if check(stt2,i+1) then f[i+1,stt2]:=min(f[i+1,stt2],f[i,stt]);
      if check(stt2 or 1,i+1) then f[i+1,stt2 or 1]:=min(f[i+1,stt2 or 1],f[i,stt]+p[i+1]);
     end;
  for stt:=0 to l do res:=min(res,f[n,stt]);
  if res<> high(int64) then write(res)
  else write('No solution');
 end;
begin
 assign(input,'lights.inp');reset(input);
 assign(output,'lights.out');rewrite(output);
 nhap;
 xuly;
 close(input);close(output);
end.
