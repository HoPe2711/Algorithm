uses math;
var
    s,x1,x2,t1,t2,p,d,res:longint;
procedure nhap;
begin
 read(s,x1,x2);
 read(t1,t2);
 read(p,d);
end;
procedure xuli;
begin
 if x1<x2 then
  begin
   res:=(x2-x1)*t2;
   if d=1 then
    begin
     if p<=x1 then res:=min(res,(x2-p)*t1)
     else res:=min(res,(2*s-p+x2)*t1);
    end
   else res:=min(res,(p+x2)*t1)
  end
 else
  begin
   res:=(x1-x2)*t2;
   if d=-1 then
    begin
     if p>=x1 then res:=min(res,(p-x2)*t1)
     else res:=min(Res,(p+2*s-x2)*t1);
    end
   else res:=min(res,(2*s-p-x2)*t1);
  end;
 writeln(res);
end;
begin
 //assign(input,'c746.inp');reset(input);
 nhap;
 xuli;
 //close(input);
end.