uses math;
var n,res,h,kq:longint;
    a,x,c:array[0..1000] of longint;
    free:array[0..1000] of boolean;
    f:array[0..1100000] of boolean;
    trace,k1,test,sum:array[0..1100000] of longint;
procedure nhap;
var i:longint;
begin
 res:=0;
 read(n);
 for i:=1 to n do read(a[i]);
end;
procedure xuli;
var i,dem,sum:longint;
begin
 dem:=0;
 sum:=0;
 for i:=1 to n-1 do
  begin
   sum:=sum+a[x[i]];
   if (sum mod a[x[i+1]])=0 then inc(dem)
   else break;
  end;
 if dem<>0 then
 if res<dem+1 then
  begin
   res:=dem+1;
   for i:=1 to dem+1 do c[i]:=x[i];
  end
 else res:=max(Res,dem);
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=n+1 then xuli
 else
  for j:=1 to n do
   if free[j]=false then
    begin
     x[i]:=j;
     free[j]:=true;
     duyet(i+1);
     free[j]:=false;
    end;
end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
function tatbit(x,i:longint):longint;
begin
 exit(x xor (1 shl i));
end;
procedure xuli2;
var l,tt,i,dem:longint;
begin
 dem:=n;
 l:=2**n-1 ;
 f[0]:=true;
 for tt:=0 to l do
  for i:=1 to n do
   if getbit(tt,i-1)=1 then
    begin
     sum[tt]:=sum[tt]+a[i];
     inc(test[tt]);
    end;
 for tt:=0 to l do
  for i:=1 to n do
  if f[tt]=true then
   if (getbit(tt,i-1)=0) and (sum[tt] mod a[i]=0) then
    begin
     f[tt or (1 shl (i-1))]:=true;
     trace[tt or (1 shl (i-1))]:=i;
     if res<test[tt or (1 shl (i-1))] then
      begin
       res:=test[tt or (1 shl (i-1))];
       kq:=tt or (1 shl (i-1));
      end;
    end;
 writeln(res);
 while kq<>0 do
  begin
   k1[dem]:=trace[kq];
   dec(dem);
   kq:=tatbit(kq,trace[kq]-1);
  end;
 for i:=dem+1 to n do write(k1[i],' ');
end;
procedure xuli3;
var tt,k:longint;
begin
 writeln(n);
 tt:=n div 2;
 k:=0;
 if n mod 2 =0 then
  begin
   while (tt<n) do
    begin
     inc(tt);
     inc(k);
     write(tt,' ',k,' ');
    end;
  end
 else
  begin
   while (tt<n-1) do
    begin
     inc(tt);
     inc(k);
     write(tt,' ',k,' ');
    end;
   write(n);
  end;
end;
begin
 assign(input,'DSP.inp');reset(input);
 assign(output,'DSP.out');rewrite(output);
 nhap;
 if n<=10 then
  begin
   duyet(1);
   writeln(res);
   if res<>0 then
    for h:=1 to res do write(c[h],' ');
  end
 else if n<=20 then xuli2
 else if n>30 then xuli3;
 close(input); close(output);
end.
