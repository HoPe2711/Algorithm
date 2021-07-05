uses math;
var  a,stack,l,r,res:array[0..2000000] of longint;
     top,n,sum:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 top:=0;
 for i:=1 to n do
  begin
   while (top>0) and (a[i]>=a[stack[top]]) do dec(top);
   l[i]:=stack[top]+1;
   inc(top); stack[top]:=i;
  end;
 top:=0; stack[top]:=n+1;
 for i:=n downto 1 do
  begin
   while (top>0) and (a[i]>a[stack[top]]) do dec(top);
   r[i]:=stack[top];
   inc(top); stack[top]:=i;
  end;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
 if r[i]<>n+1 then res[r[i]-i+1]:=max(res[r[i]-i+1],i-l[i]+1);
 for i:=1 to n do sum:=sum+res[i];
 write(sum);
end;
begin
 assign(input,'fpair.inp');reset(inpuT);
 assign(output,'fpair.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.