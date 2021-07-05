var n,k,a,b,res:longint;
    p,tt,th,pt:array[0..100000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(p[i]);
 read(a,b);
end;
procedure xuli;
var x,i,dem:longint;
begin
 for x:=a to b do
 begin
  dem:=0;
  for i:=1 to n do
   if x mod p[i]=0 then inc(dem);
  if dem=k then
   begin
   // write(x,' ');
    inc(Res);
   end;
 end;
 write(res);
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=p[l+random(r-l+1)];
 repeat
  while p[i]<mid do inc(i);
  while p[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(p[i],p[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli1;
var i,last,dem,q,q1,j:longint;
begin
 qsort(1,n);
 last:=0; dem:=0;
 for i:=1 to n do
  if p[i]<>last then
   begin
    last:=p[i];
    inc(dem);
    tt[dem]:=1;
    pt[dem]:=p[i];
   end
  else inc(tt[dem]);
 for i:=1 to dem do
  begin
   if a mod pt[i]=0 then q:=a div pt[i]
   else q:=a div pt[i]+1;
   q1:=b div pt[i];
   for j:=q to q1 do inc(th[j*pt[i]-a+1],tt[i]);
  end;
 for i:=1 to b-a+1 do
  if  th[i]=k then inc(Res);
 write(res);
end;
begin
 assign(input,'lottery.inp');reset(input);
 assign(output,'lottery.out');rewrite(output);
 nhap;
 if (n<=1000) and (b-a<=1000) then xuli
 else xuli1;
 close(input); close(output);
end.
