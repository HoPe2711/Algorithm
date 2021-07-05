uses math;
var a:array[0..30,0..30] of longint;
    c:array[0..30,0..32] of longint;
    dd:array[0..30,0..32] of boolean;
    n,res,t,m,h:longint;

procedure nhap;
var tg:longint;
begin
 read(m,n);
 readln;
 if m<n then
  begin
   tg:=m;
   m:=n;
   n:=tg;
  end;
end;

function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;

function check(j,stt:longint):longint;
var i,kq:longint;
    sum:array[0..32] of longint;
begin
 fillchar(sum,sizeof(sum),0);
 kq:= j and stt;
 for i:=1 to n do sum[i]:=getbit(kq,i);
 for i:=1 to n-1 do
  if (sum[i]+sum[i+1]=0) or (sum[i]+sum[i+1]=2) then exit(1);
 exit(0);
end;

procedure xuli;
var i,stt,j:longint;
begin
 for stt:=0 to 32 do c[2,stt]:=1;
 for i:=2 to n do
  for stt:=0 to 32 do
    for j:=0 to 32 do
     if check(j,stt)=0 then c[i+1,j]:=c[i,stt]+c[i+1,j];
 for i:=0 to 2**m-1  do res:=res+c[n+1,i];
 write(res);
end;

begin
 assign(input,'');reset(input);
 assign(output,'');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input); close(output);
end.


