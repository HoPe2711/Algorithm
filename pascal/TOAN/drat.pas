var rr,res:int64;
    n,dem,res1:longint;
    nt,kq:array[0..30000] of longint;
function kt(x:longint):boolean;
var i:longint;
begin
 for i:=2 to trunc(sqrt(x)) do
  if x mod i=0 then exit(false);
 exit(true);
end;
procedure snt(n:longint);
var i:longint;
begin
 for i:=2 to trunc(sqrt(n)) do
 if kt(i) then
   begin
    inc(dem);
    nt[dem]:=i;
   end;
end;
procedure xuli;
var i:longint;
begin
 res:=1;
 i:=1;
 while n>1 do
  if i>dem then break
  else
   begin
    if n mod nt[i]=0 then
     begin
      n:=n div nt[i];
      inc(kq[nt[i]]);
     end
    else inc(i);
   end;
 for i:=1 to dem do
  if kq[nt[i]] mod 2=1 then res:=res*nt[i];
 if n<>1 then res:=res*n;
 rr:=res*res1;
 write(rr);
end;
begin
 assign(input,'drat.inp');reset(input);
 assign(output,'drat.out');rewrite(output);
 read(n);
 res1:=n;
 snt(n);
 xuli;
 close(input);
 close(output);
end.
