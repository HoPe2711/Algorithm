{$H+}
uses math;
type arr=array[0..31] of longint;
var kq,n,k,res:longint;
    a,s:array[0..31,0..100001] of longint;
    pos:array[0..100001] of longint;
    b:array[0..100001,0..31] of longint;
function getbit(x:int64;i:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure nhap;
var i,j,t:longint;
    x:int64;
begin
 read(n,k);
 for i:=1 to n do
  begin
   read(x);
   for j:=1 to k do a[j,i]:=getbit(x,j-1);
  end;
end;
function ss(a,b:arr):longint;
var i:longint;
begin
 for i:=1 to k do
  if a[i]<b[i] then exit(2)
  else if a[i]>b[i] then exit(1);
 exit(0);
end;
Procedure doicho(var x,y:arr);
Var
  tg:arr;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure doicho1(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
 i,j:longint;
 key,key2:longint;
 key1:arr;
Begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 key1:=b[key];
 key2:=pos[key];
 repeat
  while (ss(b[i],key1)=2) or ( (ss(b[i],key1)=0) and (pos[i]<key2) ) do inc(i);
  while (ss(b[j],key1)=1) or ( (ss(b[j],key1)=0) and (pos[j]>key2) ) do dec(j);
   if i <= j then
    Begin
     doicho(b[i],b[j]);
     doicho1(pos[i],pos[j]);
     inc(i);
     dec(j);
    End;
 until i > j;
 if l < j then Qsort(l,j);
 if i < r then Qsort(i,r);
End;
function check(x:Arr):boolean;
var i:longint;
begin
 for i:=1 to k do
  if x[i]<>0 then exit(false);
 exit(true);
end;
procedure xuli;
var i,j,last,dem:longint;
    x:string;
begin
 for i:=1 to k do
  for j:=1 to n do
   if a[i,j]=1 then s[i,j]:=s[i,j-1]+1
   else s[i,j]:=s[i,j-1];
 for i:=1 to k do
  for j:=1 to n do
   begin
    b[j,i]:=s[i,j]-s[1,j];
    pos[j]:=j;
   end;
 for i:=1 to n do
  if check(b[i]) then
   begin
    res:=1;
    break;
   end;
 qsort(0,n);
 {for i:=1 to k do
  begin
   for j:=1 to n do write(s[i,j],' ');
   writeln;
  end;
 for i:=1 to n do
  begin
   for j:=1 to k do write(b[i,j],' ');
   writeln;
  end;        }
 for i:=1 to k do b[n+1,i]:=-1;
 last:=0; dem:=0;
 for i:=0 to n do
  begin
   if dem=0 then
    begin
     last:=pos[i];
     inc(dem);
    end;
   if dem>1 then
    if (ss(b[i],b[i+1])<>0) and (dem>1) then
     begin
      res:=max(res,pos[i]-last);
      last:=pos[i+1];
     end;
   if ss(b[i],b[i+1])=0 then inc(dem)
   else dem:=0;
  end;
 write(res);
end;
begin
 assign(input,'funbit.inp');reset(input);
 assign(output,'funbit.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
