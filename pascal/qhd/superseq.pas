const base=666013;
var n,h,k:longint;
    f:array[0..100,0..30,0..30] of int64;
procedure cal(sl,i:longint);
var u,t,l,r:longint;
begin
 if i=1 then
  begin
   for u:=0 to h do f[sl,u,u]:=1;
   exit;
  end;
 if i mod 2=1 then
  begin
   cal(sl-1,i-1);
   for l:=0 to h do
    for r:=0 to h do
     for u:=0 to h do
      if abs(u-r)<=k then f[sl,l,r]:=(f[sl,l,r]+f[sl-1,l,u]) mod base;
  end
 else
  begin
   cal(sl-1,i div 2);
   for l:=0 to h do
    for r:=0 to h do
     for u:=0 to h do
      for t:=0 to h do
       if abs(t-u)<=k then f[sl,l,r]:=(f[sl,l,r]+(f[sl-1,l,u]*f[sl-1,t,r]) mod base) mod base;
  end;
end;
BEGIN
  assign(input,'superseq.inp');reset(input);
  assign(output,'superseq.out');rewrite(output);
  read(n,h,k);
  cal(2,n);
  write(f[2,0,h]);
 close(input);close(output);
END.

