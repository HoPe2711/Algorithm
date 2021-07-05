{$H+}
uses math;
const oo=10000000;
var st:String;
    n,m,res,k:longint;
    a,chose,b:array[0..400] of longint;
    dd:array[0..1] of longint;
procedure nhap;
var i:longint;  ch:char;
begin
 readln(n,m);
 for i:=1 to n do
 begin
  read(ch);
  if ch='1' then a[i]:=1 else a[i]:=0;
 end;
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
function doi(x:longint):longint;
begin
 if x=1 then exit(0);
 exit(1);
end;


procedure xuli;
var tt,dem,i,j,ff:longint;
begin
 k:=1 shl (n div m)-1;
 res:=oo;
 dem:=0;
 for tt:=0 to k do
  begin

   dem:=0;
   for i:=1 to n div m do
   begin
    if getbit(i-1,tt)=1 then
     begin
      inc(dem);
      chose[dem]:=i;
     end;
   end;
   if dem>=res then continue;
   for i:=1 to dem do
   begin
    if i mod 2=dem mod 2 then
     for j:=chose[i-1]*m+1 to chose[i]*m do b[j]:=doi(a[j])
    else
     for j:=chose[i-1]*m+1 to chose[i]*m do b[j]:=a[j];
   end;
   for j:=chose[dem]*m+1 to n do b[j]:=a[j];

   ff:=dem;
   for i:=1 to m do
    begin
     dd[0]:=0; dd[1]:=0;
     j:=i;
     while j<=n do
      begin
       inc(dd[b[j]]);
       inc(j,m);
      end;
     inc(ff,min(dd[0],dd[1]));
     if ff>=res then break;
    end;
   res:=min(res,ff);
  end;

 write(res);
end;
begin
 assign(input,'flipstr.inp');reset(input);
 assign(output,'flipstr.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.

