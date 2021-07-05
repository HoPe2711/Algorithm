uses math;
var  n,l,l1,res,f,r:longint;
     a,queu,fi:array[0..1000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,l,l1);
 for i:=1 to n do read(a[i]);
end;
procedure push(i:longint);
begin
 while (r>=f) and (a[i]>=a[queu[r]]) do dec(r);
 inc(r);
 queu[r]:=i;
end;
procedure xuli;
var i:longint;
begin
 f:=1; r:=0;
 for i:=1 to n do
  begin
   fi[i]:=a[i];
   if i>l then
    begin
     push(i-l);
     if queu[f]+l1<i then inc(f);
     fi[i]:=max(fi[i],fi[queu[f]]+a[i]);
    end;
   res:=max(res,fi[i]);
  end;
 write(res);
end;
begin
 assign(input,'gold.inp');reset(input);
 assign(output,'gold.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.