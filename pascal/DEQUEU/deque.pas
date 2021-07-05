uses math;
var n,k,front,rear:longint;
    res:int64;
   a,queu:array[0..5000000] of int64;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
procedure push(i:longint);
begin
 while (front<=rear) and (a[queu[rear]]<=a[i]) do dec(rear);
 inc(rear);
 queu[rear]:=i;
end;
procedure xuli;
var i:longint;
begin
 front:=1;
 for i:=1 to k-1 do push(i);
 for i:=k to n do
  begin
   push(i);
   if queu[front] < (i-k+1) then inc(front);
   res:=
  end;
  write(res);
end;
begin
 assign(input,'deque.inp');reset(input);
 assign(output,'deque.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
