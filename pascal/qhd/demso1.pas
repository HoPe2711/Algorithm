var l,d,k,l1:longint;
    n,n1:int64;
    st,st1:string;
    a,b:Array[1..16] of longint;
    dd,dd1:array[1..17,0..1,0..9,0..1,0..17] of boolean;
    f,f1:array[1..17,0..1,0..9,0..1,0..17] of int64;
procedure nhap;
var i:longint;
begin
 read(n,n1,d,k);
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
function col(i,ok,tc,xh,vt:longint):int64;
var j,okt,last,tct,xht,vtt:longint;
begin
 if dd[i,ok,tc,xh,vt] then exit(f[i,ok,tc,xh,vt]);
 dd[i,ok,tc,xh,vt]:=true;
 if i=l+1 then
  begin
   if vt<=k then f[i,ok,tc,xh,vt]:=1;
   exit(f[i,ok,tc,xh,vt]);
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
    if (abs(j-tc)<=d) and (xh=1) then vtt:=vt+1
    else vtt:=vt;
    f[i,ok,tc,xh,vt]:=f[i,ok,tc,xh,vt]+col(i+1,okt,tct,xht,vtt);
   end;
 exit(f[i,ok,tc,xh,vt]);
end;
function col1(i,ok,tc,xh,vt:longint):int64;
var j,okt,last,tct,xht,vtt:longint;
begin
 if dd1[i,ok,tc,xh,vt] then exit(f1[i,ok,tc,xh,vt]);
 dd1[i,ok,tc,xh,vt]:=true;
 if i=l1+1 then
  begin
   if vt<=k then f1[i,ok,tc,xh,vt]:=1;
   exit(f1[i,ok,tc,xh,vt]);
  end;
 if ok=0 then last:=b[i]
 else last:=9;
 for j:=0 to last do
   begin
    if (ok=0) and (j=b[i]) then okt:=0
    else okt:=1;
    if (xh=0) and (j=0) then xht:=0
    else xht:=1;
    tct:=j;
    if (abs(j-tc)<=d) and (xh=1) then vtt:=vt+1
    else vtt:=vt;
    f1[i,ok,tc,xh,vt]:=f1[i,ok,tc,xh,vt]+col1(i+1,okt,tct,xht,vtt);
   end;
 exit(f1[i,ok,tc,xh,vt]);
end;
BEGIN
  assign(input,'demso1.inp');reset(input);
  assign(output,'demso1.out');rewrite(output);
  nhap;
  write(abs(col(1,0,0,0,0)-col1(1,0,0,0,0)));
  close(input);close(output);
END.
