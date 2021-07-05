uses math;
const oo=1000000000;
var n,dem,dem1,res,hailong:longint;
    le,ri:int64;
    a,bit,bit1,lp,pos:array[0..1100000] of longint;
    tt,tt1,pack:array[0..1100001] of int64;
    trace,trace1,f:array[0..81,0..100001]  of longint;
procedure nhap;
var  i:longint;
begin
 read(n,le,ri);
 for i:=1 to n do
  begin
   read(a[i]);
   if a[i]=i then inc(hailong);
   pos[i]:=i;
  end;
end;

function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure duyet(i:longint;sum:int64;bitt:longint);
begin
 if i=n div 2+1 then
  begin
   inc(dem);
   tt[dem]:=sum;
   bit[dem]:=bitt;
   exit;
  end;
 duyet(i+1,sum,bitt);
 duyet(i+1,sum+a[i],bitt + 1 shl (i-1));
end;
procedure duyet1(i:longint;sum:int64;bitt:longint);
begin
 if i=n+1 then
  begin
   inc(dem1);
   tt1[dem1]:=sum;
   bit1[dem1]:=bitt;
   exit;
  end;
 duyet1(i+1,sum,bitt);
 duyet1(i+1,sum+a[i],bitt + 1 shl (i-n div 2-1));
end;
function find(l,r,x:longint):longint;
var mid:longint;
begin
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if (tt1[mid]+x>=le) and (tt1[mid]+x<=ri) then exit(mid)
   else if (tt1[mid]+x)<le then l:=mid+1
   else r:=mid-1;
  end;
 exit(0);
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure doicho1(var x,y:int64);
Var
  tg:int64;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j:longint;  key:int64;
  Begin
    i:=l;
    j:=r;
    key:=tt1[(l+r) div 2];
    repeat
      while tt1[i] < key do inc(i);
      while tt1[j] > key do dec(j);
      if i <= j then
      Begin
      doicho1(tt1[i],tt1[j]);
      doicho(bit1[i],bit1[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
procedure xuli;
var i,kq,kq1,kk:longint;
begin
 duyet(1,0,0);
 duyet1(n div 2+1,0,0);
 qsort(1,dem1);
 for i:=1 to dem do
 begin
  kk:=find(1,dem1,tt[i]);
  if kk<>0 then
   begin
    kq1:=bit[i];
    kq:=bit1[kk];
    break;
   end;
 end;
 for i:=1 to n div 2 do
  if getbit(i-1,kq1)=1 then
   begin
    inc(Res);
    lp[res]:=i;
   end;
 for i:=n div 2+1 to n do
  if getbit(i-n div 2-1,kq)=1 then
   begin
    inc(res);
    lp[res]:=i;
   end;
 writeln(res);
 for i:=1 to res do write(lp[i],' ');
end;
procedure truyvet1(i,sum:longint);
begin
 if (i=0) and (sum=0) then exit;
 if sum<>trace1[i,sum] then
  begin
   inc(Res);
   lp[res]:=i;
  end;
 truyvet1(trace[i,sum],trace1[i,sum]);
end;
procedure xuli1;
var i,j,kq,kq1:longint; ok:boolean;
begin
 for i:=0 to n-1 do
  for j:=0 to le do f[i,j]:=oo;
 f[0,0]:=0;       ok:=false;
 for i:=0 to n-1 do
  if ok=false then
  for j:=0 to le do
  if f[i,j]<>oo  then
   begin
    f[i+1,j]:=f[i,j];
    trace[i+1,j]:=i;
    trace1[i+1,j]:=j;
    if (j>=le) and (j<=ri) then
     begin
      kq:=i+1;
      kq1:=j;
      ok:=true;
     end;
    if j+a[i+1]<=ri then
     begin
      f[i+1,j+a[i+1]]:=f[i,j]+1;
      trace[i+1,j+a[i+1]]:=i;
      trace1[i+1,j+a[i+1]]:=j;
     end;
    if (j+a[i+1]>=le) and (j+a[i+1]<=ri) then
     begin
      kq:=i+1;
      kq1:=j+a[i+1];
      ok:=true;
     end;
   end;
 truyvet1(kq,kq1);
 writeln(res);
 for i:=res downto 1 do write(lp[i],' ');
end;
procedure xuli2;
var i,tungduong,tt:longint;
begin
 for i:=1 to n do
  begin
   pack[i]:=pack[i-1]+a[i];
   if pack[i]>=le then
    begin
     tungduong:=i;
     break;
    end;
  end;
 tt:=pack[tungduong]-ri;
 if tt<=0 then
  begin
   writeln(tungduong);
   for i:=1 to tungduong do write(i,' ');
  end
 else
  begin
   writeln(tungduong-1);
   for i:=1 to tungduong do
    if i<>tt then write(i,' ');
  end;
end;
procedure qsort1(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j  then
   begin
   doicho(a[i],a[j]);
   doicho(pos[i],pos[j]);
   inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;
procedure xuli3;
var i,tungduong,j:longint; tt:int64;
begin
 qsort1(1,n);
 for i:=1 to n do
  begin
   pack[i]:=pack[i-1]+a[i];
   if pack[i]>=le then
    begin
     tungduong:=i;
     break;
    end;
  end;
 tt:=pack[tungduong];
 i:=1;
 while (tungduong<=n) and ((tt>ri) or (tt<le)) do
  if tt>ri then
  begin
   tt:=tt-a[i];
   inc(i);
  end
  else
   begin
    tt:=tt+a[tungduong];
    inc(tungduong);
   end;
 writeln(tungduong-i+1);
 for j:=i to tungduong do write(pos[j],' ');
end;
begin
 assign(input,'subset.inp');reset(input);
 assign(output,'subset.out');rewrite(output);
 nhap;
 if n<=40 then xuli
 else if (n<=80) and (ri<=10**5) then xuli1
 else if (n<=200000) and (hailong=n) then xuli2
 else xuli3;
 close(input); close(output);
end.
