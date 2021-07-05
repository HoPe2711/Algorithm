uses math;
var n,m,res:longint;
    a,b,c,lab,ke,next,head:array[-10000..10000] of longint;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to m do read(a[i],b[i],c[i]);
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=c[l+random(r-l+1)];
 repeat
  while c[i]<mid do inc(i);
  while c[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    doicho(c[i],c[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
function gettrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=gettrout(lab[u]);
 exit(lab[u]);
end;
procedure xuli;
var i,u,v:longint;
begin
 qsort(1,m);
 for i:=1 to m do add(i,a[i],b[i]);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to m do
  begin
   u:=ke[i];
   v:=ke[-i];
   if gettrout(u)<>gettrout(v) then
    begin
     lab[lab[u]]:=lab[v];
     res:=max(res,c[i]);
    end;
  end;
 write(res);
end;
begin
 nhap;
 xuli;
end.