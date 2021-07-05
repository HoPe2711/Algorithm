uses math;
var  m,n,res,dem:int64;
     base:int64;
     prime,nt,nt1,sl,sl1,d:array[0..1000000] of int64;
     hook:array[0..1000,0..1000] of int64;
procedure snt(n:longint);
var i,j:longint;
begin
 for i:=1 to n do prime[i]:=1;
 for i:=2 to trunc(sqrt(n)) do
  if prime[i]=1 then
   begin
    j:=i*i;
    while j<=n do
     begin
      prime[j]:=i;
      j:=j+i;
     end;
   end;
 for i:=2 to n do
  if prime[i]=1 then
   begin
    inc(dem);
    nt[i]:=dem;
    nt1[dem]:=i;
   end;
end;
function pow(x,a:int64):int64;
var tg:int64;
begin
 if x=0 then exit(1);
 tg:=pow(x div 2,a);
 tg:=(tg*tg) mod base;
 if x mod 2=1 then exit((tg*a) mod base)
 else exit(tg);
end;
procedure nhap;
var  i,j:longint;
begin
 read(m,n,base);
 for i:=1 to m do
  for j:=1 to m do
  if (i<=m-n) or (j<=m-n) then
   begin
    hook[i,j]:=2*m-i-j+1-n;
    if (1<=i) and (i<=m-n) then
     if (1<=j) and (j<=m-n) then inc(hook[i,j],n);
    inc(d[hook[i,j]]);
   end;
end;
procedure calt;
var i:longint;
    a,a1:int64;
begin
 for i:=1 to dem do
 if nt1[i]<=(m*m-n*n) then
  begin
   a:=nt1[i];
   a1:=a;
   while a1<=(m*m-n*n) do
    begin
     sl[i]:=sl[i]+(m*m-n*n) div a1;
     a1:=a1*a;
    end;
  end;
end;
procedure calm;
var i:longint;
    a1:int64;
begin
 for i:=1 to 2*m-1 do
  begin
   a1:=i;
   while (a1<>1) do
    begin
      if prime[a1]=1 then
       begin
        inc(sl1[nt[a1]],d[i]);
        break;
       end;
     inc(sl1[nt[prime[a1]]],d[i]);
     a1:=a1 div prime[a1];
    end;
  end;
end;
procedure print;
var i:longint;
begin
  res:=1;
  for i:=1 to dem do res:=int64(res)*pow(sl[i]-sl1[i],nt1[i]) mod base;
  write(Res);
end;
begin
 assign(input,'l.inp');reset(input);
 assign(output,'l.out');rewrite(output);
 snt(1000000);
 nhap;
 calt;
 calm;
 print;
 close(input); close(output);
end.
