uses math;
const oo=1000000000;
var n,m,res,res1:longint;
    val,a:array[0..1200000] of longint;
procedure update(s,l,r,i,x:longint);
var  mid:longint;
begin
 if (i<l) or (i>r) then exit;
 if l=r then
  begin
   val[s]:=x;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=min(val[2*s],val[2*s+1]);
end;
function get(s,u,v,l,r:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(oo);
 if (u>=l) and (r>=v) then exit(val[s]);
 mid:=(u+v) div 2;
 exit(min(get(2*s,u,mid,l,r),get(2*s+1,mid+1,v,l,r)));
end;
procedure nhap;
var i,pp,x,y,tt,tt1,l:longint;
begin
 read(n,m);
 for i:=1 to 12*n do val[i]:=oo;
 for i:=1 to n do
  begin
   a[i]:=2*n-i+1;
   update(1,1,3*n,i,2*n-i+1);
  end;
 for i:=n+1 to 2*n do
  begin
   update(1,1,3*n,i,i-n);
   a[i]:=i-n;
   end;
 for i:=2*n+1 to 3*n do
   begin
    a[i]:=i-n;
    update(1,1,3*n,i,i-n);
   end;
 for i:=1 to m do
  begin
   read(pp);
   if pp=1 then
    begin
     read(x);
     update(1,1,3*n,x,oo);
     update(1,1,3*n,x+n,oo);
     update(1,1,3*n,x+2*n,oo);
    end
   else
    begin
     read(x,y);          tt:=oo; tt1:=oo; res:=oo;   res1:=oo;
     tt:=get(1,1,3*n,x+1,x+n);
     if tt<>oo then
      begin
       if tt>n then l:=2*n-tt+1
       else l:=tt+n;
       if tt>n then tt:=2*n-tt+1;
       if tt>=y then res:=(x+n-l)+min(tt-y,n-tt+y)
       else res:=(x+n-l)+min(y-tt,n-y+tt);
      end;
     tt1:=get(1,1,3*n,x+n,x+2*n-1);
     if tt1<>oo then
      begin
       l:=tt1+n;
       if tt1>n then tt1:=tt1-n;
       if tt1>=y then res1:=(l-(x+n))+min(tt1-y,n-tt1+y)
       else res1:=(l-(x+n))+min(y-tt1,n-y+tt1);
      end;
     writeln(min(res1,res));
    end;
  end;
end;
begin
 assign(input,'escalator.inp');reset(input);
 assign(output,'escalator.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
