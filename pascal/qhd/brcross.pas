uses math;
const oo=10000000;
var n,k:longint;
    x,f,trace,trace1,kq:array[0..100001] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to k do read(x[i]);
end;
procedure xuli;
var i,tt,dem:longint;
begin
 x[k+1]:=n;  x[0]:=0;
 for i:=1 to k+1 do f[x[i]]:=oo;
 f[0]:=0;
 for i:=0 to k do
  begin
   if x[i]+1=x[i+1] then
    if  f[x[i+1]]>f[x[i]]+1 then
     begin
       f[x[i+1]]:=f[x[i]]+1;
       trace[x[i+1]]:=x[i];
       trace1[x[i+1]]:=1;
     end;
   if x[i]+2=x[i+1] then
     if  f[x[i+1]]>f[x[i]]+1 then
     begin
       f[x[i+1]]:=f[x[i]]+1;
       trace[x[i+1]]:=x[i];
       trace1[x[i+1]]:=2;
     end;
   if i+2<=k+1 then
   if x[i]+2=x[i+2] then
    if  f[x[i+2]]>f[x[i]]+1 then
     begin
       f[x[i+2]]:=f[x[i]]+1;
       trace[x[i+2]]:=x[i];
       trace1[x[i+2]]:=2;
     end;
  end;
 if f[n]=oo then
  begin
   write(-1);
   halt;
  end;
 writeln(f[n]);
 dem:=0;
 tt:=n;
 while tt<>0 do
  begin
   inc(dem);
   kq[dem]:=trace1[tt];
   tt:=trace[tt];
  end;
 for i:=dem downto 1 do write(kq[i]);
end;
begin
 assign(input,'brcross.inp');reset(input);
 assign(output,'brcross.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
