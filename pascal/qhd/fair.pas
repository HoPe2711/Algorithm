{$H+}
var  st:String;
     n:longint;
     f,g:array[0..300001,0..1] of longint;
procedure nhap;
var i,tt,tt1:longint;
begin
 readln(st);
 n:=length(St);
 for i:=1 to n do
  if st[i]='1' then
   begin
    if i mod 2=0 then
     begin
      f[i,0]:=f[i-1,0]+1;
      f[i,1]:=f[i-1,1];
     end
    else
     begin
      f[i,1]:=f[i-1,1]+1;
      f[i,0]:=f[i-1,0];
     end;
   end
  else
   begin
    f[i,1]:=f[i-1,1];
    f[i,0]:=f[i-1,0];
   end;
 for i:=n downto 1 do
  if st[i]='1' then
   begin
    if i mod 2=0 then
     begin
      g[i,0]:=g[i+1,0]+1  ;
      g[i,1]:=g[i+1,1];
     end
    else
     begin
      g[i,1]:=g[i+1,1]+1;
      g[i,0]:=g[i+1,0];
     end
   end
  else
   begin
    g[i,1]:=g[i+1,1];
    g[i,0]:=g[i+1,0];
   end;
 for i:=1 to n do
  begin
   tt:=f[i-1,0]+g[i+1,1];
   tt1:=f[i-1,1]+g[i+1,0];
   if tt=tt1 then
    begin
     write(i);
     exit;
    end;
  end;
 write(0);
end;
begin
 assign(input,'fair.inp');reset(input);
 assign(output,'fair.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
