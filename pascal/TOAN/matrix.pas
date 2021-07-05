{$H+}
var st:String;
    k,n,ans,maxx:longint;
    a,sum:Array[0..5000] of longint;
    d:array[0..2000000] of qword;
    res,pp:qword;
procedure nhap;
var i,j:longint;
begin
 readln(k);
 readln(st);
 n:=length(st);
 maxx:=n*9;
 for i:=1 to n do
  begin
   a[i]:=ord(st[i])-48;
   sum[i]:=sum[i-1]+a[i];
  end;
 for i:=1 to n do
  for j:=i to n do inc(d[sum[j]-sum[i-1]]);
 for i:=0 to 1000000 do pp:=pp+d[i];
 for i:=1 to n do
  for j:=i to n do
   begin
    ans:=sum[j]-sum[i-1];
    if (k<>0) and (ans<>0) then
    if (k mod ans =0) and (k div ans<=maxx) then res:=res+d[k div ans];
    if (k=0) then
     begin
      if ans=0 then res:=res+ pp
      else res:=res+d[0];
     end;
   end;
 write(res);
end;
begin
 assign(input,'matrix.inp');reset(input);
 assign(output,'matrix.out');rewrite(output);
 nhap;
 close(input); closE(output);
end.