{$H+}
var st:string;
    bs,bd:array[0..100000] of char;
procedure no;
begin
 writeln('NO');
end;
procedure yes;
begin
 writeln('YES');
end;
procedure xuli;
var i,j,dem,dem1,n:longint;
begin
 n:=length(st);    j:=n;  dem:=0; dem1:=0;
 for i:=1 to n div 2 do
  begin
   if st[i]<>st[j] then
    begin
     inc(dem);
     bd[dem]:=st[i];
     inc(dem1);
     bs[dem1]:=st[j];
    end;
   dec(j);
  end;
 if dem=0 then
  begin
   yes;
   exit;
  end;
 if dem>=3 then
    begin
     no;
     exit;
    end;
 if dem=2 then
  begin
   if (bd[2]=bs[1]) and (bd[1]=bs[2]) then
    begin
     yes;
     exit;
    end;
   if (bd[1]=bd[2]) and (bs[1]=bs[2]) then
    begin
     yes;
     exit;
    end;
   no;
   exit;
  end;
 if n mod 2=0 then
  begin
     no;
     exit;
  end
 else
    begin
     if (bd[1]=st[n div 2+1]) then
      begin
       yes;
       exit;
      end;
     if (bs[1]=st[n div 2+1]) then
      begin
       yes;
       exit;
      end;
     no; exit;
    end;
end;
begin
 assign(input,'swapalin.inp');reset(input);
 assign(output,'swapalin.out');rewrite(output);
 while not seekeof do
  begin
   readln(st);
   xuli;
  end;
 close(input); close(output);
end.