uses math;
var n,m,l:longint;
    f:array[0..4000000,0..9] of longint;
procedure nhap;
begin
 fillchar(f,sizeof(f),0);
 read(n,m);
 l:=2**(n*m)-1;
end;
function batbit(x,i:longint):longint;
 begin
  exit(x or (1 shl i));
 end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
function check(i,st,j:longint):boolean;
begin
{ dem:=0;
 for i:=1 to n*m do
  if getbit(st,i-1)=1 then
   begin
    inc(dem);
    a[dem]:=i;
   end;  }
 if getbit(st,i-1)=1 then exit(false);
 if m>2 then
  begin
  if i mod 3=1 then
   if (getbit(st,i+1)=1) and (getbit(st,i)=0) and (j=i+2) then exit(false);
  if i mod 3=0 then
   if (getbit(st,i-3)=1) and (getbit(st,i-2)=0) and (j=i-2) then exit(false);
  end;
 if n>2 then
  begin
   if (i<m+1) then
    if (getbit(st,i+2*m-1)=1) and (getbit(st,i+m-1)=0) and (j=i+2*m) then exit(false);
   if i>(n-1)*m then
    if (getbit(st,i-2*m-1)=1) and (getbit(st,i-m-1)=0) and (j=i-2*m) then exit(false);
  end;
 if (n>2) and (m>2) then
  begin
   if i=1 then if (getbit(st,8)=1) and (getbit(st,4)=0) and (j=9) then exit(false);
   if i=9 then if (getbit(st,0)=1) and (getbit(st,4)=0) and (j=1) then exit(false);
   if i=3 then if (getbit(st,6)=1) and (getbit(st,4)=0) and (j=7)then exit(false);
   if i=7 then if (getbit(st,2)=1) and (getbit(st,4)=0) and (j=3) then exit(false);
  end;
 exit(true);
end;
procedure xuli;
var i,st,st1,res,j:longint;
begin
  res:=0;
  f[0,0]:=1;
  for st:=0 to l do
    for i:=1 to n*m do
    for j:=0 to n*m do
    if (check(i,st,j)) and (i<>j) then
     begin
      st1:=batbit(st,i-1);
      f[st1,i]:=f[st,j]+f[st1,i];
     end;
  for i:=1 to l do
   for j:=1 to m*n do res:=res+f[i,j];
  writeln(res);
end;
begin
  assign(input,'sc.inp');reset(input);
  assign(output,'sc.out');rewrite(output);
  while not seekeof do
  begin
   nhap;
   xuli;
  end;
 close(input);close(output);
end.
