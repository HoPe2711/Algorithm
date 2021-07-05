var a,stack,l,r,l1,r1:Array[0..1000001] of longint;
    f,g:array[0..1000001] of int64;
    res:int64;
    n,top:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
procedure timlmin;
var top,j:longint;
begin
 top:=0;
 fillchar(stack,sizeof(stack),0);
 stack[0]:=0;
 for j:=1 to n do
  begin
   while (top>0) and (a[j]<=a[stack[top]]) do dec(top);
   l[j]:=stack[top]+1;
   inc(top);
   stack[top]:=j;
  end;
end;
procedure timrmin;
var top,j:longint;
begin
 top:=0;
 fillchar(stack,sizeof(stack),0);
 stack[0]:=n+1;
 for j:=n downto 1 do
  begin
   while (top>0) and (a[j]<a[stack[top]]) do dec(top);
   r[j]:=stack[top]-1;
   inc(top);
   stack[top]:=j;
  end;
end;
procedure timlmax;
var top,j:longint;
begin
 top:=0;
 fillchar(stack,sizeof(stack),0);
 stack[0]:=0;
 for j:=1 to n do
  begin
   while (top>0) and (a[j]>=a[stack[top]]) do dec(top);
   l1[j]:=stack[top]+1;
   inc(top);
   stack[top]:=j;
  end;
end;
procedure timrmax;
var top,j:longint;
begin
 top:=0;
 fillchar(stack,sizeof(stack),0);
 stack[0]:=n+1;
 for j:=n downto 1 do
  begin
   while (top>0) and (a[j]>a[stack[top]]) do dec(top);
   r1[j]:=stack[top]-1;
   inc(top);
   stack[top]:=j;
  end;
end;
procedure xuli;
var i:longint;
begin
 timlmin;
 timrmin;
 for i:=1 to n do g[i]:=(i-l[i]+1)*(r[i]-i+1);
 timlmax;
 timrmax;
 for i:=1 to n do f[i]:=(i-l1[i]+1)*(r1[i]-i+1);
 for i:=1 to n do res:=res+(f[i]-g[i])*a[i];
 write(res);
end;
begin
 assign(input,'weight.inp');reset(input);
 assign(output,'weight.out');rewrite(output);
 nhap;
 xuli;
 close(input);close(output);
end.
