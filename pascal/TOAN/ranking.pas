var  n:longint;
     t,a:array[0..1000000] of longint;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do read(t[i]);
end;
procedure xuli;
var i,first,j:longint;
begin
 a[n]:=n; first:=n;
 for i:=n-1 downto 1 do
  begin
   dec(first);
   for j:=first to first+t[i] do a[j]:=a[j+1];
   a[first+t[i]]:=i;
  end;
 for i:=1 to n do writeln(a[i]);
end;
begin
 assign(input,'ranking.inp');reset(input);
 assign(output,'ranking.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.