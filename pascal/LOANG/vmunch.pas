uses math;
var n,m,kq1,kq,x,y,f,r:longint;
    ch:char;
    a,d:array[1..101,1..101] of longint;
    queu,queu1:array[1..10000] of longint;
    free:array[1..101,1..101] of boolean;
procedure nhap;
var i,j:longint;
begin
 fillchar(free,sizeof(free),true);
 readln(n,m);
 a[1,1]:=0;
 for i:=1 to n do
  begin
  for j:=1 to m do
   begin
    read(ch);
    if ch='*' then
     begin
      free[i,j]:=false;
      a[i,j]:=1;
     end;
    if ch='C' then
     begin
      kq:=i;
      kq1:=j;
      a[i,j]:=0;
     end;
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
   free[x,y]:=false;
   if y<m then
    if (a[x,y+1]=0) and (free[x,y+1]) then
     begin
      d[x,y+1]:=d[x,y]+1;
      free[x,y+1]:=false;
      push(x,y+1);
     end;
   if x<n then
    if (a[x+1,y]=0) and (free[x+1,y]) then
     begin
      d[x+1,y]:=d[x,y]+1;
      free[x+1,y]:=false;
      push(x+1,y);
     end;
   if (y>1) and (a[x,y-1]=0) then
    if free[x,y-1] then
     begin
      d[x,y-1]:=d[x,y]+1;
      free[x,y-1]:=false;
      push(x,y-1);
     end;
   if (x>1) and (a[x-1,y]=0) then
    if free[x-1,y] then
     begin
      d[x-1,y]:=d[x,y]+1;
      free[x-1,y]:=false;
      push(x-1,y);
     end;
  end;
end;
procedure xuli;
begin
 f:=1;
 BFS(1,1);
 write(d[kq,kq1]);
end;
begin
 //assign(input,'VMUNCH.inp');reset(input);
// assign(output,'VMUNCH.out');rewrite(output);
 nhap;
 xuli;
// close(input);
// close(output);
end.
