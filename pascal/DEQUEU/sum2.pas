uses math;
var res,front,n,l,u ,rear:longint;
    a,queu:array[0..100001] of longint;
    sum:array[0..100001] of int64;
procedure nhap;
var  i:longint;
begin
 read(n,l,u);
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
  end;
end;
procedure push(i:longint);
begin
 while (front<=rear) and (sum[queu[rear]] >=sum[i]) do dec(rear);
 inc(rear);
 queu[rear]:=i;
end;
procedure xuli;
var i:longint;
begin
 front:=1;
 res:=low(longint);
 for i:=l to n do
  begin
   push(i-l);
   if queu[front] < i-u then inc(front);
   res:=max(res,sum[i]-sum[queu[front]]);
  end;
 write(res);
end;
begin
 assign(input,'sum2.inp');reset(input);
 assign(output,'sum2.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
