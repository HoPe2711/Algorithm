uses math;
var n:longint;
    res,k:int64;
    a,m:array[0..2000] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i],m[i]);
end;
procedure doicho(Var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j:longint;  mid:int64;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(m[i],m[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i,kq,last:longint; tmp:int64;
begin
 qsort(1,n);
 for i:=1 to n do
  if a[i]>=0 then
   begin
    kq:=i; break;
   end;
 last:=0;
 for i:=1 to kq-1 do
 if m[i]>0 then
  begin
   res:=res+abs(a[i])* (m[i] div k)*2;
   if (m[i] mod k<>0) then res:=res+abs(a[i])*2;
   last:=max(last,i+1);
   tmp:=(k-m[i] mod k);
   m[i]:=0;
   while (m[last]<tmp) and (last<=kq-1) do
    begin
     tmp:=tmp-m[last];
     m[last]:=0;
     inc(last);
    end;
   if last<=kq-1 then m[last]:=m[last]-tmp;
  end;
 last:=n+1;
 for i:=n downto kq do
 if m[i]>0 then
  begin
   res:=res+abs(a[i])*( m[i] div k)*2;
   if m[i] mod k<>0 then res:=res+abs(a[i])*2;
   last:=min(last,i-1);
   tmp:=(k-m[i] mod k);
   m[i]:=0;
   while (m[last]<tmp) and (last>=kq) do
    begin
     tmp:=tmp-m[last];
     m[last]:=0;
     dec(last);
    end;
  if last>=kq then m[last]:=m[last]-tmp;
  end;
 write(Res)
end;
begin
 assign(input,'postman.inp');reseT(input);
 assign(output,'postman.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.