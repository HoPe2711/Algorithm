uses math;
var n,maxc,mina:longint;
    d,res,k:int64;
    a,b,ngay,d1:array[0..100000] of longint;
procedure nhap;
var i:longint;
    sum,sum1:int64;
begin
 mina:=1000000000;
 read(n,d);
 sum:=0;
 sum1:=0;
 for i:=1 to n do
  begin
   read(a[i],b[i]);
   sum:=sum+a[i];
   sum1:=sum1+b[i];
   maxc:=max(maxc,b[i]);
   mina:=min(mina,a[i]);
  end;
 k:=d-sum;
 if d<sum then
  begin
   write(-1);
   halt;
  end;
 if d>sum1 then
  begin
   write(-1);
   halt;
  end;
end;
function Align(delta:int64):int64;//luong nuoc them vao khi moc = delta
var i,add1:longint;
    res:int64;
begin
 res:=0;
 for i:=1 to n do
  begin
   add1:=min(delta-a[i],b[i]-a[i]);
   if add1>0 then res:=res+add1;
  end;
 exit(res);
end;
procedure xuli;
var l,r,mid:int64;
begin
 l:=mina;
 r:=maxc;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if align(mid)<=k then
    begin
     res:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
end;
procedure inkq;
var i,dem:longint;
begin
 dem:=0;
 k:=k-align(res);
 for i:=1 to n do
  if b[i]<=res then ngay[i]:=b[i]
  else if a[i]>res then ngay[i]:=a[i]
  else
     begin
      ngay[i]:=res;
      inc(dem);
      d1[dem]:=i;
     end;
 i:=0;
 while (k>0) and (i<dem) do
  begin
   inc(i);
   inc(ngay[d1[i]]);
   dec(k);
  end;
 for i:=1 to n do write(ngay[i],' ');
end;
begin
 assign(input,'schedule.inp') ; reset(input) ;
 assign(output,'schedule.out') ; rewrite(output) ;
 nhap;
 xuli;
 inkq;
 close(input) ; close(output) ;
end.
