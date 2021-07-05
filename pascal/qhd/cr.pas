var m,n,l,x,y,z:longint;
    res:int64;
    f:array[0..100,0..100,0..1,0..5000] of int64;
procedure nhap;
begin
 read(m,n,l,x,y,z);
 f[1,0,0,0]:=1;
 f[0,1,1,0]:=1;
end;
procedure xuli;
var i,j,sum,tt,them:longint;
begin
 for i:=0 to m do
  for j:=0 to n do
   for tt:=0 to 1 do
    for sum:=0 to l do
     if f[i,j,tt,sum]>0 then
     begin
      if i<m then
       begin
        if tt=0 then them:=x
        else them:=z*abs(i+1-j);
        if sum + them <=l then
         f[i+1,j,0,sum+them]:=f[i+1,j,0,sum+them]+f[i,j,tt,sum];
       end;
      if j<n then
       begin
        if tt=1 then them:=y
        else them:=z*abs(j-i+1);
        if sum+them<=l then
         f[i,j+1,1,sum+them]:=f[i,j+1,1,sum+them]+f[i,j,tt,sum];
       end;
      end;
  for i:=0 to 1 do
   for sum:=0 to l do res:=res+f[m,n,i,sum];
  write(res);
end;
BEGIN
  assign(input,'cr.inp');reset(input);
  assign(output,'cr.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
