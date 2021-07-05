{$H+}
uses math;
var st,stt:string;
    dd:Array[0..9] of longint;
    free:array[0..1000001] of longint;
    next:array[0..1000000,0..9] of longint;
    n,res,res1,dem:longint;
procedure nhap;
var i,j,last,ok:longint;
begin
 readln(st);
 n:=length(St);
 dem:=1;
 for i:=n downto 1 do
  begin
   ok:=0;
   free[i]:=dem;
   dd[ord(st[i])-48]:=1;
   for j:=0 to 9 do
    if dd[j]=0 then ok:=1;
   if ok=0 then
    begin
     inc(Dem);
     fillchar(dd,sizeof(dd),0);
    end;
  end;
 for j:=0 to 9 do
  begin
   last:=0;
   for i:=n downto 1 do
    begin
     if st[i]=chr(j+48) then last:=i;
     next[i,j]:=last;
    end;
   next[0,j]:=last;
  end;

end;
procedure xuli;
var  i,j,ok,latdot:longint;
begin
 fillchar(dd,sizeof(dd),0);  latdot:=0;
 for i:=1 to n do
 begin
  inc(dd[ord(st[i])-48]);
  if free[i]<>free[i+1] then
   begin
    for j:=1 to 9 do
     if dd[j]=0 then
      begin
       stt:=stt+chr(j+48);
       latdot:=next[0,j]+1;
       break;
      end;
    if stt='' then
     begin
      stt:=stt+'1';
      latdot:=next[0,1]+1;
     end;
    fillchar(dd,sizeof(dd),0);
    break;
   end;
 end;
 while latdot<>1 do
  begin
   for i:=latdot to n do
   begin
    inc(dd[ord(St[i])-48]);
    if free[i]<>free[i+1] then
     begin
      ok:=0;
      for j:=0 to 9 do
      if dd[j]=0 then
       begin
        stt:=stt+chr(j+48);
        latdot:=next[latdot,j]+1;
        ok:=1;
        break;
       end;
      if ok=0 then
       begin
        stt:=stt+'0';
        latdot:=next[latdot,0]+1;
       end;
      fillchar(dd,sizeof(dd),0);
      break;
     end;
   end;
  end;
 write(stt);
end;
begin
 assign(input,'number.inp');reset(input);
 assign(output,'number.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
