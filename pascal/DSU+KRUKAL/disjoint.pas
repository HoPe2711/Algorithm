var n,m:longint;
    lab:array[0..100000] of longint;
function gettrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=gettrout(lab[u]);
 exit(lab[u]);
end;
procedure nhap;
var  i,x,x1,y:longint;
begin
 read(n,m);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to m do
  begin
   read(x);
   if x=1 then
    begin
     read(x1,y);
     if gettrout(x1)<>gettrout(y) then lab[lab[x1]]:=lab[y];
    end
   else
    begin
     read(x1,y);
     if gettrout(x1)<>gettrout(y) then writeln('NO')
     else writeln('YES');
    end;
  end;
end;
begin
 assign(input,'disjoint.inp');reset(input);
 assign(output,'disjoint.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
