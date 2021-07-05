uses math;
var  n,m,k,res,res1:longint;
     a,sum:array[0..200,0..200] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,m,k);
 for i:=1 to n do
  for j:=1 to m do read(a[i,j]);
 for i:=1 to m do
  for j:=1 to n do sum[i,j]:=sum[i,j-1]+a[j,i];
end;
procedure xuli;
var  tg,tg1,kq,tmp,j,i,t:longint;
begin
 for j:=1 to m do
  begin
   tg:=0;    tg1:=-1;  kq:=-1;
   for i:=1 to n do
    if a[i,j]=1 then
     begin
      tmp:=min(k,n-i+1)+i-1;  inc(tg1);
      if tg<sum[j,tmp]-sum[j,i-1] then
       begin
        tg:=sum[j,tmp]-sum[j,i-1];
        kq:=tg1;
       end;
      for t:=i to n do dec(sum[j,t]);
     end;
   if kq<>-1 then
    begin
     res:=res+tg;
     res1:=res1+kq;
    end;
  end;
 write(res,' ',res1);
end;
begin
// assign(input,'c873.inp');reset(input);
 nhap;
 xuli;
// close(input);
end.