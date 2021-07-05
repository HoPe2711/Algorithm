{$H+}
var st:string;
    n,res:longint;
procedure nhap;
var  i,j,t:longint;
     ok:boolean;
begin
 read(St);
 n:=length(st);
 for i:=1 to n do
 if n mod i=0 then
  begin
   t:=0; ok:=true;
   while t<=n do
   begin
    inc(t);
    j:=t;
    while j+i<=n do
     if st[j]=st[j+i] then j:=j+i
     else
      begin
       ok:=false;
       break;
      end;
    if ok=false then break;
   end;
   if ok=true then
    begin
     res:=i; break;
    end;
  end;
 write(res);
end;
begin
// assign(input,'a745.inp');reset(input);
// assign(output,'a745.out');rewrite(output);
 nhap;
// close(input); close(output);
end.
