var  n,t,rear,front:longint;
     res,h,s,d:int64;
     a,q,b,c:array[0..1000000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 read(h,s,d);
 for i:=1 to n do read(a[i]);
 t:=(h+d) div s;
end;
procedure push(x:longint);
begin
 while (front <= rear) and (a[q[rear]] < a[x]) do Dec(rear);
 Inc(rear);
 q[rear] := x;
end;
procedure xuli;
var i:longint;
begin
 front:=1;
 rear:=0;
 b[1]:=a[1];
 b[n]:=a[n];
 for i:=2 to t+1 do
  begin
   if i>n then break;
   push(i);
  end;
 for i:=t+2 to n+t-1 do
  begin
   push(i);
   if q[front]+t+1<=i then inc(front);
   c[i-t]:=a[q[front]];
  end;
 for i:=2 to n-1 do
  if  a[i]>=b[i-1] then b[i]:=a[i]
  else
    if c[i]<b[i-1] then b[i]:=b[i-1]-(b[i-1]-c[i])
    else b[i]:=b[i-1];
end;
procedure inkq;
var i:longint;
begin
 res:=b[1]*h;
 for i:=2 to n do
  begin
   res:=res+b[i-1]*s;
   if b[i]>=b[i-1] then res:=res+(b[i]-b[i-1])*h;
   if b[i]<b[i-1] then res:=res+(b[i-1]-b[i])*d;
  end;
 res:=res+b[n]*s+b[n]*d;
 writeln(res);
 for i:=1 to n do write(b[i],' ');
end;
begin
 assign(input,'project.inp');reset(input);
 assign(output,'project.out');rewrite(output);
 nhap;
 xuli;
 inkq;
 close(input);
 close(output);
end.

