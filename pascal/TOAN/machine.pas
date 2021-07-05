uses math;
var n,kk,res:longint;
    s,t,h,f:array[0..3000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(s[i],t[i]);
   h[t[i]]:=max(h[t[i]],t[i]-s[i]);
   kk:=max(kk,t[i]);
  end;
 for i:=1 to kk do f[i]:=max(h[i],f[i-1]);
 for i:=1 to n do
  if f[s[i]]<>0 then res:=max(f[s[i]]+t[i]-s[i],res);
 if res=0 then res:=-1;
 write(Res);
end;
begin
 assign(input,'machine.inp');reset(input);
 assign(output,'machine.out');rewrite(output);
 nhap;
 //xuli;
 close(input);
 close(output);
end.
