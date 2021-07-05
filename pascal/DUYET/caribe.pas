uses math;
var n,kk,dem,dem1:longint;
    res:int64;
    a,b,s1,k1,tt,s,k:array[0..40] of longint;
procedure nhap;
var i:longint;
begin
 read(n,kk);
 for i:=1 to n do read(a[i],b[i]);
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid,key,key1:longint;
begin
 i:=l;
 j:=r;
 mid:=l+random(r-l+1);
 key:=s1[mid];
 key1:=k1[mid];
 repeat
  while (s1[i]<key) or ((s1[i]=key) and (k1[i]<key1)) do inc(i);
  while (s1[j]>key) or ((s1[j]=key) and (k1[j]>key1)) do dec(j);
  if i<=j then
   begin
    doicho(s1[i],s1[j]);
    doicho(k1[i],k1[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure duyet(i,sum,kl:longint);
begin
 if i=n div 2+1 then
  begin
   inc(dem);
   S[dem]:=sum;
   K[dem]:=kl;
   exit;
  end;
 if sum+a[i]<=kk then duyet(i+1,sum+a[i],kl+b[i]);
 duyet(i+1,sum,kl);
end;
procedure duyet1(i,sum,kl:longint);
begin
 if i=n+1 then
  begin
   inc(dem1);
   S1[dem1]:=sum;
   K1[dem1]:=kl;
   exit;
  end;
 if sum+a[i]<=kk then duyet(i+1,sum+a[i],kl+b[i]);
 duyet(i+1,sum,kl);
end;
procedure xuli;
var i:longint;
begin
 duyet(1,0,0);
 duyet1(n div 2+1,0,0);
 qsort(1,dem1);
 for i:=1 to dem1 do tt[i]:=max(tt[i-1],k1[i]);
 for i:=1 to dem do res:=max(Res,k[i]+tt[kk-s[i]]);
 write(res);
end;
begin
  assign(input,'caribe.inp');reset(input);
  assign(output,'caribe.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
end.