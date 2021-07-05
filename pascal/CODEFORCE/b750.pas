{$H+}
var st,s,huong:string;   n:longint;
procedure nhap;
var i,tt,j,point:longint; x:longint;
begin
 readln(n);   point:=0;
 for i:=1 to n do
  begin
   readln(st);
   s:='';   tt:=0;  x:=0;
   for j:=1 to length(st) do
   if st[j]=' ' then
    begin
     val(s,x);
     tt:=j;
     break;
    end
   else  s:=s+st[j];
   inc(tt);  huong:='';
   while (st[tt]<>' ')  do
    begin
     huong:=huong+st[tt];
     inc(tt);
     if tt>length(st) then break;
    end;
   if (point<0) or (point>20000) then
    begin
     write('NO');
     exit;
    end
   else
   if (point=0) then
    begin
     if huong='South' then point:=point+x
     else
      begin
       write('NO');
       exit;
      end;
    end
   else
   if (point=20000) then
    begin
     if huong='North' then point:=point-x
     else
      begin
       write('NO');
       exit;
      end;
    end
   else
    begin
     if huong='South' then point:=point+x;
     if huong='North' then point:=point-x;
    end;
  end;
 if (point=0) then write('YES')
 else write('NO');
end;
begin
 //assign(input,'b750.inp');reset(input);
 nhap;
 //close(input);
end.