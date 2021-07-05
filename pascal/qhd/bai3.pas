var l:longint;
    n:int64;
    st:string;
    a:Array[1..16] of longint;
    dd:array[1..17,0..200,0..1,0..9] of boolean;
    f:array[1..17,0..200,0..1,0..9] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 str(n,st);
 l:=length(st);
 for i:=1 to l do a[i]:=ord(st[i])-48;
end;
function col(i,s,ok,tc:longint):int64;
var j,okt,last,tct:longint;
begin
 if dd[i,s,ok,tc] then exit(f[i,s,ok,tc]);
 dd[i,s,ok,tc]:=true;
 if i=l+1 then
  begin
   if s mod 2=1 then f[i,s,ok,tc]:=1;
   exit(f[i,s,ok,tc]);
  end;
 if ok=0 then last:=a[i]
 else last:=9;
 for j:=tc to last do
  begin
   if (ok=0) and (j=a[i]) then okt:=0
    else okt:=1;
   tct:=j;
   f[i,s,ok,tc]:=f[i,s,ok,tc]+col(i+1,(s+j) mod 2,okt,tct)
  end;
 exit(f[i,s,ok,tc]);
end;
BEGIN
  assign(input,'bai3.inp');reset(input);
  assign(output,'bai3.out');rewrite(output);
  nhap;
  writeln(col(1,0,0,0));
  close(input);close(output);
END.
