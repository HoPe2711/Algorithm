uses math;
var m,n,sttmax:longint;
    s:array[1..100] of longint;
    f:array[1..101,0..1023] of longint;
    dd:array[1..101,0..1023] of boolean;
    p:array[1..4,2..5] of longint;
function batbit(x,i:longint):longint;
 begin
  exit(x or (1 shl (i-1)));
 end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr (i-1)));
end;
function dembit(j:longint):longint;
var i,s:longint;
begin
 s:=0;
 for i:=1 to m do
  if getbit(j,i)=1 then inc(s);
 exit(s);
end;
procedure nhap;
var i,j,cnt:longint;
    c:char;
begin
 readln(m,n);
 for i:=1 to m do
  begin
   for j:=1 to n do
    begin
     read(c);
     if c='x' then s[j]:=batbit(s[j],i);
    end;
   readln;
  end;
 sttmax:=2**m-1;
 cnt:=0;
 for i:=1 to m-1 do
  for j:=i+1 to m do
   begin
    inc(cnt);
    p[i,j]:=cnt;
   end;
end;
function check(i,stt,j:longint):boolean;
var k,h:longint;
begin
 if j and s[i] <> 0 then exit(false);
 for k:=1 to m-1 do
  for h:=k+1 to m do
   if getbit(j,k) and getbit(j,h)=1 then
    if getbit(stt,p[k,h])=1 then exit(false);
 exit(true);
end;
function sttcap(stt,j:longint):longint;
var h,k:longint;
begin
 sttcap:=stt;
 for h:=1 to m-1 do
  for k:=h+1 to m do
   if getbit(j,k) and getbit(j,h)=1 then sttcap:=batbit(sttcap,p[h,k]);
end;
function cal(i,stt:longint):longint;
var tg,j:longint;
begin
 tg:=0;
 if dd[i,stt] then exit(f[i,stt]);
 dd[i,stt]:=true;
 if i=n+1 then exit(0);
 for j:=0 to sttmax do
  if check(i,stt,j) then
   tg:=max(tg,cal(i+1,sttcap(stt,j))+dembit(j));
 f[i,stt]:=tg;
 exit(tg);
end;
begin
 assign(input,'stone.inp');reset(input);
 assign(output,'stone.out');rewrite(output);
 nhap;
 write(cal(1,0));
 close(input);close(output);
end.
