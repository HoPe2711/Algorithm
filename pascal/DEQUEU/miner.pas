uses math;
var m,n,k,front,rear,l:longint;
    a,b,c:array[-2000..2000,-2000..2000] of longint;
    q:array[0..250000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n,k);
 for i:=1 to m do
  for j:=1 to n do read(a[i-j,i+j]);
end;
procedure xuli;
var i,j:longint;
begin
 l:=2*k+1;
 for i:=1-n-k to m-1+k do
 begin
  front:=1;
  rear:=0;
  for j:=2-k to n+m+k do
   begin
    while (front <= rear) and (a[i,q[rear]] <= a[i,j]) do Dec(rear);
    Inc(rear);
    q[rear] := j;
    if (q[front] + l <= j) then Inc(front);
    if j >= l+1-k  then
     begin
      b[i,j-l+1]:=a[i,q[front]];
     end;
   end;
 end;
 for i:=2-k to m+n+k do
  begin
   front:=1;
   rear:=0;
   for j:=1-n-k to m-1+k do
    begin
        while (front <= rear) and (b[q[rear],i] <= b[j,i]) do Dec(rear);
        Inc(rear);
        q[rear] := j;
        if  (q[front] + l <= j) then Inc(front);
        if j>=l-n-k then
         begin
          c[j-l+1,i]:=b[q[front],i];
         end;
    end;
  end;
end;
procedure inkq;
var i,j:longint;
begin
 for i:=1 to m do
  begin
   for j:=1 to n do write(c[i-j-k,i+j-k],' ');
   writeln;
  end;
end;
BEGIN
  assign(input,'miner.inp');reset(input);
  assign(output,'miner.out');rewrite(output);
  nhap;
  xuli;
  inkq;
  close(input);close(output);
END.

