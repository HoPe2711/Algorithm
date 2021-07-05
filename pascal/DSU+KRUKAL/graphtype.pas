uses math;
var n,m,res,canh:longint;
    lab,lab1,u,v,t:array[0..50000] of longint;
function getrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=getrout(lab[u]);
 exit(lab[u]);
end;
procedure nhap;
var i,p,q:longint;
begin
 read(n,m);
 for i:=1 to m do read(u[i],v[i],t[i]);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to m do
  if t[i]=3 then
   begin
    p:=u[i]; q:=v[i];
    if getrout(p)<>getrout(q) then
     begin
      lab[lab[p]]:=lab[q];
      inc(canh);
     end;
   end;
 res:=canh;
end;
procedure xuli(ts:longint);
var i,p,q,canh1:longint;
begin
 canh1:=canh;
 lab1:=lab;
 for i:=1 to m do
  if t[i]=ts then
   begin
    p:=u[i]; q:=v[i];
    if getrout(p)<>getrout(q) then
     begin
      lab[lab[p]]:=lab[q];
      inc(canh1);
     end;
   end;
 lab:=lab1;
 if (canh1<>n-1) then
  begin
   write(-1); halt;
  end
 else res:=res+canh1-canh;
end;
begin
 assign(input,'graphtype.inp');reset(input);
 assign(output,'graphtype.out');rewrite(output);
 nhap;
 xuli(1);
 xuli(2);
 write(m-Res);
 close(input); close(output);
end.