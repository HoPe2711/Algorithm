uses math;
var n,m,r,maxx,k:longint;
    a,b,c,sum,free:array[0..200000] of longint;
    res,tp:int64;
    p:array[0..200000] of int64;
procedure nhap;
var i:longint;
begin
 read(n,m,r,k);
 maxx:=max(n,m);
 tp:=int64((n-r+1))*(m-r+1);
 for i:=1 to m-r+1 do
  begin
   inc(a[i]); dec(a[i+r]);
  end;
 for i:=1 to m do
  begin
   b[i]:=b[i-1]+a[i];
   inc(free[b[i]]);
  end;
 for i:=1 to maxx do
  begin
   sum[i]:=sum[i-1]+free[i];
   p[i]:=p[i-1]+int64(i)*free[i];
  end;
 fillchar(a,sizeof(A),0);
 for i:=1 to n-r+1 do
  begin
   inc(a[i]); dec(a[i+r]);
  end;
 for i:=1 to n do c[i]:=c[i-1]+a[i];
end;
function check(x:int64):boolean;
var  tg,i:longint;  tmp,kq:int64;
begin
 kq:=0;
 for i:=1 to n do
  begin
   if x mod c[i]<>0 then tg:=1 else tg:=0;
   tmp:=x div c[i]+ tg;
   if tmp<=maxx then
   kq:=kq+sum[maxx]-sum[tmp-1];
   if kq>=k then exit(true);
  end;
 exit(FalsE);
end;
procedure xuli;
var l,r,mid,tmp,tg:int64; i:longint;
begin
 l:=1; r:=10**10;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     tmp:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 for i:=1 to n do
  begin
   tg:=tmp div c[i]+1;
   if tg<=maxx then
   res:=res+(p[maxx]-p[tg-1])*c[i];
   if tg<=maxx then k:=k-(sum[maxx]-sum[tg-1]);
  end;
 res:=res+k*tmp;
 write(res/tp:0:9);
end;
begin
// assign(input,'d912.inp');reset(input);
 //assign(output,'d912.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.
