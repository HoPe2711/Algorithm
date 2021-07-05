uses math;
var n,k,base:longint;
    res,sum:int64;
    a,prime,dem:array[0..5000000] of longint;
procedure nhap;
var i:longint;
begin
  read(n,k,base);
  for i:=1 to k do
   begin
    read(a[i]);
    sum:=sum+a[i];
   end;
end;
procedure snt(n:longint);
var  i:longint; j:int64;
begin
 for i:=2 to trunc(sqrt(N)) do
  if prime[i]=0 then
   begin
    prime[i]:=i;
    j:=int64(i)*i;
    while j<=n do
     begin
      prime[j]:=i;
      j:=j+i;
     end;
   end;
 for i:=2 to n do
  if prime[i]=0 then prime[i]:=i;
end;
function pow(a:int64;x:int64):int64;
var tg:int64;
begin
 if x=0 then exit(1 mod base);
 if x=1 then exit(a mod base);
 tg:=pow(a,x div 2);
 tg:=tg*tg mod base;
 if x mod 2=1 then exit(tg*a mod base)
 else exit(tg);
end;
procedure xuli;
var i,j:longint;
begin
 if sum>n then
  begin
   write(0);
   exit;
  end;
 dec(n,sum);
 k:=k-1;
 n:=n+k;
 for i:=2 to n-k do
  begin
   j:=i;
   while j<>1 do
    begin
     dec(dem[prime[j]]);
     j:=j div prime[j];
    end;
  end;
 for i:=k+1 to n do
  begin
   j:=i;
   while j<>1 do
    begin
     inc(dem[prime[j]]);
     j:=j div prime[j];
    end;
  end;
 res:=1 mod base;
 for i:=1 to 2000000 do
 if dem[i]>0 then res:=res*pow(i,dem[i]) mod base;
 write(REs);
end;
begin
 assign(input,'equa2.inp');reset(input);
 assign(output,'equa2.out');rewrite(output);
 nhap;
 snt(2000000);
 xuli;
 close(input); close(output);
end.
