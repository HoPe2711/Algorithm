var n,k,t,res,dem:longint;
    x:array[0..10001] of longint;
procedure nhap;
begin
 read(n,t,k);
end;
procedure duyet(i,so:longint);
var  j:longint;
begin
 if i=n+1 then
  begin
   inc(dem);
   if dem=t then
    begin
     res:=t;
     for j:=1 to n do write(x[j],' ');
     halt;
    end;
   exit;
  end
 else
  begin
   if so<k-1 then
    begin
     x[i]:=0;
     duyet(i+1,so+1);
    end;
   x[i]:=1;
   duyet(i+1,0);
  end;
end;
procedure xuli;
begin
 res:=0;
 duyet(1,0);
 if res=0 then write(-1);
end;
begin
 assign(input,'binarylist.inp');reset(input);
 assign(output,'binarylist.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.