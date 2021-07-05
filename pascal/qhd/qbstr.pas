uses math;
VAR la,lb,res:longint;
    st1,st2:string;
    f:array[0..255,0..256] of longint;
    nxt:array[0..256,#0..#255] of longint;
procedure nhap;
begin
 readln(st1);
 readln(st2);
 la:=length(st1);
 lb:=length(st2);
end;
procedure xuli;
var i,j,t:longint;
    ch:char;
begin
 for ch:=#0 to #255 do nxt[la,ch]:=la+1;
 for i:=la-1 downto 0 do
  begin
    nxt[i]:=nxt[i+1];
   nxt[i,st1[i+1]]:=i+1;
  end;
 f[min(la,lb),lb]:=high(longint);
 f[0,0]:=0;
 for t:=0 to min(la,lb) do
  for j:=0 to lb do
   if f[t,j] <> high(longint) then
    begin
     f[t,j]:=min(f[t,j+1],f[t,j]);
     if nxt[f[t,j],st2[j+1]]<=la then f[t+1,j+1]:=min(f[t,j],nxt[f[t,j],st2[j+1]])
    end;
 for t:=0 to min(la,lb) do
  for j:=0 to lb do res:=max(res,t);
 write(res);
end;
BEGIN
  assign(input,'qbstr.inp');reset(input);
  assign(output,'qbstr.out');rewrite(output);
  while not seekeof (input) do
   begin
    nhap;
    xuli;
   end;
  close(input);close(output);
END.
