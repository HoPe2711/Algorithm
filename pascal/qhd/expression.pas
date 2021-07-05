uses math;
var st:string;
    l,h:longint;
    f:array[1..2,1..15,1..15] of int64;
    a:array[1..30] of longint;
    b:array[1..30] of char;
procedure nhap;
var i,j,t:longint;
begin
 readln(st);
 l:=length(st);
 for h:=1 to l do
  if h mod 2=1 then a[(h+1)div 2]:=ord(st[h])-48
  else b[h div 2]:=st[h];
 for i:=1 to (l+1) div 2 do
  for j:=1 to (l+1) div 2 do
   for t:=1 to 2 do
    f[t,i,j]:=-1;
end;
function col(t,i,j:longint):int64;
var k,tg,tg1:longint;
begin
 if f[t,i,j]<>-1 then exit(f[t,i,j]);
 if i=j then
  begin
   f[t,i,j]:=a[i];
   exit(a[i]);
  end;
 if t=1 then
  begin
   tg:=-100000;
   for k:=i to j-1 do
    begin
     if b[k]='+' then tg:=max(col(1,i,k)+col(1,k+1,j),tg);
     if b[k]='-' then tg:=max(col(1,i,k)-col(2,k+1,j),tg);
     if b[k]='*' then
      begin
       tg1:=max(col(1,i,k)*col(2,k+1,j),max(col(1,i,k)*col(1,k+1,j),max(col(2,i,k)*col(2,k+1,j),col(1,k+1,j)*col(2,i,k))));
       tg:=max(tg,tg1);
      end;
    end;
  end;
 if t=2 then
  begin
   tg:=maxlongint;
   for k:=i to j-1 do
    begin
     if b[k]='+' then tg:=min(col(2,i,k)+col(2,k+1,j),tg);
     if b[k]='-' then tg:=min(col(2,i,k)-col(1,k+1,j),tg);
     if b[k]='*' then
      begin
       tg1:=min(col(1,i,k)*col(2,k+1,j),max(col(1,i,k)*col(1,k+1,j),max(col(2,i,k)*col(2,k+1,j),col(1,k+1,j)*col(2,i,k))));
       tg:=min(tg,tg1);
      end;
    end;
   end;
  f[t,i,j]:=tg;
  exit(f[t,i,j]);
end;
BEGIN
  assign(input,'express.inp');reset(input);
  assign(output,'express.out');rewrite(output);
  nhap;
  write(col(2,1,(l+1)div 2));
  close(input);close(output);
END.


