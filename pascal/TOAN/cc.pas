uses math;
var  sum,res1:int64;
     res:real;
     n,k:longint;
     d:array[0..200] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do
  begin
   read(d[i]);
   sum:=sum+d[i];
  end;
end;
procedure xuli;
var i,j:longint; res1,tmp:int64;
begin
 res1:=high(int64);
 for i:=1 to n do
 begin
  tmp:=0;
  for j:=1 to n do tmp:=tmp+abs(d[j]-d[i]);
  res1:=min(res1,tmp);
 end;
 write(res1,'.00');
end;
procedure xuli1;
var p:Real;
    i:longint;
begin
 p:=sum/n;
 for i:=1 to n do res:=res+abs(p-d[i])*abs(p-d[i]);
 write(res:0:2);
end;
begin
 assign(input,'cc.inp');reset(input);
 assign(output,'cc.out');rewrite(output);
 nhap;
 if k=1 then xuli
 else xuli1;
 close(input);
 close(output);
end.
