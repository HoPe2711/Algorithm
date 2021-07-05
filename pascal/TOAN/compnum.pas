uses math;
var l,r,res,res1,a:int64;
procedure nhap;
var i:longint;
begin
 read(l,r);
 dec(l);
 for i:=1 to 18 do
  begin
   a:=min(l div i,9*10**(i-1));
   res:=res+a;
   l:=l-a*i;
   if l<i then break;
  end;
  res:=res+ord(l>0);
 for i:=1 to 18 do
  begin
   a:=min(r div i,9*10**(i-1));
   res1:=res1+a;
   r:=r-a*i;
   if r<i then break;
  end;
 write(res1-res);
end;
begin
 assign(input,'compnum.inp');reset(input);
 assign(output,'compnum.out');rewrite(output);
 nhap;
 close(input); close(output);
end.


 {k:=9;
 for i:=1 to 17 do
  begin
   s[i]:=s[i-1]+k*i;
   k:=k*10;
  end;
 for i:=1 to 17 do
  if l<=s[i] then
   begin
    pp:=i;
    break;
   end;
 res:=(s[pp]-l+1) div pp;
 for i:=1 to 17 do
  if r<=s[i] then
   begin
    pp1:=i;
    break;
   end;
 res1:=(r-s[pp1-1]) div pp1;
 if pp<>pp1 then
  begin
   kq:=res+res1;
   for i:=pp+1 to pp1-1 do kq:=kq+9*int64(10)**(i-1);
   write(kq);
  end
 else }
