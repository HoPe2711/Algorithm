uses math;
const oo=high(int64) div 2;
var n,m:longint;
    a,b,kk,t,g,d1,pos:array[0..100000] of int64;
    d:array[0..100000,0..10] of int64;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to n do read(t[i],a[i],b[i]);
end;
procedure doicho(var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,key:longint;
    mid,mid1:int64;
begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 mid:=d1[key];
 mid1:=pos[key];
 repeat
  while (d1[i]<mid) or ((d1[i]=mid) and (pos[i]<mid1)) do inc(i);
  while (d1[j]>mid) or ((d1[j]=mid) and (pos[j]>mid1)) do dec(j);
  if i<=j then
   begin
    doicho(d1[i],d1[j]);
    doicho(pos[i],pos[j]);
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure qsort1(l,r:longint);
var i,j,key:longint;
    mid,mid1:int64;
begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 mid:=t[key];
 mid1:=pos[key];
 repeat
  while (t[i]<mid) or ((t[i]=mid) and (pos[i]<mid1)) do inc(i);
  while (t[j]>mid) or ((t[j]=mid) and (pos[j]>mid1)) do dec(j);
  if i<=j then
   begin
    doicho(t[i],t[j]);
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    doicho(pos[i],pos[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;
procedure xuli;
var i,k,tt:longint;
    s,x:int64;
begin
 for i:=1 to n do pos[i]:=i;
 qsort1(1,n);
 for i:=1 to n do
 begin
  x:=oo;
  for k:=1 to m do
   if g[k]<x then
    begin
     x:=g[k];
     tt:=k;
    end;
  if g[tt]<=t[i] then
     begin
      d1[i]:=t[i]+a[i];
      g[tt]:=d1[i];
     end
   else
    begin
     d1[i]:=g[tt]+a[i];
     g[tt]:=d1[i];
    end;
 end;
 qsort(1,n);    s:=0;
 for i:=1 to n do
  if d1[i]<=s then
   begin
    s:=s+b[i];
    kk[pos[i]]:=s;
   end
  else
   begin
    s:=d1[i]+b[i];
    kk[pos[i]]:=s;
   end;
 for i:=1 to n do writeln(kk[i]);
end;
begin
 assign(input,'bank.inp');reset(input);
 assign(output,'bank.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.