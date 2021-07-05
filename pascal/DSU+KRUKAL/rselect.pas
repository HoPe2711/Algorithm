uses math;
var n,res,m:longint;
    ke,next,head,lab,ts,hailong,tungduong,a,u,v,c:array[-200{0000}..200{0000}] of longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,j,x:longint;
begin
 read(n);
 for i:=1 to n do
  for j:=1 to n do
   begin
    read(x);
    a[(i-1)*n+j]:=x;
   end;
 for i:=1 to n*n do
  begin
   if i mod n<>0 then
    begin
     inc(m); u[m]:=i; v[m]:=i+1; c[m]:=abs(a[i+1]-a[i]);
    end;
   if i+n<=n*n then
    begin
     inc(m); u[m]:=i; v[m]:=i+n; c[m]:=abs(a[i+n]-a[i]);
    end;
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l; j:=r; mid:=c[l+random(r-l+1)];
 repeat
  while c[i]<mid do inc(i);
  while c[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(c[i],c[j]);
    doicho(u[i],u[j]);
    doicho(v[i],v[j]);
    inc(i); dec(j);
   end;
 until i>j ;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function gettrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=gettrout(lab[u]);
 exit(lab[u]);
end;
procedure xuli;
var i,limit,p,q,j:longint;
begin
 qsort(1,m);
 for i:=1 to n*n do
  begin
   lab[i]:=i;  tungduong[i]:=1;
  end;
 limit:=-1;
 for i:=1 to m do add(i,u[i],v[i],c[i]);
 for i:=1 to m do
  begin
   if ts[i]<>limit then
    begin
     limit:=ts[i];
     for j:=1 to n do tungduong[j]:=1;
    end;
   p:=ke[i]; q:=ke[-i];
   if gettrout(p)<>gettrout(q) then
    begin
     inc(tungduong[lab[p]],tungduong[lab[q]]);
    // inc(hailong[lab[p]],hailong[lab[q]]);
     lab[lab[q]]:=lab[p];
     res:=max(res,tungduong[lab[p]]);
    end;
  end;
 write(res);
end;
begin
 assign(input,'rselect.inp');reset(input);
 assign(output,'rselect.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
