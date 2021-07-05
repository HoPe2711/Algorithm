uses math;
var m,n,res:longint;
procedure nhap;
var x:longint;  s:String;
begin
 read(m,n);
 str(m,s);
 x:=10**length(s);
 if n mod x<m then res:=n div x
 else res:=n div x+1;
 write(res);
end;
begin
 assign(input,'nprefix.inp');reset(input);
 assign(output,'nprefix.out');rewrite(output);
 nhap;
 close(input); close(output);
end.