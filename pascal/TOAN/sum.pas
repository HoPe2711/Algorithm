{$H+}
uses math;
var n,base:longint;
    st:String;
    res:int64;
    f:array[0..200000] of int64;
    a:array[0..200000] of longint;
procedure nhap;
var i:longint;
begin
 readln(n,base);
 readln(st);
 for i:=1 to length(St) do a[i]:=ord(st[i])-48;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  begin
   f[i]:=((f[i-1]*10) mod base+a[i]*(i) mod base) mod base;
   res:=(res+f[i]) mod base;
  end;
 write(res);
end;
begin
 assign(input,'sum.inp');reset(input);
 assign(output,'sum.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.