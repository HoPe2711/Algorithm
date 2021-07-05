uses math;
//const oo=1000000000;
type node=record
     x,y:longint;
end;
var m,n,dem:longint;
    res:array[0..100003] of real;
    pos:array[0..100003] of longint;
    t,b,q:array[0..100003] of node;
procedure nhap;
var i:longint;
begin
 read(m);
 for i:=1 to m do
  begin
   read(t[i].y);
   t[i].x:=i;
  end;
end;


function CCW(p1,p2,p3:node):longint;
var t,a1,a2,b1,b2:int64;
begin
 a1:=p2.x-p1.x;
 b1:=p2.y-p1.y;
 a2:=p3.x-p2.x;
 b2:=p3.y-p2.y;
 t:=int64(a1)*b2-a2*b1;
 if abs(t)=0 then exit(0)
 else if t<0 then exit(-1)
 else exit(1);
end;

procedure doicho(Var x,y:node);
var tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
function ss(p1,p2:node):boolean;
var c:longint;
begin
 c:=ccw(t[1],p1,p2);
 if c>0  then exit(true)
 else if (c=0) and ((p1.x<p2.x) or ((p1.x=p2.x) and (p1.y<p2.y))) then exit(true);
 exit(false);
end;
procedure qsort(l,r:longint);
var i,j:longint;    mid:node;
begin
 i:=l;
 j:=r;
 mid:=t[l+random(r-l+1)];
 repeat
  while ss(t[i],mid) do inc(i);
  while ss(mid,t[j]) do dec(j);
  if i<=j then
   begin
    doicho(t[i],t[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;

procedure qsort1(l,r:longint);
var i,j,mid,tg:longint;
begin
 i:=l;
 j:=r;
 mid:=q[l+random(r-l+1)].y;
 repeat
  while q[i].y<mid do inc(i);
  while q[j].y>mid do dec(j);
  if i<=j then
   begin
    doicho(q[i],q[j]);
    tg:=pos[i];
    pos[i]:=pos[j];
    pos[j]:=tg;
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;

procedure convex;
var i:longint;
begin
 t[m+1].x:=1; t[m+1].y:=0;
 doicho(t[1],t[m+1]);
 t[m+2].x:=m; t[m+2].y:=0;
 inc(m,2);
 qsort(2,m);
 dem:=2; b[1]:=t[1]; b[2]:=t[2];
 for i:=3 to m do
  begin
   while (dem>1) and (ccw(b[dem-1],b[dem],t[i])=-1) do dec(dem);
   inc(dem);
   b[dem]:=t[i];
  end;
end;

procedure xuli;
var  i,j:longint;
begin
 convex;
 read(n);
 for i:=1 to n do
  begin
   read(q[i].y);
   pos[i]:=i;
  end;
 qsort1(1,n);
 j:=dem;
 b[j+1]:=b[1];
 for i:=1 to n do
  begin
   while (j>1) and (Ccw(q[i],b[j],b[j-1])<>ccw(b[j+1],b[j],b[j-1])) do dec(j);
   res[pos[i]]:=b[j].x/(b[j].y-q[i].y);
  end;
 for i:=1 to n do writeln(res[i]:0:6);
end;
begin
 assign(input,'rider.inp');reset(input);
 assign(output,'rider.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
