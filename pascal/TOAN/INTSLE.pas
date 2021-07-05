var n,i,a1,a2,b1,b2,c1,c2:longint;
function gcd(a,b:longint):longint;
begin
 if a=b then exit(a);
 if a*b=0 then exit(a+b);
 if a>b then exit(gcd(a-b,b));
 exit(gcd(a,b-a));
end;
procedure check(x,y,x1,y1:longint);
var res,res1:longint;
begin
 if (x=0) and (y=0) and (c1<>0) then
  begin
   writeln('NO SOLUTION');
   exit;
  end;
 if (x1=0) and (y1=0) and (c2<>0) then
  begin
   writeln('NO SOLUTION');
   exit;
  end;
 if (x=0) and (y=0) then
 begin
  if (x1=0) and (y1=0) then writeln('INFINITE')
  else
   begin
    res:=gcd(abs(a2),abs(b2));
    if c2 mod res=0 then writeln('INFINITE')
    else writeln('NO SOLUTION');
   end;
 end
 else
 if (x1=0) and (y1=0) then
 begin
  if (x=0) and (y=0) then writeln('INFINITE')
  else
   begin
    res:=gcd(abs(a1),abs(b1));
    if c1 mod res=0 then writeln('INFINITE')
    else writeln('NO SOLUTION');
   end;
  end
 else
  begin
   res:=gcd(abs(a1),abs(b1));
   res1:=gcd(abs(a2),abs(b2));
   if (c1 mod res=0) and (c2 mod res1=0) then  writeln('INFINITE')
   else writeln('NO SOLUTION');
  end;
end;
procedure xuli;
var D,D1,D2:longint;
begin
 read(a1,b1,c1,a2,b2,c2);
 D:=a1*b2-a2*b1;
 D1:=c1*b2-b1*c2;
 D2:=a1*c2-a2*c1;
 if D<>0 then
 begin
  if (D1 mod D=0) and (D2 mod D=0) then writeln(D1 div D,' ',D2 div D)
  else writeln('NO SOLUTION');
 end
 else if (D1=0) and (D2=0) then  check(a1,b1,a2,b2)
 else writeln('NO SOLUTION');
end;
begin
 assign(input,'INTSLE.inp');reset(input);
 assign(output,'INTSLE.out');rewrite(output);
 read(n);
 for i:=1 to n do xuli;
 close(input);close(output);
end.
