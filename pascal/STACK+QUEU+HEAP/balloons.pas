uses math;
const oo=1000000000;
var n,dem1:longint;
    x,r,kq:array[0..200000] of real;
    stack:array[0..200000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do  read(x[i],r[i]);
end;
function dis(x,y,x1,y1:real):real;
begin
 exit(sqrt(sqr(x-x1)+sqr(y-y1)));
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to n do kq[i]:=oo;
 kq[1]:=r[1];
 for i:=2 to n do
 begin
  dem1:=0;
  for j:=i-1 downto 1 do
   begin
    if dis(x[i],r[i],x[j],kq[j])<=r[i]+kq[j] then kq[i]:=min(sqr(x[i]-x[j])/(4*kq[j]),kq[i])
    else inc(dem1);
   end;
  if dem1=i-1 then kq[i]:=r[i];
 end;
 for i:=1 to n do writeln(kq[i]:0:3);
end;
procedure xuli2;
var i,top:longint;
    x1,r1:real;
begin
 for i:=1 to n do kq[i]:=r[i];
 stack[1]:=1; top:=1;
 for i:=2 to n do
  begin
   while top>0 do
    begin
     x1:=x[stack[top]];
     r1:=kq[stack[top]];
     kq[i]:=min(kq[i],sqr(x1-x[i])/(4*r1));
     if kq[i]>=r1 then dec(top)
     else break;
    end;
   inc(top);
   stack[top]:=i;
  end;
  for i:=1 to n do writeln(kq[i]:0:3);
end;
begin
// assign(input,'ba.inp');reset(input);
// assign(output,'ba.out');rewrite(output);
 nhap;
 if (n<=2000) then xuli
 else xuli2;
// close(input); close(output);
end.
