{$H+}
const base=1000000007;
var  st,st1:string;
     l,l1,k,k1,cc:longint;
     a,b:array[0..102] of longint;
     dd,dd1:array[0..102,0..1,0..9] of boolean;
     f,f1:array[0..102,0..1,0..9] of longint;
procedure nhap;
var i:longint;
begin
 readln(st);
 readln(st1);
 l:=length(st);
 l1:=length(st1);
 for i:=1 to l do a[i]:=ord(st[i])-48;
 for i:=1 to l-1 do
   if a[i+1]<a[i] then cc:=1;
 for i:=1 to l1 do b[i]:=ord(st1[i])-48;
end;
function cal(i,ok,tc:longint):longint;
var last,j,okt:longint;
begin
 if dd[i,ok,tc] then exit(f[i,ok,tc]);
 dd[i,ok,tc]:=true;
 if i=l+1 then
  begin
   f[i,ok,tc]:=1;
   exit(1);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
  begin
   if (ok=0) and (j=a[i]) then okt:=0
   else okt:=1;
   if j>=tc then f[i,ok,tc]:=(f[i,ok,tc]+cal(i+1,okt,j) mod base) mod base;
  end;
 exit(f[i,ok,tc]);
end;
function cal1(i,ok,tc:longint):longint;
var j,last,okt:longint;
begin
 if dd1[i,ok,tc] then exit(f1[i,ok,tc]);
 dd1[i,ok,tc]:=true;
 if i=l1+1 then
  begin
   f1[i,ok,tc]:=1;
   exit(1);
  end;
 if ok=0 then last:=b[i]
 else last:=9;
 for j:=0 to last do
  begin
   if (ok=0) and (j=b[i]) then okt:=0
   else okt:=1;
   if j>=tc then f1[i,ok,tc]:=(f1[i,ok,tc]+cal1(i+1,okt,j) mod base) mod base;
  end;
 exit(f1[i,ok,tc]);
end;
BEGIN
  assign(input,'ndecdig.inp');reset(input);
  assign(output,'ndecdig.out');rewrite(output);
  nhap;
  k:=cal(1,0,0);
  k1:=cal1(1,0,0);
  if cc=0 then  write((k1-k+base) mod base+1)
  else write((k1-k+base) mod base);
  close(input);close(output);
END.