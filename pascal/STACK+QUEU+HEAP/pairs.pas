var  a,stack:array[0..2000000] of longint;
     n,res:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var top,j,i:longint;
begin
 top:=0;
 stack[0]:=0;
 for j:=1 to n do
  begin
   while (top>0) and (a[j]>a[stack[top]]) do
    begin
     inc(res);
     dec(top);
    end;
   if top>0 then inc(res);
   while (top>0) and (a[j]=a[stack[top]]) do dec(top);
   inc(top);
   stack[top]:=j;
  end;
 write(Res);
end;
begin
 assign(input,'pairs.inp');reset(input);
 assign(output,'pairs.out');rewrite(output);
 nhap;
 xuli;
 close(input);close(output);
end.
