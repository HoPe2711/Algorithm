var p:longint;
    lab:array[0..50000] of longint;
function gettrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=gettrout(lab[u]);
 exit(lab[u]);
end;
procedure nhap;
var i,x,y,z:longint;
begin
 read(p);
 for i:=1 to p do lab[i]:=i;
 for i:=1 to p do
  begin
   read(x,y,z);
   if z=1 then
    if gettrout(x)<>gettrout(y) then  lab[lab[x]]:=lab[y];
   if z=2 then
    if gettrout(x)=gettrout(y) then writeln(1)
    else writeln(0);
  end;
end;
begin
 nhap;
end.