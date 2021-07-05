uses math;
var m,k,f,r:longint;  res:int64;
    a,queu:array[0..200000] of longint;
   // f1:array[0..100000] of int64;
procedure nhap;
var i:longint;
begin
 read(m,k);
 for i:=1 to m do read(a[i]);
end;
procedure xuli;
var i:longint;
begin
 f:=1; r:=0;
 for i:=1 to m do
  begin
   while (f<=r) and (a[queu[r]]>=a[i]) do dec(r);
   inc(R);
   queu[r]:=i;
   if queu[f]+k<=i then inc(f);
   res:=res+a[queu[f]]*2 ;
  end;
 write(res);
end;
begin
 assign(input,'food.inp');reset(input);
 assign(output,'food.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.