uses math;
var n,k,front,rear,res,front1,rear1,kq:longint;
    queu,a,queu1:array[1..100000] of longint;
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
procedure push2(i:longint);
begin
 while (front1<=rear1) and (a[queu1[rear1]]<=a[i]) do dec(rear1);
 inc(rear1);
 queu1[rear1]:=i;
end;
procedure xuli;
var i:longint;
begin
 front:=1;
 res:=0;
 front1:=1;
 for i:=1 to n do
  begin
   push(i);
   push2(i);
   if queu[front] < (i-k) then inc(front);
   if queu1[front1] < (i-k) then inc(front1);
   res:=max(res,max(abs(a[queu1[front1]]-a[i]),abs(a[i]-a[queu[front]])));
  end;
 write(res);
end;
begin
 assign(input,'vila2.inp');reset(input);
 assign(output,'vila2.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
