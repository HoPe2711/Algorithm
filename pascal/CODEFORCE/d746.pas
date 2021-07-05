{$H+}
var kta,ktb,n,k,a,b:longint;
   st:string;
procedure nhap;
var i:longint;
begin
 read(n,k,a,b);
 for i:=1 to n do
  begin
   if kta=k then
    begin
     if b>0 then
      begin
       st:=st+'B' ;
       kta:=0; ktb:=1;  dec(b);
      end
     else
      begin
       writeln('NO');
       halt;
      end;
    end
   else
    if ktb=k then
     begin
      if a>0 then
      begin
       st:=st+'G' ;
       kta:=1; ktb:=0;  dec(a);
      end
      else
      begin
       writeln('NO');
       halt;
      end;
     end
    else
     begin
      if b=0 then
       begin
        st:=st+'G';    ktb:=0; inc(kta); dec(a);
       end
      else if a=0 then
       begin
         st:=st+'B';
        kta:=0; inc(ktb); dec(b);
       end
      else
      if (a>b) then
       begin
        st:=st+'G';
        ktb:=0; inc(kta); dec(a);
       end
      else
       begin
        st:=st+'B';
        kta:=0; inc(ktb); dec(b);
       end;
     end;
  end;
 write(st);
end;
begin
 //assign(input,'d746.inp');reset(input);
 nhap;
// close(input);
end.