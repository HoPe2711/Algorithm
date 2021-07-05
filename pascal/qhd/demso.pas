var l,l1,h:longint;
    n,n1,k,k1:int64;
    st,st1:string;
    a,b:Array[1..16] of longint;
    dd,dd1:array[1..17,0..1,0..9,0..1] of boolean;
    f,f1:array[1..17,0..1,0..9,0..1] of int64;
procedure nhap;
var i:longint;
begin
 read(n,n1);
 if n1>n then
  begin
   str(n-1,st);
   str(n1,st1);
  end
 else
  begin
   str(n,st);
   str(n1-1,st1)
  end;
 l:=length(st);
 l1:=length(st1);
 for i:=1 to l do a[i]:=ord(st[i])-48;
 for i:=1 to l1 do b[i]:=ord(st1[i])-48;
end;
function col(i,ok,tc,xh:longint):int64;
var j,okt,last,tct,xht:longint;
begin
 if dd[i,ok,tc,xh] then exit(f[i,ok,tc,xh]);
 dd[i,ok,tc,xh]:=true;
 if i=l+1 then
  begin
   f[i,ok,tc,xh]:=1;
   exit(f[i,ok,tc,xh]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
  if ((xh=1) and (abs(j-tc)>=2)) or (xh=0)  then
   begin
    if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
    if (xh=0) and (j=0) then xht:=0
    else xht:=1;
    tct:=j;
    f[i,ok,tc,xh]:=f[i,ok,tc,xh]+col(i+1,okt,tct,xht);
   end;
 exit(f[i,ok,tc,xh]);
end;
function col1(i,ok,tc,xh:longint):int64;
var j,okt1,last1,tct1,xht1:longint;
begin
 if dd1[i,ok,tc,xh] then exit(f1[i,ok,tc,xh]);
 dd1[i,ok,tc,xh]:=true;
 if i=l1+1 then
  begin
   f1[i,ok,tc,xh]:=1;
   exit(f1[i,ok,tc,xh]);
  end;
 if ok=0 then last1:=b[i]
 else last1:=9;
 for j:=0 to last1 do
  if ((xh=1) and (abs(j-tc)>=2)) or (xh=0)  then
   begin
    if (ok=0) and (j=b[i]) then okt1:=0
    else okt1:=1;
    if (xh=0) and (j=0) then xht1:=0
    else xht1:=1;
    tct1:=j;
    f1[i,ok,tc,xh]:=f1[i,ok,tc,xh]+col1(i+1,okt1,tct1,xht1);
   end;
 exit(f1[i,ok,tc,xh]);
end;
BEGIN
  assign(input,'demso.inp');reset(input);
  assign(output,'demso.out');rewrite(output);
  nhap;
  k:=col(1,0,0,0);
  k1:=col1(1,0,0,0);
  write(abs(k-k1));
  close(input);close(output);
END.
