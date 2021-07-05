uses math;
var n,dem,res,j1:longint;
    nt,a,dd,prime:array[0..101] of longint;
    stt:array[0..101] of int64;
    f:array[0..101,0..1050000] of longint;
procedure nhap;
var i,j,x:longint;
begin
 read(n);
 for i:=1 to n do
   begin
    read(x);
    if dd[x]=0 then
     begin
      inc(j1);
      a[j1]:=x;
     end;
    dd[x]:=1;
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
procedure snt(n:longint);
var i,j:longint;
begin
 for i:=2 to trunc(sqrt(n)) do
  if prime[i]=0 then
  begin
   j:=i*i;
   while j<=n do
    begin
     prime[j]:=1;
     j:=j+i;
    end;
  end;
 for i:=2 to n do
  if prime[i]=0 then
   begin
    inc(dem);
    nt[dem]:=i;
   end;
end;
procedure xuli;
var i,k,l,tt,tt2,tg:longint;
begin
 for i:=1 to j1 do
  begin
   k:=1;
   while k<=dem do
    if a[i] mod nt[k]=0 then
    begin
     a[i]:=a[i] div nt[k];
     batbit(stt[i],k);
    end
   else inc(k);
  end;
 for i:=1 to j1 do
  for tt:=0 to 2**dem-1 do
    begin
     l:=0;
     tg:=stt[i] and tt;
     for k:=1 to dem do
      if (getbit(tg,k)=1) then inc(l);
     if l=0 then
      begin
       tt2:=stt[i] xor tt;
       f[i+1,tt2]:=max(f[i,tt]+1,f[i+1,tt2]);
      end;
    end;
 for i:=0 to 2**dem-1 do res:=max(res,f[n,i]);
 write(res);
end;
BEGIN
  assign(input,'coprime.inp');reset(input);
  assign(output,'coprime.out');rewrite(output);
  nhap;
  snt(72);
  xuli;
  close(input);close(output);
END.
