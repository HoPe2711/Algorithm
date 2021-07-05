uses math;
var dem,free:array[0..500000] of longint;
    a:array[0..500000,0..5] of longint;
    n:longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(dem[i]);
   for j:=1 to dem[i] do read(A[i,j]);
  end;
end;
procedure xuli;
var stop:boolean;
    i,ok,j:longint;
begin
 for i:=1 to n div 2 do free[i]:=1;
// for i:=n div 2+1 to n do free[i]:=2;
 stop:=false;
 while not(stop) do
  begin
   stop:=true;
   for i:=1 to n do
   begin
    ok:=0;
    for j:=1 to dem[i] do
     if free[i]=free[a[i,j]] then inc(ok);
    if ok>=2 then
     begin
      free[i]:=1-free[i];
      stop:=false;
     end;
   end;
  end;
 writeln('YES');
 for i:=1 to n do
  if free[i]=0 then write(i,' ');
 writeln;
 for i:=1 to n do
  if free[i]=1 then write(i,' ')
end;
begin
 assign(input,'groupdiv.inp');reset(input);
 assign(output,'groupdiv.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(outpuT);
end.