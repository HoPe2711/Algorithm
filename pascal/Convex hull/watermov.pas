uses math;
type node=record
     x:longint;  y:int64;
end;
var  n,top:longint;
     res,res1:int64;
     b:array[0..2000000] of node;
     stack:array[0..2000000] of longint;
function ccw(p,p1,p2:node):longint;
var a1,b1,a2,b2,t:int64;
begin
 a1:=p1.x-p.x;
 b1:=p1.y-p.y;
 a2:=p2.x-p.x;
 b2:=p2.y-p.y;
 t:=a1*b2-a2*b1;
 if t>0 then exit(1);
 if t<0 then exit(-1);
 exit(0);
end;
procedure nhap;
var i,x:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(x);
   b[i].x:=i;
   b[i].y:=b[i-1].y+x;
   res:=res+(b[i].y+b[i-1].y);
  end;
end;
procedure xuli;
var  i:longint;
begin
 top:=2; stack[1]:=0; stack[2]:=1;
 for i:=2 to n do
  begin
   while (top>1) and (ccw(b[stack[top-1]],b[stack[top]],b[i])=-1) do dec(top);
   inc(top);
   stack[top]:=i;
  end;
 for i:=1 to top do
  begin
   res1:=res1+(b[stack[i]].y+b[stack[i-1]].y)*(b[stack[i]].x-b[stack[i-1]].x);
  end;
 res:=res-res1;
 if res mod 2=1 then write(res div 2,'.5')
 else write(res div 2,'.0');
end;
begin
 assign(input,'watermov.inp');reset(input);
 assign(output,'watermov.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.