uses math;
var n:longint;
    res:int64;
    x,y:array[0..20000] of int64;
procedure nhap;
var i:longint;  d:int64;
begin
 read(n);
 for i:=1 to n do
  begin
   read(x[i],d);
   y[i]:=x[i]+d;
  end;
end;
procedure doicho(Var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;  key,key1:int64;
begin
 i:=l;
 j:=r;
 mid:=l+random(r-l+1);
 key:=x[mid];
 key1:=y[mid];
 repeat
  while (x[i]<key) or ((x[i]=key) and (y[i]<key1)) do inc(i);
  while (x[j]>key) or ((x[j]=key) and (y[j]>key1)) do deC(j);
  if i<=j then
   begin
    doicho(x[i],x[j]);
    doicho(y[i],y[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var  i:longint; u,v:int64;
begin
 qsort(1,n);
 u:=x[1]; v:=y[1];
 for i:=2 to n do
  begin
   if x[i]>v then
    begin
     res:=res+v-u;
     u:=x[i]; v:=y[i];
    end
   else v:=max(v,y[i]);
  end;
 res:=res+v-u;
 write(Res);
end;
begin
 //assign(input,'phu.inp');reset(input);
 nhap;
 xuli;
 //close(input);
end.