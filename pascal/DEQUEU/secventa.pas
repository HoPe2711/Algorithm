uses math;
var n,k,front,rear,res:longint;
    dau,cuoi:int64;
   a,queu:array[0..500000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
procedure push(i:longint);
begin
 while (front<=rear) and (a[queu[rear]]>=a[i]) do dec(rear);
 inc(rear);
 queu[rear]:=i;
end;
procedure xuli;
var i:longint;
begin
 front:=1;
 res:=low(longint);
 for i:=1 to k-1 do push(i);
 for i:=k to n do
  begin
   push(i);
   if queu[front] < (i-k+1) then inc(front);
   if res<=a[queu[front]] then
    begin
     res:=a[queu[front]];
     dau:=i-k+1;
     cuoi:=i;
    end;
  end;
{ dau:=cc;
 for i:=2 to k do
   if (a[cc]<a[cc-i+1]) then dau:=dau-1
   else break;
 if dau<1 then dau:=1;
 cuoi:=dau+k-1;                          }
 write(dau,' ',cuoi,' ',res);
end;
begin
 assign(input,'secventa.inp');reset(input);
 assign(output,'secventa.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
