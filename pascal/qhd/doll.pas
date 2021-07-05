uses math;
const oo=maxlongint;
var n:longint;
    a,tt,sum:array[0..500] of longint;
    minn,res,c:array[0..501,0..501] of longint;
    pos:array[0..500,0..500,0..500] of longint;
    d,dd:array[0..500,0..500] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
function chuyen(i,p,k:longint):longint;
var kq,tg:longint;
begin
 kq:=k-i+1;
 if minn[i,p]<minn[p+1,k] then
  begin
   tg:=minn[p+1,k];
   kq:=kq-pos[i,p,tg]
  end
 else
  begin
   tg:=minn[i,p];
   kq:=kq-pos[p+1,k,tg];
  end;
 exit(kq);
end;
function check(i,j:longint):boolean;
var k:longint;
begin
 for k:=1 to 500 do tt[k]:=0;
 for k:=i to j do
 begin
  if tt[a[k]]<>0 then exit(false);
  tt[a[k]]:=1;
 end;
 exit(true);
end;
function check1(i,j:longint):boolean;
var  k:longint;
begin
 for k:=1 to (j-i+1) do tt[k]:=0;
 for k:=i to j do tt[a[k]]:=1;
 for k:=1 to (j-i+1) do
  if tt[k]=0 then exit(false);
 exit(true);
end;
function tinh(i,j:longint):longint;
var p,tmp,tmp1:longint;
begin
 if d[i,j] then exit(c[i,j]);
 d[i,j]:=true;
 if check(i,j)=false then
  begin
   c[i,j]:=oo;
   exit(oo);
  end;
 if i=j then
  begin
   c[i,j]:=0;
   exit(c[i,j]);
  end;
 for p:=i to j-1 do
  begin
   tmp:=tinh(i,p); tmp1:=tinh(p+1,j);
   if (tmp<>oo) and (tmp1<>oo) then c[i,j]:=min(c[i,j],tmp+tmp1+chuyen(i,p,j));
  end;
 exit(c[i,j]);
end;
function cal(i,j:longint):longint;
var p,tmp,tmp1:longint;
begin
 if dd[i,j] then exit(res[i,j]);
 dd[i,j]:=true;
 if check1(i,j) then
  begin
   res[i,j]:=c[i,j];
   exit(c[i,j]);
  end;
 for p:=i to j-1 do
  begin
   tmp:=cal(i,p); tmp1:=cal(p+1,j);
   if (tmp<>oo) and (tmp1<>oo) then res[i,j]:=min(Res[i,j],tmp+tmp1);
  end;
 exit(res[i,j]);
end;
procedure xuli;
var i,j,p,k:longint;
begin
 for i:=1 to n-1 do
  begin
   c[i,i]:=0;
   for j:=i+1 to n do
    begin
     c[i,j]:=oo;
     res[i,j]:=oo;
    end;
  end;
 for i:=1 to n do
  for j:=i to n do
   for p:=i to j do
     if minn[i,j]=0 then minn[i,j]:=a[p] else minn[i,j]:=min(minn[i,j],a[p]);
 for k:=1 to 500 do
 begin
  for i:=1 to n do
   if a[i]<k then sum[i]:=sum[i-1]+1 else sum[i]:=sum[i-1];
  for i:=0 to n-1 do
   for j:=i+1 to n do pos[i+1,j,k]:=sum[j]-sum[i];
 end;
 {for i:=1 to n-1 do
  for j:=i+1 to n do
   if check(i,j) then
   for p:=i to j-1 do
    if (c[i,p]<>oo) and (c[p+1,j]<>oo) then c[i,j]:=min(c[i,j],c[i,p]+c[p+1,j]+chuyen(i,p,j)); }
 k:=tinh(1,n);
 {for i:=1 to n-1 do
  for j:=i+1 to n do
   if check1(i,j) then f[i,j]:=c[i,j];
 for i:=1 to n-1 do
  for j:=i+1 to n do
   for p:=i to j-1 do
    if (f[i,p]<>0) and (f[p+1,j]<>0) then res[i,j]:=min(res[i,j],f[i,p]+f[p+1,j]);  }
 k:=cal(1,n);
 if k=oo then write('impossible') else
 write(k);
end;
begin
 assign(input,'doll.inp');reset(input);
 assign(output,'doll.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.