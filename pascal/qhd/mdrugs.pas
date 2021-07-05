{$H+}
uses math;
VAR la,lb,res,n,kq:longint;
    a,b:string;
    f:array[0..500,0..500] of longint;
    nxt:array[0..500,'A'..'Z'] of longint;
procedure xuli;
var j,t:longint;
begin
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
end;
procedure nhap;
var i,j:longint;
    ch:char;
begin
 readln(n);
 kq:=0;
 readln(a);
 la:=length(a);
 res:=0;
 for ch:='A' to 'Z' do nxt[la,ch]:=la+1;
 for i:=la-1 downto 0 do
  begin
   nxt[i]:=nxt[i+1];
   nxt[i,a[i+1]]:=i+1;
  end;
 for i:=1  to n do
  begin
   readln(b);
   lb:=length(b);
   xuli;
   kq:=max(res,kq);
  end;
end;
BEGIN
  assign(input,'mdrugs.inp');reset(input);
  assign(output,'mdrugs.out');rewrite(output);
  while not seekeof (input) do
   begin
    nhap;
    writeln(kq);
   end;
  close(input);close(output);
END.
