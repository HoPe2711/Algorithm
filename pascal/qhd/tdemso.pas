var l,d,k:longint;
    n:int64;
    st:string;
    a:Array[1..16] of longint;
    dd:array[1..17,0..1,0..9,0..1,0..17] of boolean;
    f:array[1..17,0..1,0..9,0..1,0..17] of int64;
procedure nhap;
var i:longint;
begin
 read(n,d,k);
 str(n,st);
 l:=length(st);
 for i:=1 to 1 do a[i]:=ord(st[i])-48;
end;
function col(i,ok,tc,xh,vt:longint):int64;
var j,okt,last,tct,xht,vtt:longint;
begin
 if dd[i,ok,tc,xh,vt] then exit(f[i,ok,tc,xh,vt]);
 dd[i,ok,tc,xh,vt]:=true;
 if i=l+1 then
  begin
   if vt<=k then f[i,ok,tc,xh,vt]:=1;
   vt:=0;
   exit(f[i,ok,tc,xh,vt]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
  if ((xh=1) and (abs(j-tc)>=d+1)) or (xh=0)  then
   begin
    if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
    if (xh=0) and (j=0) then xht:=0
    else xht:=1;
    tct:=j;
    if abs(j-tc)>=d+1 then inc(vtt);
    f[i,ok,tc,xh,vt]:=f[i,ok,tc,xh,vt]+col(i+1,okt,tct,xht,vtt);
   end;
 exit(f[i,ok,tc,xh,vt]);
end;
BEGIN
  assign(input,'tdemso.inp');reset(input);
  assign(output,'tdemso.out');rewrite(output);
  nhap;
  writeln(col(1,0,0,0,0));
  close(input);close(output);
END.