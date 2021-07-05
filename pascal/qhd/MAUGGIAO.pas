uses math;
var n,res,kq:longint;
    a:array[0..20,0..20] of longint;
    f,c:array[0..20,0..1050000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
  for i:=1 to n do
   begin
    for j:=0 to n-1 do read(a[i,j]);
    readln;
   end;
end;
function batbit(x,i:longint):longint;
 begin
  exit(x or (1 shl i));
 end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure xuli;
var i,j,stt,stt2:longint;
begin
 for i:=0 to n-1 do
  begin
   f[1,batbit(0,i)]:=a[1,i];
   c[1,batbit(0,i)]:=1;
  end;
 for i:=1 to n do
  for stt:=0 to 2**n-1 do
   if f[i,stt]<>0 then
    for j:=0 to n-1 do
     if getbit(stt,j)=0 then
      begin
       stt2:=batbit(stt,j);
       if  f[i+1,stt2]<f[i,stt]+a[i+1,j] then
        begin
         f[i+1,stt2]:=f[i,stt]+a[i+1,j];
         c[i+1,stt2]:=c[i,stt];
        end
       else if  f[i+1,stt2]=f[i,stt]+a[i+1,j] then c[i+1,stt2]:=c[i,stt]+c[i+1,stt2];
      end;
 for i:=0 to 2**n-1 do
  begin
   res:=max(res,f[n,i]);
  end;
 writeln(res);
 for i:=0 to 2**n-1 do
 if f[n,i]=res then kq:=kq+c[n,i];
 write(kq);
end;
begin
 assign(input,'');reset(input);
 assign(output,'');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
