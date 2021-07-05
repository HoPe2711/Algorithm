{$H+}
uses math;
var  st,res,res1:string;
     n:longint;
     f:array[0..2001,0..2001] of longint;
  //   tt:array[0..2001] of longint;
procedure nhap;
var i,j:longint;
begin
 readln(st);
 n:=length(st);
 for i:=1 to n do f[i,i]:=1;
 for i:=n downto 1 do
  for j:=i+1 to n do
   if (st[i]=st[j]) then f[i,j]:=max(f[i+1,j-1]+2,f[i,j])
   else f[i,j]:=max(f[i+1,j],f[i,j-1]);
 //write(f[1,n]);
 i:=1; j:=n;
 while i<=j do
 begin
  if st[i]=st[j] then
   begin
    res:=res+st[i];
    res1:=st[j]+res1;
    inc(i);
    dec(j);
   end
  else
   begin
    if f[i,j]=f[i+1,j] then inc(i)
    else dec(j);
   end;
 end;
 if f[1,n] mod 2 =1 then delete(res1,1,1);
 write(reS+res1);
end;
begin
  //assign(input,'nkpalin.inp');reset(input);
  //assign(output,'nkpalin.out');rewrite(output);
  nhap;
  //close(input);close(output);
end.
