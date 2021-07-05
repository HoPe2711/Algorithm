uses math;
const oo=high(int64) div 2;
var n:longint;
    c,d:array[0..200000] of longint;
    sum:array[0..200000] of int64;
    kq,kq1:int64;
procedure nhap;
var  i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(c[i],d[i]);
   sum[i]:=sum[i-1]+c[i];
  end;
 kq:=-oo; kq1:=oo;
 for i:=1 to n do
  if d[i]=1 then kq:=max(kq,1900-sum[i-1])
  else kq1:=min(kq1,1899-sum[i-1]);
 if (kq1=oo) then write('Infinity')
 else
 if kq1<kq then write('Impossible')
 else write(kq1+sum[n]);
end;
begin
// assign(input,'c750.inp');reset(input);
 nhap;
// close(input);
end.