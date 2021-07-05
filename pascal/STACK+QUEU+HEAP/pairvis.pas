uses math;
var n,res,top,h:longint;
    a,stack,pos,s:array[1..500000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;

procedure xuli;
var i:longint;
begin
 top:=0;
 stack[0]:=0;
 for i:=1 to n do
  begin
   while (top>0) and (a[i]>=stack[top]) do
    begin
     dec(top);
     inc(res);
    end;
   inc(top);
   stack[top]:=a[i];
  end;
end;
BEGIN
  assign(input,'pairvis.inp');reset(input);
  assign(output,'pairvis.out');rewrite(output);
  nhap;
  xuli;
  writeln(res);
  close(input);close(output);
END.
