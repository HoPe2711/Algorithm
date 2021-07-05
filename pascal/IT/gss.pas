uses math;
type node=record
     tong,first,last,all:longint;
end;
const oo=1000000000;
var n,m:longint;
    sum:array[0..200000] of longint;
    val:array[0..200000] of node;
function ss(x,y:node):node;
begin
 ss.tong:=x.tong+y.tong;
 ss.first:=max(x.first,x.tong+y.first);
 ss.last:=max(y.last,y.tong+x.last);
 ss.all:=max(max(x.all,y.all),x.last+y.first);
end;
procedure update(s,l,r,i,x:longint);
var mid:longint;
begin
 if (i<l) or (i>r) then exit;
 if l=r then
  begin
   val[s].tong:=x;
   val[s].first:=x;
   val[s].last:=x;
   val[s].all:=x;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=ss(val[2*s],val[2*s+1]);
end;
function get(s,l,r,u,v:longint):node;
var mid:longint;
begin
 if (l>v) or (r<u) then
  begin
   get.tong:=0;
   get.first:=-oo;
   get.last:=-oo;
   get.all:=-oo;
   exit;
  end;
 if (l>=u) and (r<=v) then exit(val[s]);
 mid:=(l+r) div 2;
 exit(ss(get(2*s,l,mid,u,v),get(2*s+1,mid+1,r,u,v)));
end;
procedure nhap;
var i,x,y,a:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a);
   update(1,1,n,i,a);
  end;

  read(m);
 for i:=1 to m do
  begin
   read(x,y);
   writeln(get(1,1,n,x,y).all);
  end;
end;
begin
 //assign(input,'gss.inp');reset(input);
 nhap;
 //close(input);
end.
