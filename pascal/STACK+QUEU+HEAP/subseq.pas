uses math;
var n,top,res:longint;
    a,stack,r,l:Array[0..2000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(A[i]);
 top:=0; stack[top]:=n+1;
 for i:=n downto 1 do
  begin
   while (top>0) and (a[i]<a[stack[top]]) do dec(top);
   r[i]:=stack[top];
   inc(top); stack[top]:=i;
  end;
 for i:=1 to n do
  if r[i]<>n+1 then res:=max(res,a[i] xor a[r[i]]);
 top:=0; stack[0]:=0;
 for i:=1 to n do
  begin
   while (top>0) and (a[i]<=a[stack[top]]) do dec(top);
   l[i]:=stack[top];
   inc(top); stack[top]:=i;
  end;
 for i:=1 to n do
  if l[i]<>0 then res:=max(res,a[i] xor a[l[i]]);
 write(reS);
end;
begin
 assign(input,'subseq.inp');reset(input);
 assign(output,'subseq.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
