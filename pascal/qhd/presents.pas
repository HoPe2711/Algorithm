uses math;
const oo=1000000;
var a,b,res1,res2:array[0..500] of longint;
    f,trace,trace1:array[0..201,-40001..40001] of longint;
    n,dem1,dem2:longint;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do read(A[i]);
 for i:=1 to n do read(b[i]);
end;

procedure truyvet(i,j:longint);
begin
 if i=0 then exit;
 if j<trace1[i,j] then
  begin
   inc(dem2);
   res2[dem2]:=i;
  end;
 if j>trace1[i,j] then
  begin
   inc(dem1);
   res1[dem1]:=i;
  end;
 truyvet(trace[i,j],trace1[i,j]);
end;

procedure xuli;
var i,j,l,tmp:longint;
begin
 l:=40000;
 for i:=0 to n do
  for j:=-l to l do f[i,j]:=oo;
 f[0,0]:=0;
 for i:=0 to n-1 do
  for j:=-l to l do
   if f[i,j]<>oo then
    begin
     if f[i+1,j]>f[i,j] then
      begin
       f[i+1,j]:=f[i,j];
       trace[i+1,j]:=i;
       trace1[i+1,j]:=j;
      end;
     if j+a[i+1]<=l then
     if f[i+1,j+a[i+1]]>f[i,j]+b[i+1] then
      begin
       f[i+1,j+a[i+1]]:=f[i,j]+b[i+1];
       trace[i+1,j+a[i+1]]:=i;
       trace1[i+1,j+a[i+1]]:=j;
      end;
     if j-a[i+1]>=-l then
     if f[i+1,j-a[i+1]]>f[i,j]-b[i+1] then
      begin
       f[i+1,j-a[i+1]]:=f[i,j]-b[i+1];
       trace[i+1,j-a[i+1]]:=i;
       trace1[i+1,j-a[i+1]]:=j;
      end;
    end;
 tmp:=0;
 for j:=1 to l do
  if f[n,j]<0 then
   begin
    tmp:=j;
    break;
   end;
 if tmp=0 then
  begin
   writeln('NO');
   exit;
  end;
 truyvet(n,tmp);
 writeln('YES');
 write(dem1,' ');
 for i:=dem1 downto 1 do write(res1[i],' ');
 writeln;
 write(dem2,' ');
 for i:=dem2 downto 1 do write(res2[i],' ');
end;
begin
 assign(input,'presents.inp');reset(input);
 assign(output,'presents.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
