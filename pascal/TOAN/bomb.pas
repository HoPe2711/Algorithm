uses math;
type arr=array[0..300] of longint;
var m,dot,n,k,canh:longint;
    res:Arr;
    c,a:Array[0..1000,0..1000] of longint;
    b,free:Array[0..1000000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
 begin
  for j:=1 to n do
   begin
    read(a[i,j]);
    b[(i-1)*n+j]:=a[i,j];
   end;
 end;
 dot:=m*n;
 for i:=1 to dot do
  if b[i]<>-1 then
   begin
    inc(k);
    if i-n>0 then c[k,i-n]:=1;
    if i mod n<>1 then c[k,i-1]:=1;
    if i mod n<>0 then c[k,i+1]:=1;
    if i+n<=dot then c[k,i+n]:=1;
    c[k,m*n+1]:=b[i];
   end;
end;
procedure xuli;
var i,j,h,dem,point:longint;
begin
 canh:=k;
 for i:=1 to k do
 if free[i]=0 then
  begin
   for j:=1 to dot do
    if c[i,j]=1 then
     begin
      point:=j; break;
     end;
    dem:=0;
   for j:=1 to dot do
    if c[i,j]=0 then inc(Dem);
   if (dem=dot) and (C[i,dot+1]=1) then
      begin
       write(0);
       halt;
      end;
   for j:=i+1 to k do
   if (c[j,point]=1) and (Free[j]=0) then
    begin
     dem:=0;
     for h:=1 to dot+1 do
      begin
       c[j,h]:=(c[j,h]+c[i,h]) mod 2;
       if (h<dot+1) and (C[j,h]=0) then inc(dem);
      end;
     if (dem=dot) and (c[j,dot+1]=0) then
      begin
       free[j]:=1;
       dec(canh);
      end;
     if (dem=dot) and (C[j,dot+1]=1) then
      begin
       write(0);
       halt;
      end;
    end;
  end;
// write(1 shl (m*n-canh));
end;
function cal(x,y:Arr):arr;
var sum,nho,dem,i:longint;
    c:arr;
begin
 fillchar(c,sizeof(c),0);
// b:=c;
 nho:=0;     dem:=0;
 for i:=1 to max(x[0],y[0]) do
  begin
   sum:=x[i]+y[i]+nho;
   if sum>=10 then nho:=1 else nho:=0;
   c[i]:=sum mod 10;
   inc(dem);
  end;
 if nho>0 then
  begin
   c[dem+1]:=nho;
   c[0]:=dem+1;
  end
 else
  begin
   c[0]:=dem;
  end;
 exit(c);
end;
procedure bignum;
var i:longint;
begin
  res[0]:=1; res[1]:=2;
  if (m*n-canh-1)<0 then
   begin
    write(1); exit;
   end;
  for i:=1 to (m*n-canh-1) do res:=cal(res,res);
  for i:=res[0] downto 1 do write(res[i]);
end;
begin
 assign(input,'bomb.inp');reset(input);
 assign(output,'bomb.out');rewrite(output);
 nhap;
 xuli;
 bignum;
 close(input); close(output);
end.