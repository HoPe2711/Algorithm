uses math;
var n,k,x:longint;
    res:int64;
    a:array[0..30000,0..11] of longint;
    f:array[0..10000] of int64;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for j:=1 to n do
 for i:=1 to 11 do read(a[j,i]);
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function check(i,j:longint):boolean;
var k:longint;
begin
 for k:=1 to 11 do
  if (getbit(k-1,i)=1) and (getbit(k-1,j)=1) then exit(false);
 exit(true);
end;
procedure duyet(i,bit:longint;sum:int64);
begin
 if i=12 then
  begin
   f[bit]:=max(f[bit],sum);
   exit;
  end;
 duyet(i+1,bit,sum);
 duyet(i+1,bit+1 shl (i-1),sum+a[x,i]);
end;
procedure xuli;
var i,j,stt:longint; kq:int64;
begin
 k:=2**11-1;
 for i:=1 to n do
  begin
   x:=i;
   duyet(1,0,0);
  end;
 for i:=0 to k do
  for j:=0 to k do
  if check(i,j) then
   begin
    stt:=k xor (i or j);
    res:=max(res,f[i]+f[j]+f[stt]);
   end;
 write(res);
end;
begin
 assign(input,'acm.inp');reset(input);
 assign(output,'acm.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
