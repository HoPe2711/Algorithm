var k,res :longint;
    x:array[0..1000] of longint;
procedure nhap;
begin
 read(k);
end;
procedure inkq;
var st:string;
    i,j,h,dem:longint;
begin
 for i:=1 to k div 3 do
  for j:=1 to k-2*i do
   begin
    dem:=0;
    for h:=j to j+i-1 do
     if (x[h]=x[h+i]) and (x[h]=x[h+2*i]) then inc(dem);
    if dem=i then exit;
   end;
 for i:=2 to k do
  if (x[i]=x[i-1]) and (x[i]=1) then exit;
 inc(res);
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=k+1 then inkq
 else
  for  j:=1 to 2 do
   begin
    x[i]:=j;
    duyet(i+1);
   end;
end;
begin
  assign(input,'str.inp');reset(input);
  assign(output,'str.out');rewrite(output);
  nhap;
  if k>20 then write(0)
  else
   begin
    duyet(1);
    write(res);
   end;
  close(input);close(output);
end.
