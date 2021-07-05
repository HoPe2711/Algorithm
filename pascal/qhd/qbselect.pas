uses math;
var a:array[0..10000,0..4] of longint;
    f:array[0..10001,0..15] of longint;
    dd:array[0..10001,0..15] of boolean;
    n,res,res2:longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for j:=1 to 4 do
  begin
   for i:=1 to n do
    read(a[i,j]);
    readln;
  end;
end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
function check(i:longint):longint;
var j,kq1:longint;
begin
 for j:=0 to 2 do
  if (getbit(i,j) = getbit(i,j+1)) and (getbit(i,j)=1) then exit(1);
  exit(0);
end;
procedure xuli;
var i,stt,stt2,j,kq,h:longint;
begin
 for i:=1 to n do
  for stt:=0 to 15 do
   if check(stt)=0 then
    for j:=0 to 15 do
     if ((j and stt)=0) and (check(j)=0)  then
      begin
       kq:=0;
       for h:=1 to 4 do
       if getbit(j,h-1)=1 then kq:=kq+a[i,h];
       f[i+1,j]:=max(f[i,stt]+kq,f[i+1,j])
      end;
  for i:=0 to 15 do res:=max(res,f[n+1,i]);
  write(max(res,res2));
end;
begin
 assign(input,'');reset(input);
 assign(output,'');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.


