var n,k,sum     :longint;
    pos:Array[0..300000] of longint;
procedure nhap;
var i,a,b,tg:longint;
begin
 read(n);
 read(k);
 sum:=n;
 for i:=1 to n do pos[i]:=1;
 for i:=1 to k do
  begin
   read(a,b);
    if a<=n then
     if (pos[a]>pos[b]) then dec(sum)
     else if pos[a]<pos[b] then inc(sum);
    if b<=n then
     if pos[a]>pos[b] then inc(sum)
     else if pos[a]<pos[b] then dec(Sum);
   tg:=pos[a];
   pos[a]:=pos[b];
   pos[b]:=tg;
   writeln(sum);
  end;
end;
begin
 assign(input,'swap.inp');reset(input);
 assign(output,'swap.out');rewrite(output);
 nhap;
 close(input); close(output);
end.