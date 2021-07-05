var m,n,res:longint;
procedure nhap;
var i,j,tong:longint;
begin
 read(m);
 for i:=1 to m do
  begin
   read(n);     tong:=n; res:=0;
   for j:=2 to n do
    if tong>=j then
     begin
      tong:=tong-j;
      inc(res);
     end
    else break;
   writeln(Res);
  end;
end;
begin
 assign(input,'parliament.inp');reset(input);
 assign(output,'parliament.out');rewrite(output);
 nhap;
 //xuli;
 close(input); close(output);
end.
