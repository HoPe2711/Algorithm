var l,k:longint;
    n:int64;
    st:string;
    a:Array[1..16] of longint;
    dd:array[1..17,0..1,0..9,0..1,0..16] of boolean;
    f:array[1..17,0..1,0..9,0..1,0..16] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 str(n,st);
 l:=length(st);
 for i:=1 to l do a[i]:=ord(st[i])-48;
end;
function col(i,ok,tc,xh,giong:longint):int64;
var j,okt,last,tct,xht,giongt:longint;
begin
 if dd[i,ok,tc,xh,giong] then exit(f[i,ok,tc,xh,giong]);
 dd[i,ok,tc,xh,giong]:=true;
 if i=l+1 then
  begin
   if giong<=k then f[i,ok,tc,xh,giong]:=1;
   exit(f[i,ok,tc,xh,giong]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
  begin
    if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
    if (xh=0) and (j=0) then xht:=0
    else xht:=1;
    tct:=j;
    if (j-tc=0) and (xh=1) then giongt:=giong+1
    else giongt:=giong;
    f[i,ok,tc,xh,giong]:=f[i,ok,tc,xh,giong]+col(i+1,okt,tct,xht,giongt);
  end;
 exit(f[i,ok,tc,xh,giong]);
end;
BEGIN
  assign(input,'demso2.inp');reset(input);
  assign(output,'demso2.out');rewrite(output);
  nhap;
  write(col(1,0,0,0,0));
  close(input);close(output);
END.
