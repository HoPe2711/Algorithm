uses math;
const oo=high(int64);
var n,k:longint; res:int64;
    g:array[0..20,0..20] of int64;
    pp:array[0..1000000,0..20] of int64;
    x,a:array[0..1000000] of longint;
    free:array[0..20] of boolean;
    f:array[0..2000000,0..20] of int64;
procedure nhap;
var  i,j:longint;
begin
 read(n,k);
 if (n=0) then halt;
 fillchar(g,sizeof(g),0);
 fillchar(pp,sizeof(pp),0);
 res:=high(int64);
 for i:=1 to n do
  begin
   read(A[i]);
   for j:=1 to k do pp[i,j]:=pp[i-1,j];
   inc(pp[i,a[i]]);
  end;
 for i:=1 to n do
  for j:=1 to k do g[j,a[i]]:=g[j,a[i]]+pp[i,j];
end;
procedure xuli;
var i,j:longint; ans:int64;
begin
 ans:=0;
 for i:=1 to k do
  for j:=k downto i+1 do
   if ans<res then ans:=ans+g[x[j],x[i]]
   else exit;
 res:=min(res,ans);
end;
procedure duyet(i:longint);
var  j:longint;
begin
 if i=k+1 then xuli
 else
  for j:=1 to k do
  if free[j]=false then
   begin
    free[j]:=true;
    x[i]:=j;
    duyet(i+1);
    free[j]:=false;
   end;
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
procedure xuli1;
var cp:int64; i,j,l,tt,tt1:longint;
begin
 l:=2**k-1;
 for i:=0 to l do
  for j:=1 to k do f[i,j]:=oo;
 //f[0,0]:=0;
 for j:=1 to k do f[0,j]:=0;
 for tt:=0 to l do
  for i:= 1 to k do
  if getbit(i-1,tt)=0 then
   begin
    cp:=0;
    for j:=1 to k do
     if (getbit(j-1,tt)=0) and (i<>j) then cp:=cp+g[j,i];
    tt1:=batbit(i-1,tt);
    for j:=1 to k do
     if ((getbit(j-1,tt)=1) and (F[tt,j]<>oo)) or (tt=0) then f[tt1,i]:=min(f[tt1,i],f[tt,j]+cp);
   end;
 for j:=1 to k do res:=min(Res,f[l,j]);
end;
begin
 assign(input,'sort.inp');reset(input);
 assign(output,'sort.out');rewrite(output);
 while not seekeof do
  begin
   nhap;
  // if k<=5 then duyet(1)
  { else} xuli1;
   writeln(res);
  end;
 close(input); close(output);
end.
