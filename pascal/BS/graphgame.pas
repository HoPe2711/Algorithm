uses math;
var n,p,kq,kq1,res:longint;
    dem,deg,a,sum,b,d,s:array[0..500000] of longint;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint; mid:longint;
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
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i,j:longint;
begin
 read(p);
 read(n);
 for i:=1 to n do
  begin
   read(dem[i]);
   for j:=1 to dem[i] do read(a[sum[i-1]+j]);
   sum[i]:=sum[i-1]+dem[i];
   qsort(sum[i-1]+1,dem[i]+sum[i-1]);
  end;
end;
function find(l,r,x:longint):longint;
var mid:longint;
begin
// kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if a[mid]=x then exit(mid);
   if a[mid]>x then r:=mid-1
   else l:=mid+1;
  end;
 exit(0);
end;
procedure xuli;
var i,j,tmp,tg:longint;
begin
 for i:=1 to n do
  begin
   for j:=1 to dem[i] do
    begin
     tg:=a[sum[i-1]+j];
     tmp:=find(sum[tg-1]+1,sum[tg-1]+dem[tg],i);
     if tmp=0 then
      begin
       inc(deg[i]);  inc(deg[tg]);
      end;
    end;
  end;
 for i:=1 to n do
  if res<deg[i] then
   begin
    res:=deg[i];
    kq:=i;
   end;
 if p=1 then write(kq);
end;
procedure xuli1;
var i,j,tmp,tg:longint;
begin
 b:=a;
 for i:=1 to n do
  begin
   d[i]:=dem[i];
   for j:=1 to dem[i] do
    if b[sum[i-1]+j]=kq then
     begin
      d[i]:=dem[i]-1;
      doicho(b[sum[i-1]+j],b[sum[i-1]+dem[i]]);
     end;
   for j:=1 to d[i] do a[s[i-1]+j]:=b[sum[i-1]+j];
   s[i]:=s[i-1]+d[i];
   qsort(s[i-1]+1,s[i-1]+d[i]);
  end;
 fillchar(deg,sizeof(Deg),0);
 for i:=1 to n do
  begin
   if i=kq then continue;
   for j:=1 to d[i] do
    begin
     tg:=a[s[i-1]+j];
     tmp:=find(s[tg-1]+1,s[tg-1]+d[tg],i);
     if tmp=0 then
      begin
       inc(deg[i]);
       inc(deg[tg]);
      end;
    end;
  end;
 res:=0;
 for i:=1 to n do
  if (res<deg[i]) and (i<>kq) then
   begin
    res:=deg[i];
    kq1:=i;
   end;
 write(min(kq,kq1),' ',max(kq,kq1));
end;
begin
 assign(input,'graphgame.inp');reset(input);
 assign(output,'graphgame.out');rewrite(output);
 nhap;
 xuli;
 if p=2 then xuli1;
 close(input); close(output);
end.
