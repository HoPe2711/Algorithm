var rear,front,n,k:longint;
    a,queu:array[0..500000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,k);
 for i:=1 to n do read(a[i]);
end;
procedure push(i:longint);
begin
 while (rear>=front) and (a[i]<=a[queu[rear]]) do dec(rear);
 inc(rear);
 queu[rear]:=i;
end;
procedure xuli;
var i:longint;
begin
 rear:=0;
 front:=1;
 for i:=1 to k-1 do push(i);
 for i:=k to n do
  begin
   push(i);
   if queu[front]+k<=i then inc(front);
   writeln(a[queu[front]]);
  end;
end;
BEGIN
  assign(input,'minimum.inp');reset(input);
  assign(output,'minimum.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
