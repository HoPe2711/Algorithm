{$Q-}
uses math;
type node=record
     x,y:int64;
end;
var q:array[0..200000] of int64;
    a:Array[0..200000] of node;
    stack,p:array[0..200000] of longint;
    n,m,top:longint;
    res:int64;
    trace:node;
procedure nhap;
var i,x:longint;
begin
 read(n,m);
 for i:=1 to n do
  begin
   read(x);
   q[i]:=q[i-1]+x;
   a[i].x:=q[i-1];
   a[i].y:=q[i];
  end;
 for i:=1 to m do read(p[i]);
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

function tich(u,v:node):int64;
begin
 exit(int64(u.x)*v.y-int64(u.y)*v.x);
end;
procedure xuli;
var  i:longint;
begin
 top:=2; stack[1]:=1; stack[2]:=2;
 for i:=3 to n do
  begin
   while (top>1) and (ccw(a[stack[top-1]],a[stack[top]],a[i])=1) do dec(top);
   inc(top); stack[top]:=i;
  end;
end;
procedure xuli1;
var i,l,r,mid:longint;  ans,delta,delta1:int64;
begin
 for i:=2 to m do
  begin
   trace.x:=p[i-1];
   trace.y:=p[i];
   ans:=tich(trace,a[stack[1]]);
   l:=2; r:=top;
   while l<=r do
    begin
     mid:=(l+r) div 2;
     delta:=tich(trace,a[stack[mid]]);
     delta1:=tich(trace,a[stack[mid-1]]);
     if delta>=delta1 then
      begin
       ans:=delta;
       l:=mid+1;
      end
     else r:=mid-1;
    end;
   res:=res+ans;
  end;
 write(Res+p[m]*q[n]);
end;
begin
 assign(input,'readers.inp');reset(input);
 assign(output,'readers.out');rewrite(output);
 nhap;
 xuli;
 xuli1;
 close(input); close(output);
end.
