uses math;
const base=1000000007;
var n,q,dem,maxx,gioihan:longint;
    val,p,a:array[0..10000] of longint;
    prime,tt:array[0..100005] of longint;
    f,ts:Array[0..20000] of int64;
procedure snt(n:longint);
var  i:longint; j:int64;
begin
 for i:=2 to n do
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
end;
procedure nhap;
var i,x,tmp:longint;
begin
 read(n,q);
 for i:=1 to n do
  begin
   read(x);
   while x<>1 do
    begin
     tmp:=prime[x];
     x:=x div tmp;
     inc(tt[tmp]);
    end;
  end;
 for i:=1 to 100000 do
  if tt[i]<>0 then
   begin
    inc(dem);
    p[dem]:=i;
    val[dem]:=tt[i];
    maxx:=maxx+tt[i];
   end;
end;


procedure build;
var i,j,k:longint;   tg:int64;
begin
 f[0]:=1;
 for i:=1 to dem do
 begin
  tg:=1;
  ts[0]:=1;
  for j:=1 to min(val[i],gioihan) do
   begin
    ts[j]:=(ts[j-1]*p[i] mod base+f[j]) mod base;
    tg:=tg*p[i] mod base;
   end;
  tg:=tg*p[i] mod base;
  for j:=val[i]+1 to gioihan do
   begin
    ts[j]:=(ts[j-1]*p[i] mod base+f[j]-f[j-val[i]-1]*tg mod base+base) mod base;
    f[j-val[i]-1]:=ts[j-val[i]-1];
   end;
  for j:=max(gioihan-val[i],0) to gioihan do f[j]:=ts[j];
 end;
end;

procedure xuli;
var x,j:longint;
begin
 for j:=1 to q do
  begin
   read(a[j]);
   if maxx<a[j] then continue;
   gioihan:=max(gioihan,a[j]);
 end;
 build;
 for j:=1 to q do
  begin
   if maxx<A[j] then
    begin
     writeln(0);
     continue;
    end;
   writeln(F[a[j]]);
  end;
end;
begin
 assign(input,'product.inp');reset(input);
 assign(output,'product.out');rewrite(output);
 snt(100000);
 nhap;
 xuli;
 close(input); close(output);
end.
