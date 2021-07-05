uses math;
var n,m,res:longint;
    st:Array[0..21] of string;
    a,f,d:Array[0..31,0..31] of longint;
    x:array[0..2000] of longint;
procedure nhap;
var i,j,l,tt,tmp:longint;
begin
 readln(n);
 res:=maxlongint;
 for i:=1 to n do
  begin
   readln(St[i]);
   m:=length(St[i]);
   for j:=1 to m do a[i,j]:=ord(St[i,j])-48;
  end;
end;
procedure xuli;
var i,tmp,dem,dem1,j,tg,hailong:longint;
begin
 tmp:=0;    dem:=0;
 for i:=1 to n do
  if x[i]=1 then inc(Dem);
 dem1:=n-dem;
 if dem1<>0 then dem1:=dem1 div 2+1;
 if dem<>0 then dem:=dem div 2+1;
 if dem<>0 then
 for i:=1 to m do
 begin
  hailong:=dem;
  for j:=0 to 9 do
   if f[i,j]<dem then dec(dem,f[i,j])
   else tg:=j;
  dem:=hailong;
  for j:=0 to 9 do tmp:=tmp+abs(tg-j)*f[i,j];
  if tmp>res then exit;
 end;
 if dem1<>0 then
 for i:=1 to m do
 begin
  hailong:=dem1;
  for j:=0 to 9 do
   if d[i,j]<dem1 then dec(dem1,d[i,j])
   else tg:=j;
  dem1:=hailong;
  for j:=0 to 9 do tmp:=tmp+abs(tg-j)*d[i,j];
  if tmp>res then exit;
 end;
 res:=min(Res,tmp);
end;
procedure duyet(i:longint);
var  j,k:longint;
begin
 if i=n+1 then xuli
 else
 for k:=0 to 1 do
  begin
   x[i]:=k;
   if x[i]=1 then
    for j:=1 to m do inc(f[j,a[i,j]])
   else
    for j:=1 to m do inc(d[j,a[i,j]]);
   duyet(i+1);
   if x[i]=1 then
    for j:=1 to m do dec(f[j,a[i,j]])
   else
    for j:=1 to m do dec(d[j,a[i,j]]);
  end;
end;
begin
 assign(input,'dabstr.inp');reset(input);
 assign(output,'dabstr.out');rewrite(output);
 nhap;
 duyet(1);
 write(Res);
 close(input); close(output);
end.
