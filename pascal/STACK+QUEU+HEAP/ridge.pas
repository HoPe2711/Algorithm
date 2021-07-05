uses math;
var n,t,top:longint;
    a,stack,l,r,f:array[0..200000] of longint;
    sum:array[0..200000] of int64;
    res:int64;
procedure nhap;
var i:longint;
begin
 read(n,t);
 for i:=1 to n do read(a[i]);
end;
procedure buildleft;
var i:longint;
begin
 top:=0;
 stack[top]:=0;
 for i:=1 to n do
  begin
   while (top>0) and (a[i]>a[stack[top]]) do dec(top);
   l[i]:=stack[top]+1;
   inc(top);
   stack[top]:=i;
  end;
end;
procedure buildright;
var i:longint;
begin
 top:=0;
 stack[top]:=n+1;
 for i:=n downto 1 do
  begin
   while (top>0) and (a[i]>a[stack[top]]) do dec(top);
   r[i]:=stack[top]-1;
   inc(top);
   stack[top]:=i;
  end;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  begin
   f[i]:=r[i]-l[i];
   sum[i]:=sum[i-1]+f[i];
  end;
 for i:=1 to n do
 if i+t-1<=n then res:=max(res,sum[i+t-1]-sum[i-1]);
 //else res:=max(res,sum[n]-sum[i-1]);
 write(res);
end;
begin
 assign(input,'ridge.inp');reset(input);
 assign(output,'ridge.out');rewrite(output);
 nhap;
 buildleft;
 buildright;
 xuli;
 close(input); close(output);
end.
