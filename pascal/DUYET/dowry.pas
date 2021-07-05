uses math;
var  n,dem,dem1,rear,front,kp:longint;
     l,r,res:int64;
     a,b,s,k,s1,k1,queu,b2,b1:array[0..32] of int64;
     tt,tear:array[0..32,0..32] of int64;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure nhap;
var  i:longint;
begin
 read(n,l,r);
 for i:=1 to n do read(a[i],b[i]);
end;
procedure duyet(i:longint;sum,kl:int64;bit:longint);
begin
 if i=n div 2+1 then
  begin
   inc(dem);
   s[dem]:=sum;
   k[dem]:=kl;
   b2[dem]:=bit;
   exit;
  end;
 if (sum+a[i]<=r) and (sum+a[i]>=l) then duyet(i+1,sum+a[i],kl+b[i],bit+1 shl (i-1));
 duyet(i+1,sum,kl,bit);
end;
procedure duyet1(i:longint;sum,kl:int64;bit:longint);
begin
 if i=n +1 then
  begin
   inc(dem1);
   s1[dem1]:=sum;
   k1[dem1]:=kl;
   b1[dem1]:=bit;
   exit;
  end;
 if (sum+a[i]<=r) and (sum+a[i]>=l) then duyet1(i+1,sum+a[i],kl+b[i],bit+1 shl (i-1));
 duyet1(i+1,sum,kl,bit);
end;
procedure doicho(var x,y:int64);
var tg:longint;
begin
 tG:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var mid,i,j:longint;
begin
 i:=l;
 j:=r;
 mid:=s1[l+random(r-l+1)];
 repeat
  while (s1[i]<mid) do inc(i);
  while (s1[j]>mid) do dec(j);
  if i<=j then
   begin
    doicho(s1[i],s1[j]);
    doicho(k1[i],k1[j]);
    doicho(b1[i],b1[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function find(l,r:longint;x:int64):longint;
var kq,mid:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if s1[mid]<=x then
    begin
     kq:=max(kq,mid);
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
procedure push(i:longint);
begin
 while (rear>=front) and (k1[i]>=k1[queu[rear]]) do dec(rear);
 inc(rear);
 queu[rear]:=i;
end;
procedure dequeu(kk:longint);
var i:longint;
begin
 rear:=0; front:=1;
 for i:=1 to kk-1 do push(i);
 for i:=kk to n do
  begin
   push(i);
   if queu[front]+kk<=i then inc(front);
   tt[i-kk+1,i]:=k1[queu[front]];
   tear[i-kk+1,i]:=queu[front];
  end;
end;
procedure xuli;
var  kk,i,rush,rush1:longint;
begin
 duyet(1,0,0,0);
 duyet1(n div 2+1,0,0,0);
 qsort(1,dem1);
 for kk:=1 to dem1 do dequeu(kk);
 for i:=1 to dem do
  if res<=k[i]+tt[find(1,dem1,l-s[i]),find(1,dem1,r-s[i])] then
   begin
    res:=k[i]+tt[find(1,dem1,l-s[i]),find(1,dem1,r-s[i])] ;
    rush:=b2[i];
    rush1:=b1[tear[find(1,dem1,l-s[i]),find(1,dem1,r-s[i])]];
   end;
 //write(res);
 for i:=1 to n div 2 do
  if getbit(rush,i-1)=1 then inc(kp);
 for i:=1 to n-n div 2 do if getbit(rush1,i-1)=1 then  inc(kp);
 writeln(kp);
 for i:=1 to n div 2 do
  if getbit(rush,i-1)=1 then writeln(i);
 for i:=1 to n-n div 2 do if getbit(rush1,i-1)=1 then  writeln(i);
end;
BEGIN
  assign(input,'dowry.inp');reset(input);
  assign(output,'dowry.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.