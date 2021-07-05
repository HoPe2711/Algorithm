{$H+}
var n:longint;
    st:string;
procedure nhap;
var i,ct,tt,hh:longint;   ok:boolean;
begin
 readln(n);
 readln(st);        ct:=1;  tt:=1;
 while length(st)>1 do
  begin
   ok:=false;
   for i:=tt to length(st) do
    if st[i]<>st[ct] then
     begin
      ok:=true;
      hh:=i;     tt:=i;
      break;
     end;
   if ok=false then
    for i:=1 to ct-1 do
     if st[i]<>st[ct] then
      begin
       ok:=true;  tt:=i;
       hh:=i; break;
      end;
   if ok=false then break
   else delete(st,hh,1);
   if hh>ct then
     begin
      ct:=ct+1;
      if ct>length(st) then ct:=1;
     end
   else if ct>length(st) then ct:=1;
   if tt>length(st) then tt:=1;
  // ct:=ct+1;
   //if ct>length(st) then ct:=1;
  end;
 writeln(st[1]);
end;
begin
 //assign(input,'c749.inp');reset(input);
 nhap;
 //close(input);
end.

