var st:string;
    l,k:longint;
    n:int64;
    a:array[1..16] of longint;
    dd:array[1..17,0..10000,0..1,0..1] of boolean;
    f:array[1..17,0..10000,0..1,0..1] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 str(n,st);
 l:=length(st);
 for i:=1 to l do a[i]:=ord(st[i])-48;
end;
function col(i,p,ok,xh:longint):int64;
var j,last,okt,xht:longint;
begin
 if dd[i,p,ok,xh] then exit(f[i,p,ok,xh]);
 dd[i,p,ok,xh]:=true;
 if i=l+1 then
  begin
   if p mod k=0 then f[i,p,ok,xh]:=1;
   exit(f[i,p,ok,xh]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
   begin
    if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
    if (xh=0) and (j=0) then xht:=0
    else xht:=1;
    if xht=1 then
    f[i,p,ok,xh]:=f[i,p,ok,xh]+col(i+1,(p*j) mod k,okt,xht)
    else  f[i,p,ok,xh]:=f[i,p,ok,xh]+col(i+1,1,okt,xht)
   end;
 exit(f[i,p,ok,xh]);
end;
BEGIN
  assign(input,'bai2.inp');reset(input);
  assign(output,'bai2.out');rewrite(output);
  nhap;
  write(col(1,1,0,0));
  close(input);close(output);
END.
