uses math;
var a,d:array[0..1001,0..1001] of longint;
    queu,queu1:array[0..1000001] of longint;
    m,n,res,f,r,t,t1,x,y,kq,kq1:longint;
procedure nhap;
var i,j:longint;
   ch:char;
begin
 readln(n,m);
 for i:=1 to n do
 begin
  for j:=1 to m do
   begin
     read(ch);
     if ch='#' then a[i,j]:=1;
   end;
  readln;
 end;
end;
procedure push(i,j:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure BFS(i,j:longint);
begin
 push(i,j);
 while f<=r do
  begin
   pop;
   if y<m then
    if (a[x,y+1]=0) and (d[x,y+1]=0) then
     begin
      d[x,y+1]:=d[x,y]+1;
      push(x,y+1);
     end;
   if x<n then
    if (a[x+1,y]=0) and (d[x+1,y]=0) then
     begin
      d[x+1,y]:=d[x,y]+1;
      push(x+1,y);
     end;
   if (y>1) and (a[x,y-1]=0) then
    if d[x,y-1]=0 then
     begin
      d[x,y-1]:=d[x,y]+1;
      push(x,y-1);
     end;
   if (x>1) and (a[x-1,y]=0) then
    if d[x-1,y]=0 then
     begin
      d[x-1,y]:=d[x,y]+1;
      push(x-1,y);
     end;
  end;
end;
procedure tim;
var i,j:longint;
begin
for i:=1 to n do
 for j:=1 to m do
   if a[i,j]=0 then
    begin
     kq:=i;
     kq1:=j;
     exit;
    end;
end;
procedure xuli;
var i,j,tg:longint;
begin
 f:=1;
 r:=0;
 tim;
 BFS(kq,kq1);
 tg:=d[kq,kq1];
 for i:=1 to n do
  for j:=1 to m do
   if tg<=d[i,j] then
    begin
     t:=i;
     t1:=j;
     tg:=d[i,j];
    end;
 f:=1;
 fillchar(d,sizeof(d),0);
 r:=0;
 BFS(t,t1);
 for i:=1 to n do
  for j:=1 to m do res:=max(d[i,j],res);
 write(res);
end;
begin
 assign(input,'LABYR.inp');reset(input);
 assign(output,'LABYR.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
