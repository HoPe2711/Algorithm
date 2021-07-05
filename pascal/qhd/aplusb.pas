{$H+}
uses math;
const base=1000000007;
var st:String;
    a:array[0..20000] of longint;
    f:array[0..10005,0..9,0..9,0..1] of longint;
    dd:array[0..100005,0..9,0..9,0..1] of boolean;
    n:longint;
function cal(i,trace,trace1,ok:longint):longint;
var j,k,okt:longint;
begin
 if dd[i,trace,trace1,ok] then exit(f[i,trace,trace1,ok]);
 dd[i,trace,trace1,ok]:=true;
 if i=n+1 then
  begin
   f[i,trace,trace1,ok]:=1;
   exit(1);
  end;
 if (i<>n) then
 begin
 for j:=0 to 9 do
  if (j<>trace) or (i=1) then
   for k:=0 to 9 do
    if (k<>trace1) or (i=1) then
      if (j+k+ok) mod 10=a[i] then
       begin
        if j+k+ok>=10 then okt:=1
        else okt:=0;
        f[i,trace,trace1,ok]:=(f[i,trace,trace1,ok]+cal(i+1,j,k,okt)) mod base;
       end;
  end
  else
   for j:=1 to 9 do
    if j<>trace then
     for k:=1 to 9 do
      if (k<>trace1) and ((j+k+ok)=a[i]) then f[i,trace,trace1,ok]:=(f[i,trace,trace1,ok]+cal(i+1,j,k,ok)) mod base;
 exit(f[i,trace,trace1,ok]);
end;
procedure nhap;
var i:longint;
begin
 readln(st);
 n:=length(St);
 for i:=length(st) downto 1 do a[n-i+1]:=ord(st[i])-48;
end;
begin
 assign(input,'aplusb.inp');reset(input);
 assign(output,'aplusb.out');rewrite(output);
 nhap;
 writeln(cal(1,0,0,0));
 close(input); close(output);
end.