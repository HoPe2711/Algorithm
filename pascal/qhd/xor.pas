var k,q:longint;
    a,sum:array[0..100001] of int64;
procedure nhap;
var i:longint;
begin
 read(k);
 for i:=1 to k do
  begin
   read(a[i]);
   a[k+1]:=a[k+1] xor a[i];
  end;
 for i:=1 to k+1 do sum[i]:=sum[i-1] xor a[i];
end;
procedure xuli;
var tt2,l,r:int64;  i:longint;
begin
 read(q);
 for i:=1 to q do
  begin
   read(l,r);
   tt2:=(r-l+1) div (k+1);
   l:=l mod (k+1); if l=0 then l:=k+1;
   r:=r mod (k+1); if r=0 then r:=k+1;
   if r<=l then
    if tt2 mod 2=0 then writeln(sum[r] xor (sum[k+1] xor sum[l-1]))
    else writeln(sum[r] xor sum[l-1]);
   if r>l then
    if tt2 mod 2=0 then writeln(sum[r] xor sum[l-1])
    else writeln(sum[r] xor sum[l-1] xor sum[k+1]);
  end;
end;
begin
  assign(input, 'xor.inp'); reset(input);
  assign(output,'xor.out'); rewrite(output);
  nhap;
  xuli;
  close(input); close(output);
end.