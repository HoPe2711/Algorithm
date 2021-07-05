uses math;
VAR la,lb,res,n:longint;
    a,b:string;
    f:array[0..255,0..256] of longint;
    nxt:array[0..256,#0..#255] of longint;
procedure nhap;
begin
 readln(n);
 readln(a);
 readln(b);
 la:=length(a);
 lb:=length(b);
end;
procedure xuli;
var i,j,t:longint;
    ch:char;
begin
 res:=0;
 for ch:=#0 to #255 do nxt[la,ch]:=la+1;
 for i:=la-1 downto 0 do
  begin
   nxt[i]:=nxt[i+1];
   nxt[i,a[i+1]]:=i+1;
  end;
 for t:=0 to min(la,lb) do
  for j:=0 to lb do f[t,j]:=high(longint);
 f[0,0]:=0;
 for t:=0 to min(la,lb)-1 do
  for j:=0 to lb-1 do
   if f[t,j] <> high(longint) then
    begin
     f[t,j+1]:=min(f[t,j+1],f[t,j]);
     if nxt[f[t,j],b[j+1]]<=la then f[t+1,j+1]:=min(f[t+1,j+1],nxt[f[t,j],b[j+1]])
    end;
 for t:=0 to min(la,lb) do
   if f[t,lb]<=la then res:=max(res,t);
 writeln(res);
end;
BEGIN
  assign(input,'lcs.inp');reset(input);
  assign(output,'lcs.out');rewrite(output);
  while not seekeof (input) do
   begin
    nhap;
    xuli;
   end;
  close(input);close(output);
END.
