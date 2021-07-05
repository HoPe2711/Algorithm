uses math;
type arr=array[0..100001] of longint;
const oo=high(int64) div 2;
      o=maxlongint;
var a,b,c,pos,lab:array[0..100001] of longint;
    ke,next,head,ts,tt,tt1:array[-500000..500000] of longint;
    d:array[0..100001] of int64;
    free:array[0..100001] of boolean;
    n:longint;   res:int64;
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
 read(n);
 a[0]:=-o; a[n+1]:=o;  b[0]:=-o; b[n+1]:=o; c[0]:=-o; c[n+1]:=o;
 for i:=1 to n do
  begin
   read(a[i],b[i],c[i]);
   pos[i]:=i;
  end;
end;

function gettrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=gettrout(lab[u]);
 exit(lab[u]);
end;
procedure qsort(var x,y,z:arr;l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=x[l+random(r-l+1)];
 repeat
  while x[i]<mid do inc(i);
  while x[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(x[i],x[j]);
    doicho(y[i],y[j]);
    doicho(z[i],z[j]);
    doicho(pos[i],pos[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(x,y,z,i,r);
 if l<j then qsort(x,y,z,l,j);
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
 procedure qsort1(l,r:longint);
 var i,j,mid:longint;
 begin
  i:=l;
  j:=r;
  mid:=ts[l+random(r-l+1)];
  repeat
   while ts[i]<mid do inc(i);
   while ts[j]>mid do dec(j);
   if i<=j then
    begin
     doicho(tt[i],tt[j]);
     doicho(tt1[i],tt1[j]);
     doicho(ts[i],ts[j]);
     inc(i); dec(j);
    end;
  until i>j;
  if i<r then qsort1(i,r);
  if l<J then qsort1(l,j);
 end;


procedure xuli;
var i,u,v,j,canh:longint;
begin
 qsort(a,b,c,1,n);   canh:=0;
 for i:=1 to n-1 do
  begin
   inc(canh);
   tt[canh]:=pos[i];
   tt1[canh]:=pos[i+1];
   ts[canh]:=abs(a[i+1]-a[i]);
  end;
 qsort(b,a,c,1,n);
 for i:=1 to n-1 do
  begin
   inc(canh);
   tt[canh]:=pos[i];
   tt1[canh]:=pos[i+1];
   ts[canh]:=abs(b[i+1]-b[i]);
  end;
 qsort(c,a,b,1,n);
 for i:=1 to n-1 do
  begin
   inc(canh);
   tt[canh]:=pos[i];
   tt1[canh]:=pos[i+1];
   ts[canh]:=abs(c[i+1]-c[i]);
  end;
 qsort1(1,canh);
 for i:=1 to canh do add(i,tt[i],tt1[i]);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to canh do
  begin
   u:=ke[i];
   v:=ke[-i];
   if gettrout(u)<>gettrout(v) then
    begin
     lab[lab[u]]:=lab[v];
     res:=res+ts[i];
    end;
  end;
 write(res);
end;
begin
// assign(input,'vnempire.inp'); reset(input);
// assign(output,'vnempire.out');rewrite(output);
 nhap;
 xuli;
// close(input); close(output);
end.