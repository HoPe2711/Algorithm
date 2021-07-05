{$H+}
uses math;
const q1:array[1..4] of longint=(1,-1,0,0);
      q2:array[1..4] of longint=(0,0,-1,1);
var m,n,q,x,y,r,f:longint;
    st:string;
    a,d:array[0..1000,0..1000] of longint;
    queu,queu1:array[-1000000..1000000] of longint;
    free:array[0..1000,0..1000] of boolean;
procedure nhap;
var i,tt,j:longint;
begin
 readln(m,n,q);
 for i:=1 to m do
 begin
  readln(st);
  tt:=length(st);
  for j:=1 to tt do
   if st[j]<>'*' then a[i,j]:=ord(st[j])
   else a[i,j]:=0;
 end;
end;
procedure push(i,j:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
end;
procedure back(i,j:longint);
begin
 dec(f);
 queu[f]:=i;
 queu1[f]:=j;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure BFS;
var t,u,v:longint;
begin
 while f<=r do
  begin
   pop;
   for t:=1 to 4 do
    begin
     u:=x+q1[t];
     v:=y+q2[t];
     if (u<=m) and (v<=n) and (u>=1) and (v>=1) then
     begin
      if (a[u,v]=a[x,y]) and (d[u,v]>d[x,y]) then
       begin
        d[u,v]:=d[x,y];
        back(u,v);
       end;
      if (a[u,v]<>a[x,y]) and (d[u,v]>d[x,y]+1)  then
       begin
        d[u,v]:=d[x,y]+1;
        push(u,v);
       end;
      end;
    end;
  end;
end;
procedure xuli;
var i,j,tt,tt1:longint;
begin
 f:=1;r:=0;
 for i:=1 to m do
  for j:=1 to n do d[i,j]:=1000000;
 for i:=1 to m do
  for j:=1 to n do
  if a[i,j]=0 then
   begin
    d[i,j]:=0;
    push(i,j);
   end;
 BFS;
 for i:=1 to q do
  begin
   read(tt,tt1);
   writeln(d[tt,tt1]);
  end;
end;
begin
 assign(input,'PATHGAME.inp');reset(input);
 assign(output,'PATHGAME.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.