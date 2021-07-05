{$H+}
uses math;
const oo=10000000000;
var n,dem,tt:longint;
    st:String;
    len,res,res1,kq,q,tt1,tt2:array[0..1000000] of int64;
    free:array[0..1000000] of boolean;
procedure nhap;
var i,l:longint;
begin
 readln(n);
 readln(st);
 l:=length(st);
 for i:=1 to l do
 if st[i]='#' then inc(dem)
 else
 if dem<>0 then
  begin
   inc(tt);
   len[tt]:=dem;
   dem:=0;
  end;
 if st[n]='#' then
  begin
   inc(tt);
   len[tt]:=dem;
   dem:=0;
  end;
end;

procedure xuli;
var i,j,k:longint;
begin
  dem:=0;
  for i:=1 to tt do
   for k:=1 to len[i] do
    if free[(len[i]-1) div k]=false then
     begin
      free[(len[i]-1) div k]:=true;
      inc(dem);
      q[dem]:=(len[i]-1) div k;
     end;


 for i:=1 to tt do
 begin
   for k:=1 to len[i] do
    begin
     tt1[(len[i]-1) div k]:=oo;
     tt2[(len[i]-1) div k]:=0;
    end;
  for k:=1 to len[i] do
   begin
    tt2[(len[i]-1) div k]:=max(tt2[(len[i]-1) div k],k);
    tt1[(len[i]-1) div k]:=min(tt1[(len[i]-1) div k],k);
   end;
  for k:=1 to dem do
  if (tt2[q[k]]<>0) and (tt1[q[k]]<>oo) then
   begin
    res[q[k]]:=res[q[k]]+tt2[q[k]];
    res1[q[k]]:=res1[q[k]]+tt1[q[k]];
   end;
 end;


  for i:=1 to n do kq[i]:=oo;
  for i:=1 to dem do
   for j:=res1[q[i]] to res[q[i]] do kq[j]:=min(kq[j],q[i]);
  for i:=1 to n do
   if kq[i]=oo then kq[i]:=-1;
  for i:=1 to n do write(kq[i],' ');
end;
begin
 assign(input,'wpaint.inp');reset(input);
 assign(output,'wpaint.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
{Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=res[(l+r) div 2];
    repeat
      while res[i] < key do inc(i);
      while res[j] > key do dec(j);
      if i <= j then
      Begin
      doicho([i],[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;}