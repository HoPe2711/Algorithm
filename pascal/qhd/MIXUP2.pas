uses math;
var n,k:longint;
    a:array[0..16] of longint;
    f:array[0..16,0..16,0..66000] of int64;
    dd:array[0..16,0..16,0..66000] of boolean;
procedure nhap;
var i,j:longint;
begin
 read(n,k);
  for i:=1 to n do readln(a[i]);
end;
function batbit(x,i:longint):longint;
 begin
  exit(x or (1 shl i));
 end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
function cal(c,last,stt:longint):int64;
var i:longint;
    tg:int64;
begin
 tg:=0;
 if dd[c,last,stt] then exit(f[c,last,stt]);
 dd[c,last,stt]:=true;
 if c=0 then tg:=1
 else
 for i:=1 to n do
   if ((getbit(stt,i)=0) and (abs(a[i]-a[last]) > k)) or (last=0) then tg:=tg+cal(c-1,i,batbit(stt,i));
 f[c,last,stt]:=tg;
 exit(f[c,last,stt]);
end;
begin
 assign(input,'');reset(input);
 assign(output,'');rewrite(output);
 nhap;
 write(cal(n,0,0));
 close(input); close(output);
end.
