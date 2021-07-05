uses math;
var l,l1,k,k1,l2,dem,sum:longint;
    n,n1:int64;
    st,st1,st2:string;
    dd,dd1:array[1..20,0..1500,0..1] of boolean;
    f,f1:array[1..20,0..1500,0..1] of int64;
    xet,xet1:array[0..100000] of longint;
    a,b:array[1..20] of longint;
    h,m:array[1..1500] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 str(n,st);
 l:=length(st);
 for i:=1 to l do a[i]:=ord(st[i])-48;
end;
procedure xuli;
var i,j:longint;
begin
 for i:=1 to 1500 do
  begin


  end;
 for i:=1 to dem do writeln(h[i]);
end;
function call1(s:longint):longint;
 var
 begin
  sum:=0;
  st2:='';
  str(i,st2);
  str(s,st2);
  l2:=length(st2);
   for j:=1 to l2 do sum:=sum+(ord(st2[j])-48)**2;
   if (sum=1) or (call1(sum)=1) then
    begin
     inc(dem);
     h[dem]:=i;
     call1(sum):=1;
    end;

 end;
function call(i,s,ok:longint):longint;
var j,okt,last,g:longint;
begin
 if dd[i,s,ok] then exit(f[i,s,ok]);
 dd[i,s,ok]:=true;
 if i=l+1 then
  begin
  for g:=1 to dem do
   if h[g]=s then f[i,s,ok]:=1;
  exit(f[i,s,ok]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
   begin
    if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
    f[i,s,ok]:=f[i,s,ok]+call(i+1,s+j**2,okt);
   end;
 exit(f[i,s,ok]);
end;

BEGIN
  assign(input,'snum.inp');reset(input);
  assign(output,'snum.out');rewrite(output);
  nhap;
  xuli;
  k:=call(1,0,0);
  writeln(k);
  close(input);close(output);
END.
