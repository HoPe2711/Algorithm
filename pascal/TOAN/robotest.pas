{$H+}
uses math;
var st,st1:string;
    n,m,res,tt,tt1:longint;
    l,r:array[0..100000] of longint;
    free:array[0..100000] of boolean;
procedure nhap;
var i,last,t:longint;
begin
 readln(n,m);
 readln(st);
 last:=0;
 for i:=1 to n do
  begin
   if st[i]='#' then last:=i;
   if st[i]='D' then l[i]:=i-last;
 end;
 last:=n+1;
 for i:=n downto 1 do
  begin
   if st[i]='#' then last:=i;
   if st[i]='D' then r[i]:=last-i;
  end;
 readln(st1);  tt1:=n+1;  tt:=0;
 t:=0;
 for i:=1 to m do
 begin
  if st1[i]='L' then dec(t)
  else inc(t);
  tt:=max(tt,t);
  tt1:=min(tt1,t);
 end;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  if st[i]='D' then
  if (-l[i]<tt1) and (r[i]>tt) then
   begin
    free[i]:=true;
    inc(res);
   end;
 writeln(res);
 for i:=1 to n do
  if free[i] then write(i,' ');
end;
begin
 assign(input,'robotest.inp');reset(input);
 assign(output,'robotest.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.