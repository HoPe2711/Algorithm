uses math;
var m,n,d,t,l,r,tt,x,y:longint;
    canh,res:int64;
procedure nhap;
begin
 read(m,n);
 read(x,y);
 t:=x-1;
 d:=m-x;
 l:=y-1;
 r:=n-y;
 tt:=min(min(t,d),min(l,r));
 canh:=tt*2+1;
 res:=int64(canh)*canh;
 if d>tt then
  begin
   res:=res+canh;
   if l>tt then
    begin
     res:=res+canh+1;
     if t>tt then res:=res+canh+1;
    end;
  end;
 write(res);
end;
begin
 assign(input,'mower.inp');reset(input);
 assign(output,'mower.out');rewrite(output);
 nhap;
 close(input); close(output);
end.