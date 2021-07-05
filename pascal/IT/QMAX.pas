uses math;
var p,n,m,u,v,k:longint;
    a,val:array[0..200000] of longint;
procedure update(s,l,r,i,x:longint);
var mid:longint;
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
 val[s]:=max(val[2*s],val[2*s+1]);
end;
function get(s,u,v,l,r:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u>=l) and (r>=v) then exit(val[s]);
 mid:=(u+v) div 2;
 exit(max(get(2*s,u,mid,l,r),get(2*s+1,mid+1,v,l,r)));
end;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,k);
   a[u]:=a[u]+k;
   a[v+1]:=a[v+1]-k;
  end;
 for i:=1 to n do a[i]:=a[i]+a[i-1];
 for i:=1 to n do update(1,1,n,i,a[i]);
 read(p);
 for i:=1 to p do
  begin
   read(u,v);
   writeln(get(1,1,n,u,v));
  end;
end;
begin
 nhap;
end.
