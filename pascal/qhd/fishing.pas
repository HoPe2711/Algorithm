uses math;
var n,h,z:longint;
    f,g,trace:array[0..26,-5000..200] of int64;
    a,b,t:array[0..26] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 if n=0 then halt;
 read(h);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do read(b[i]);
 for i:=1 to n-1 do read(t[i]);
 fillchar(g,sizeof(g),0);
 fillchar(f,sizeof(f),0);
 fillchar(trace,sizeof(trace),0);
 h:=h*60 div 5;
 for i:=1 to n do
  for j:=1 to h do
   if a[i]-b[i]*(j-1)>=0 then g[i,j]:=g[i,j-1]+a[i]-b[i]*(j-1)
   else g[i,j]:=g[i,j-1];
end;
procedure truyvet(i,j:longint);
begin
 if i=n+1 then exit;
 if j<=0 then
  begin
   write(0,' ');
   truyvet(i+1,0);
  end
 else
  begin
   write(trace[i,j]*5,' ');
   truyvet(i+1,j-trace[i,j]-t[i]);
  end;
end;
procedure xuli;
var i,j,k:longint;
begin
 for i:=n downto 1 do
  for j:=1 to h-t[i-1] do
   for k:=0 to j do
    begin
      if f[i,j]<=g[i,k]+f[i+1,j-k-t[i]] then
       begin
         f[i,j]:=max(f[i,j],g[i,k]+f[i+1,j-k-t[i]]);
         trace[i,j]:=k;
       end;
     end;
end;
procedure inkq;
var i,j:longint;
begin
 writeln(f[1,h]);
 truyvet(1,h);
 writeln;
end;
begin
 assign(input,'fishing.inp');reset(input);
 assign(output,'fishing.out');rewrite(output);
 while not seekeof do
  begin
   nhap;
   xuli;
   inkq;
  end;
 read(z);
 close(input);close(output);
end.
