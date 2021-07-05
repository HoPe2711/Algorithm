uses math;
var n,res:longint;
    l,r:array[0..20000] of longint;
    f:Array[0..20000,0..1] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(l[i],r[i]);
end;
procedure xuli;
var i,tmp,tmp1,tmp2,tmp3:longint;
begin
 f[1,1]:=r[1]-1; f[1,0]:=r[1]-1+r[1]-l[1];
 for i:=2 to n do
  begin
  tmp:=abs(l[i]-r[i-1]);  tmp1:=abs(l[i]-l[i-1]);
  tmp2:=abs(r[i]-l[i-1]);  tmp3:=abs(r[i]-r[i-1]);
  f[i,1]:=min(f[i-1,1]+r[i]-l[i]+1+tmp,f[i-1,0]+r[i]-l[i]+1+tmp1);
  f[i,0]:=min(f[i-1,0]+r[i]-l[i]+1+tmp2,f[i-1,1]+r[i]-l[i]+1+tmp3);
  end;
 res:=min(f[n,1]+n-r[n],f[n,0]+n-l[n]);
 write(Res);
end;
begin
 assign(input,'segments.inp');reset(input);
 assign(output,'segments.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.