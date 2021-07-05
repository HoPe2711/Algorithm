var  a,b,c,tmp,i:longint;
begin
 read(a,b,c);
 a:=a-a div b *b;
 for i:=1 to b do
  begin
   a:=a*10;
   tmp:=a div b;
   a:=a-tmp*b;
   if tmp=c then
    begin
     write(i);
     exit;
    end;
  end;
 write(-1);
end.