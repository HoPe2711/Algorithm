uses math;
var n,m,res:longint;
begin
 //assign(input,'a913.inp');reset(input);
 read(n,m);
 if n>27 then res:=m
 else res:=m mod (2**n);
 write(Res);
 //close(input);
end.