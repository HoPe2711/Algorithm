uses math;
var n,top,t,h:longint;
    stack,a,res:array[0..2000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 stack[0]:=0;   top:=0;
 for i:=1 to n do
  begin
   while (top>0) and (a[i]>=a[stack[top]]) do dec(top);
   res[i]:=i-stack[top];
   inc(top); stack[top]:=i;
  end;
 for i:=1 to n do write(res[i],' ');
 writeln;
End;
begin
 assign(input,'tower.inp');reset(input);
 assign(output,'tower.out');rewrite(output);
 read(t);
 for h:=1 to t do nhap;
 close(input); close(output);
end.