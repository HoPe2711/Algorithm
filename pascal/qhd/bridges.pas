uses math;
var n:longint; res:int64;
    s,l,r,maxx:Array[0..2000000] of int64;
    a:array[0..2000000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n-1 do
  begin
   read(a[i]);
   s[i]:=s[i-1]+a[i];
   if a[i] mod 2=0 then dec(s[i]);
  end;
 for i:=2 to n do
  if a[i-1]<2 then l[i]:=0
  else
   begin
    l[i]:=l[i-1]+a[i-1];
    if a[i-1] mod 2=1 then dec(l[i]);
   end;
 for i:=n-1 downto 1 do
  if a[i]<2 then r[i]:=0
  else
   begin
    r[i]:=r[i+1]+a[i];
    if a[i] mod 2=1 then dec(r[i]);
   end;
 for i:=1 to n do maxx[i]:=max(maxx[i-1],l[i]-s[i-1]);
 for i:=1 to n do res:=max(Res,r[i]+s[i-1]+maxx[i]);
 write(res);
end;
begin
 assign(input,'bridges.inp');reseT(input);
 assign(output,'bridges.out');rewrite(output);
 nhap;
 close(input); close(output);
end.