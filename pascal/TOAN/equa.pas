var h,t,a,b:longint;
    dem:int64;
    res:int64;
    prime,kq:array[0..32000] of longint;
    nt:array[0..3440] of longint;
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
 dem:=0;
 for i:=2 to n do
  if prime[i]=0 then
   begin
    inc(dem);
    nt[dem]:=i;
   end;
end;
procedure xuli;
var i,j,t1:longint;
begin
 fillchar(kq,sizeof(kq),0);
 res:=1;
 i:=1;
 while a>=0 do
  if i>dem then break
  else
   begin
    if a mod nt[i]=0 then
     begin
      a:=a div nt[i];
      inc(kq[nt[i]]);
     end
    else inc(i);
 end;
 j:=1;
 while b>=0 do
  if j>dem then break
  else
  begin
   if b mod nt[j]=0 then
    begin
     b:=b div nt[j];
     inc(kq[nt[j]]);
    end
   else inc(j);
  end;
 for t1:=1 to dem do
  res:=res*(kq[nt[t1]]*2+1);
 if a> trunc(sqrt(a)) then res:=res*3;
 if b> trunc(sqrt(b)) then res:=res*3;
 writeln(res);
end;
BEGIN
  assign(input,'equa.inp');reset(input);
  assign(output,'equa.out');rewrite(output);
  read(t);
  snt(32000);
  for h:=1 to t do
   begin
    read(a,b);
    xuli;
   end;
  close(input);close(output);
END.
