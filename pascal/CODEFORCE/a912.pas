uses math;
var a,b,x,y,z,tmp,tmp1:int64;
begin
 //assign(input,'a.inp');reset(input);
 read(a,b);
 read(x,y,z);
 tmp:=x*2+y;
 tmp1:=z*3+y;
 tmp:=max(tmp-a,0);
 tmp1:=max(tmp1-b,0);
 write(tmp+tmp1);
 //close(input);
end.