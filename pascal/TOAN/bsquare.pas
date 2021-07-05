uses math;
var n:longint;
    res:int64;
    a:array[1..400,1..400] of longint;
procedure nhap;
var i,j:longint;
begin
 read(N);
 for i:=1 to n do
  for j:=1 to n do read(a[i,j]);
end;
procedure xuli;
var i,j,k:longint;
    cc,cp:int64;
begin
 res:=0;
 for i:=1 to n do
  for j:=1 to n do
  begin
    cc:=a[i,j]; cp:=a[i,j];
    for k:=1 to n do
     if (i+k<=n) and (i-k>=1) and (j+k<=n) and (j-k>=1) then
      begin
       cc:=cc+a[i-k,j-k]+a[i+k,j+k];
       cp:=cp+a[i-k,j+k]+a[i+k,j-k];
       res:=max(res,cc-cp);
      end ;
  end;
 for i:=1 to n do
  for j:=1 to n do
  if ((i+1)<=n) and ((j+1)<=n) then
   begin
    cc:=a[i,j]+a[i+1,j+1];
    cp:=a[i+1,j]+a[i,j+1];
    res:=max(res,cc-cp);
    for k:=1 to n do
     if (i-k>=1) and (j-k>=1) and (i+k+1<=n) and (j+k+1<=n) then
      begin
       cc:=cc+a[i-k,j-k]+a[i+k+1,j+k+1];
       cp:=cp+a[i-k,j+k+1]+a[i+k+1,j-k];
       res:=max(res,cc-cp);
      end;
   end;
  write(res);
end;
begin
 assign(input,'bsquare.inp');reset(input);
 assign(output,'bsquare.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
