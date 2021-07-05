var n,kq:int64;
    l,s1:longint;
    st:string;
    dd:array[1..15,0..1,1..108,0..107,0..108] of boolean;
    f:array[1..15,0..1,1..108,0..107,0..108] of int64;
    a:array[1..15] of longint;
procedure nhap;
 var i:longint;
 begin
  read(n);
  str(n,st);
  l:=length(st);
  for i:=1 to l do a[i]:=ord(st[i])-48;
 end;
function col(i,ok,s,m,sum:longint):int64;
var j,okt,last:longint;
begin
 if dd[i,ok,s,m,sum] then exit(f[i,ok,s,m,sum]);
 dd[i,ok,s,m,sum]:=true;
 if i=l+1 then
  begin
   if (s=sum) and (m=0) then f[i,ok,s,m,sum]:=1;
   exit(f[i,ok,s,m,sum]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=0 to last do
  begin
    if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
    f[i,ok,s,m,sum]:=f[i,ok,s,m,sum]+col(i+1,okt,s,(m*10+j) mod s,sum+j);
  end;
 exit(f[i,ok,s,m,sum]);
end;
BEGIN
  assign(input,'attractive.inp');reset(input);
  assign(output,'attractive.out');rewrite(output);
  nhap;
  for s1:=1 to 108 do kq:=kq+ col(1,0,s1,0,0);
  write(kq);
  close(input);close(output);
END.
