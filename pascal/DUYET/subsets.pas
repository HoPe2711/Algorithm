uses math;
var n,l,dem,dem1:longint;
    res:int64;
    a:array[0..20] of longint;
    f,f1,dd,dd1:array[0..1000000] of longint;
    free:array[0..1200,0..1200] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 l:=n div 2;
end;
procedure duyet(i,tt,s:longint);
begin
 if i=l+1 then
  begin
   inc(dem);
   f[dem]:=s;
   dd[dem]:=tt;
  end
 else
  begin
   duyet(i+1,tt*2,s);
   duyet(i+1,tt*2+1,s+a[i]);
   duyet(i+1,tt*2+1,s-a[i]);
  end;
end;
procedure duyet1(i,tt,s:longint);
begin
 if i=n+1 then
   begin
    inc(dem1);
    f1[dem1]:=s;
    dd1[dem1]:=tt;
   end
 else
  begin
   duyet1(i+1,tt*2,s);
   duyet1(i+1,tt*2+1,s+a[i]);
   duyet1(i+1,tt*2+1,s-a[i]);
  end;
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=f1[random(r-l+1)+l];
    repeat
      while (f1[i] < key) do inc(i);
      while (f1[j] > key) do dec(j);
      if i <= j then
      Begin
      doicho(f1[i],f1[j]);
      doicho(dd1[i],dd1[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
Function Find(x,tt:longint):longint;
Var
  l,r,mid,kq,dau,cuoi,i:longint;
Begin
    dau:=dem1+1;
    cuoi:=0;
    kq:=0;
    l:=1;
    r:=dem1;
    while l <= r do
    Begin
      mid:=(l+r) div 2;
      if f1[mid]>=x  then
       begin
        dau:=min(mid,dau);
        r:=mid-1;
       end
      else l:=mid+1;
    End;
    if dau<>dem1+1 then
     begin
      l:=1;
      r:=dem1;
      while l <= r do
      Begin
       mid:=(l+r) div 2;
       if f1[mid]<=x  then
        begin
         cuoi:=max(cuoi,mid);
         l:=mid+1;
        end
       else r:=mid-1;
      End;
     end;
    if dau<>dem1+1 then
    for i:=dau to cuoi do
      if free[dd1[i],dd[tt]]=false then
       begin
        inc(kq);
        free[dd1[i],dd[tt]]:=true;
       end;
    exit(kq);
End;
procedure inkq;
var i:longint;
begin
 free[0,0]:=true;
 qsort(1,dem1);
 for i:=1 to dem do res:=res+find(f[i],i);
 write(res);
end;
begin
 assign(input,'subsets.inp');reset(input);
 assign(output,'subsets.out');rewrite(output);
 nhap;
 duyet(1,0,0);
 duyet1(l+1,0,0);
 inkq;
 close(input);close(output);
end.
