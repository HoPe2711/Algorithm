uses math;
var m,n:int64;
    k,tmp,tmp1,sl,sl1:int64;
    res:int64;
procedure nhap;
begin
 read(m,n,k);
 tmp:=m mod k; sl:=m div k;
 tmp1:=n mod k; sl1:=n div k;
 res:=(sl1+1)*(Sl+1);
 if k-tmp>tmp1 then  res:=res+(sl+1)*sl1*tmp
 else  res:=res+(sl+1)*sl1*(k-tmp1-1)+(sl+1)*(sl1+1)*(tmp1-k+tmp+1);
 if k-(tmp+1)<=tmp1 then res:=res+sl*(sl1+1)*(k-tmp-1)
 else res:=res+sl*(sl1+1)*tmp1+sl*sl1*(k-tmp-tmp1-1);
 write(Res);
end;
begin
 assign(input,'cpairs.inp');reseT(input);
 assign(output,'cpairs.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
