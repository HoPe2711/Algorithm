uses math;
var n:longint;
    res:int64;
    a,lmax,rmax:array[0..100001] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   lmax[i]:=max(lmax[i-1],a[i]);
  end;
 for i:=n downto 1 do rmax[i]:=max(rmax[i+1],a[i]);
end;
procedure xuli;
var i,kq:longint;
begin
 for i:=1 to n do
  begin
   kq:=min(lmax[i],rmax[i]);
   res:=res+kq-a[i];
  end;
 write(Res);
end;
begin
 //assign(input,'v11water.inp');reset(input);
 nhap;
 xuli;
// close(input);
end.
