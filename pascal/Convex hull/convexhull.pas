uses math;
const oo=maxlongint;
type node=record
     x,y:longint;
end;
var n,top:longint;   res:int64;
    a:array[0..200000] of node;
    stack:array[0..200000] of longint;
procedure doicho(var x,y:node);
var tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i].x,a[i].y);
end;
function ccw(p,p1,p2:node):longint;
var a1,b1,a2,b2,t:int64;
begin
 a1:=p1.x-p.x;
 b1:=p1.y-p.y;
 a2:=p2.x-p.x;
 b2:=p2.y-p.y;
 t:=(a1*b2)-a2*b1;
 if t>0 then exit(1)
 else if t<0 then exit(-1);
 exit(0);
end;
function ss(p,p1,p2:node):longint;
var ans:longint;
begin
 ans:=ccw(p,p1,p2);
 if ans>0 then exit(1)
 else if (Ans=0) and ((p1.x<p2.x) or ((p1.x=p2.x) and (p1.y<p2.y))) then exit(1);
 exit(0);
end;
procedure qsort(l,r:longint);
var  i,j:longint; mid:node;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while ss(a[1],a[i],mid)=1 do inc(i);
  while ss(a[1],mid,a[j])=1 do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
function tich(u,v:node):int64;
begin
 exit(int64(u.x)*v.y-int64(u.y)*v.x);
end;
procedure xuli;
var  i,c,c1,kq:longint;  tmp:int64;
begin
 c:=oo;
 for i:=1 to n do
  if a[i].y<c then
   begin
    kq:=i;  c:=a[i].y;  c1:=a[i].x;
   end
  else if (a[i].y=c) and (a[i].x<c1) then
   begin
    kq:=i; c1:=a[i].x;
   end;
 doicho(a[1],a[kq]);
 qsort(2,n);
 a[n+1]:=a[1];
 top:=2; stack[1]:=1; stack[2]:=2;
 for i:=3 to n+1 do
  begin
   while (top>1) and (ccw(a[stack[top-1]],a[stack[top]],a[i])<>1) do dec(top);
   inc(top); stack[top]:=i;
  end;
 writeln(top-1);
 for i:=1 to top-1 do
  begin
        res:=res+tich(a[stack[i]],a[stack[i+1]]);
  end;
 //res:=res/2;
 res:=abs(res);
 if res mod 2=1 then
  begin
   tmp:=res div 2;
   writeln(tmp,'.5')
  end
  else
   begin
    tmp:=res div 2;
    writeln(tmp,'.0');
   end;
 //writeln(Res);
 for i:=1 to top-1 do writeln(a[stack[i]].x,' ',a[stack[i]].y);
end;
begin
 assign(input,'convexhull.inp');reset(input);
 assign(output,'convexhull.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
