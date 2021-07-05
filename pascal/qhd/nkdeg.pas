var l,k:longint;
    n:int64;
    st:string;
    a:Array[1..16] of longint;
    dd:array[1..17,0..1,0..9,0..1] of boolean;
    f:array[1..17,0..1,0..9,0..1] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 str(n,st);
 l:=length(st);
 for i:=1 to l do a[i]:=ord(st[i])-48;
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
  begin
   if ((abs(j-tc) mod k=0) and (xh=1)) or (xh=0) then
    begin
     if (ok=0) and (j=a[i]) then okt:=0
     else okt:=1;
     if (xh=0) and (j=0) then xht:=0
    else xht:=1;
     tct:=j;
     f[i,ok,tc,xh]:=f[i,ok,tc,xh]+col(i+1,okt,tct,xht);
    end;
  end;
 exit(f[i,ok,tc,xh]);
end;
BEGIN
  assign(input,'nkdeg.inp');reset(input);
  assign(output,'nkdeg.out');rewrite(output);
  nhap;
  write(col(1,0,0,0));
  close(input);close(output);
END.
