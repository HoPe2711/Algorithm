uses math;
var n,res,dem:longint;
    a,b,sl:array[0..2001] of longint;
    f:array[0..2000,0..1024] of longint;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;


function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function tm(i,j:longint):boolean;
begin
 if b[j]-b[i]=1 then exit(true);
 if b[j]-b[i]=8 then exit(true);
 if b[j]-b[i]=9 then exit(true);
 exit(False);
end;


procedure duyet(k,bit:longint);
var ok:boolean;
    i,j,pp:longint;
begin
 if k=min(dem+1,11) then
  begin
   ok:=false; pp:=0;
   for i:=1 to min(dem,10)-1 do
    for j:=i+1 to min(dem,10) do
    if (getbit(i-1,bit)=1) and (getbit(j-1,bit)=1) then if tm(i,j) then ok:=true;
   for i:=1 to min(dem,10) do
    if getbit(i-1,bit)=1 then pp:=pp+sl[i];
   if ok=false then
    begin
     f[min(dem,10),bit]:=pp;
    // write(pp,' ');
    end;
   exit;
  end;
 duyet(k+1,bit);
 duyet(k+1,bit+1 shl (k-1));
end;


function check(i,j:longint):boolean;
var k:longint;
begin
 for k:=2 to 10 do
 if getbit(k-1,j)=1 then
  if tm(i-(10-k),i+1) then exit(false);
 exit(true);
end;


procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x; x:=y; y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;


procedure xuli;
var last,i,j,j1 :longint;
begin
 qsort(1,n);    last:=1;
 a[n+1]:=-1;
 for i:=1 to n do
  if a[i]<>a[i+1] then
   begin
    inc(dem);
    b[dem]:=a[i];
    sl[dem]:=last;
    last:=1;
   end
  else inc(last);
 for i:=1 to dem do
  for j:=0 to 2**10-1 do f[i,j]:=-1;
 duyet(1,0);

 for i:=10 to dem-1 do
  for j:=0 to 2**10-1 do
   if f[i,j]<>-1 then
   begin
    j1:=(j shr 1);
    f[i+1,j1]:=max(f[i+1,j1],f[i,j]);
    j1:=j1+1 shl 9;
    if check(i,j) then f[i+1,j1]:=max(f[i+1,j1],f[i,j]+sl[i+1]);
   end;
 //writeln;
 res:=0;
 for i:=0 to 2**(min(10,dem))-1 do
 if f[dem,i]>res then res:=max(res,f[dem,i]);
 write(n-res);
end;
begin
 //assign(input,'seq189.inp');reset(input);
 //assign(output,'seq189.out');rewrite(output);
 nhap;
 xuli;
 //close(input);  close(output);
end.
