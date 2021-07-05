var n,k:longint;
procedure nhap;
begin
 read(n,k);
 if n mod 2=1 then
  begin
   if k>=n then write(n)
   else write(k+1);
  end
 else
  begin
   if k>=n div 2 then write(n div 2)
   else write(k+1);
  end
end;

begin
 assign(input,'party.inp');reset(input);
 assign(output,'party.out');rewrite(output);
 nhap;
 close(input); close(output);
end.