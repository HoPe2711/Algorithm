uses math;
const oo=200000000000;
var n,l,sk:longint;
    st,res,tt:int64;
    kq,kq1:extended;
    a,c:array[0..500] of int64;
    f:Array[0..500,0..500,0..500] of int64;
procedure nhap;
var i:longint;
begin
 read(n,l);
 for i:=1 to n do
  begin
   read(a[i]);
   sk:=sk+a[i];
  end;
 for i:=1 to n do
  begin
   read(c[i]);
   st:=st+c[i];
  end;
end;
procedure xuli;
var i,a1,l1:longint;
begin
 res:=oo;
 for i:=0 to n do
  for a1:=0 to sk do
   for l1:=0 to i do f[i,a1,l1]:=oo;
 f[0,0,0]:=0;
 for i:=0 to n-1 do
  for a1:=0 to sk do
   for l1:=0 to i do
   if f[i,a1,l1]<>oo then
    begin
     if a1+a[i+1]<=sk then f[i+1,a1+a[i+1],l1+1]:=min(f[i+1,a1+a[i+1],l1+1],f[i,a1,l1]+c[i+1]);
     f[i+1,a1,l1]:=min(f[i+1,a1,l1],f[i,a1,l1]);
    end;
 kq:=oo;
 for a1:=1 to sk-1 do
 if (f[n,a1,l]<oo) then kq:=min(kq,f[n,a1,l]*(St-f[n,a1,l])/(a1*(sk-a1)));


 res:=-oo;
 for i:=0 to n do
  for a1:=0 to sk do
   for l1:=0 to i do f[i,a1,l1]:=-oo;
 f[0,0,0]:=0;
 for i:=0 to n-1 do
  for a1:=0 to sk do
   for l1:=0 to i do
    if f[i,a1,l1]<>-oo then
    begin
     if a1+a[i+1]<=sk then f[i+1,a1+a[i+1],l1+1]:=max(f[i+1,a1+a[i+1],l1+1],f[i,a1,l1]+c[i+1]);
     f[i+1,a1,l1]:=max(f[i+1,a1,l1],f[i,a1,l1]);
    end;
 kq1:=oo;
 for a1:=1 to sk-1 do
 if (f[n,a1,l]>-oo) then kq1:=min(kq1,f[n,a1,l]*(St-f[n,a1,l])/(a1*(sk-a1)));
 writeln(min(kq,kq1):0:3);
end;
begin
 assign(input,'krum.inp');reset(input);
 assign(output,'krum.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.



{ res:=oo;
 duyet(1);
 write(res:0:3);}
{procedure inkq;
var i,t1,t2:longint;
begin
 t1:=0; t2:=0;
 fillchar(tt,sizeof(tt),0);
 fillchar(tt1,sizeof(tt1),0);
 for i:=1 to n do
  if x[i]=0 then
   begin
    tt[1]:=tt[1]+a[i];
    tt1[1]:=tt1[1]+c[i];
    inc(t1);
   end
  else
   begin
    tt[2]:=tt[2]+a[i];
    tt1[2]:=tt1[2]+c[i];
    inc(t2);
   end;
 if (t1=l) or (t2=l) then
 begin
  if (tt[1]<>0) and (tt[2]<>0) then res:=min(res,(tt1[1]/tt[1])*(tt1[2]/tt[2]))
  else if tt[1]<>0 then res:=min(res,tt1[1]/tt[1])
  else res:=min(res,tt1[2]/tt[2]);
 end;
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=n+1 then inkq
 else
  for j:=0 to 1 do
  begin
   x[i]:=j;
   duyet(i+1);
  end;
end;      }
