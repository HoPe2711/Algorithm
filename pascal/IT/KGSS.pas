uses math;
type
 node=record
 v1,v2:longint;
 end;
var n,k,u,v:longint;
    t:node;
    ch:char;
    a:array[1..100000] of longint;
    val:array[1..400000] of node;
    null:node;
function join(n1,n2:node):node;
begin
 join.v1:=max(n1.v1,n2.v1);
 join.v2:=max(min(n1.v1,n2.v1),max(n1.v2,n2.v2));
end;
procedure update(s,l,r,i,x:longint);
var mid:longint;
begin
 if (i<l) or (i>r) then exit;
 if l=r then
  begin
   val[s].v1:=x;
   val[s].v2:=0;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=join(val[2*s],val[2*s+1]);
end;
function get(s,u,v,l,r:longint):node;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(null);
 if (u>=l) and (r>=v) then exit(val[s]);
 mid:=(u+v) div 2;
 exit(join(get(2*s,u,mid,l,r),get(2*s+1,mid+1,v,l,r)));
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   update(1,1,n,i,a[i]);
  end;
 null.v1:=0;
 null.v2:=0;
 readln(k);
 for i:=1 to k do
  begin
   readln(ch,u,v);
   if ch='U' then update(1,1,n,u,v);
   if ch='Q' then
    begin
     t:=get(1,1,n,u,v);
     writeln(t.v1+t.v2);
    end;
  end;
end;
begin
 assign(input,'KGSS.inp');
 reset(input);
 nhap;
 close(input);
end.