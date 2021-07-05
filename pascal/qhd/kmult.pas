var a:array[0..10000] of longint;
    f,trace,trace1:Array[0..10000,-100..100] of longint;
    n,k,dem:longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
procedure truyvet(i,x:longint);
begin
 if (i=1) then exit;
 truyvet(i-1,trace[i,x]);
 if trace1[i,x]=1 then write('+') else write('-');
end;
procedure xuli;
var i,j,kq:longint;
begin
 f[1,a[1] mod k]:=1;
 for i:=1 to n-1 do
  for j:=-k+1 to k-1 do
   begin
    if f[i,j]<>0 then
     begin
      f[i+1,(j+a[i+1] mod k+k) mod k]:=i+1;
      trace[i+1,(j+a[i+1] mod k+k) mod k]:=j;
      trace1[i+1,(j+a[i+1] mod k+k) mod k]:=1;
      f[i+1,(j-a[i+1] mod k+k) mod k]:=i+1;
      trace[i+1,(j-a[i+1] mod k+k) mod k]:=j;
      trace1[i+1,(j-a[i+1] mod k+k) mod k]:=0;
     end;
   end;
 if f[n,0]=0 then write(0)
 else
  begin
   writeln(1);
   truyvet(n,0);
  end;
end;
BEGIN
  assign(input,'kmult.inp');reset(input);
  assign(output,'kmult.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.

{procedure inkq;
var i,res:longint;
begin
 res:=a[1];
 for i:=1 to n-1 do
  if x[i]=1 then res:=res+a[i+1]
  else res:=res-a[i+1];
 if res mod k=0 then
  begin
    writeln(1);
    for i:=1 to n-1 do
     if x[i]=1 then write('+')
     else write('-');
    halt;
  end;
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=n then inkq
 else
  for j:=0 to 1 do
   begin
    x[i]:=j;
    duyet(i+1);
   end;
end;    }
