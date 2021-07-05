const q:array[1..4] of longint=(0,0,-1,1);
      q1:array[1..4] of longint=(1,-1,0,0);
var lt,n,r,f,x,y,hv,tamgiac,hbh,ht,dem:longint;
    a:array[0..51,0..51] of longint;
    free,free1:array[0..51,0..51] of boolean;
    queu,queu1,d,k2,k1,dd:array[0..10001] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
  for j:=1 to n do read(a[i,j]);
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
procedure BFS(s,s1:longint);
var u,v,i:longint;
begin
 f:=1;
 r:=0;
 free[s,s1]:=false;
 push(s,s1);
 dd[1]:=a[s,s1];
 while f<=r do
  begin
   pop;
   free[x,y]:=false;
   for i:=1 to 4 do
    begin
     u:=x+q[i];
     v:=y+q1[i];
     if ((u>0) and (u<n+1)) and ((v>0) and (v<n+1))  then
     begin
     if i=1 then
      if ((a[x,y]=0) or (a[x,y]=3)) and ((a[u,v]=1) or (a[u,v]=2)) then
       if free[u,v] then
        begin
         free[u,v]:=false;
         inc(d[lt]);
         dd[d[lt]]:=a[u,v];
         push(u,v);
        end;
     if i=2 then
      if ((a[x,y]=1) or (a[x,y]=2)) and ((a[u,v]=0) or (a[u,v]=3)) then
       if free[u,v] then
        begin
         free[u,v]:=false;
         inc(d[lt]);
         dd[d[lt]]:=a[u,v];
         push(u,v);
        end;
     if i=3 then
      if ((a[x,y]=0) or (a[x,y]=2)) and ((a[u,v]=1) or (a[u,v]=3)) then
       if free[u,v] then
        begin
         free[u,v]:=false;
         inc(d[lt]);
         dd[d[lt]]:=a[u,v];
         push(u,v);
        end;
     if i=4 then
      if ((a[x,y]=1) or (a[x,y]=3)) and ((a[u,v]=0) or (a[u,v]=2)) then
       if free[u,v] then
        begin
         free[u,v]:=false;
         inc(d[lt]);
         dd[d[lt]]:=a[u,v];
         push(u,v);
        end;
      end;
    end;
  end;
end;
procedure check(i:longint);
var x1,y1:longint;
begin
 x1:=k1[i];
 y1:=k2[i];
 if (x1<n) and (y1<n) then
 if (a[x1,y1]=3) and (a[x1,y1+1]=1) then
  if (a[x1+1,y1]=0) and (a[x1+1,y1+1]=2) then inc(hv);
end;
procedure check1(i:longint);
var x1,y1:longint;
begin
 x1:=k1[i];
 y1:=k2[i];
  if (a[x1,y1]=0)  then
   if ((a[x1,y1+1]=2) and (y1<n)) or ((a[x1-1,y1]=3) and (x1>1)) then inc(tamgiac);
  if (a[x1,y1]=1)  then
   if ((a[x1+1,y1]=2) and (x1<n)) or ((a[x1,y1-1]=3) and (y1>1)) then inc(tamgiac);
  if (a[x1,y1]=2)  then
   if ((a[x1,y1-1]=0) and (y1>1)) or ((a[x1-1,y1]=1) and (x1>1)) then inc(tamgiac);
  if (a[x1,y1]=3)  then
   if ((a[x1,y1+1]=1) and (y1<n)) or ((a[x1+1,y1]=0) and (x1<n)) then inc(tamgiac);
end;
function check:boolean;
var  x,y,i:longint;
begin
 x:=0; y:=0;
 for i:=1 to d[lt] do
  begin
   if (dd[i]=0) or (dd[i]=1) then exit(false);
   if dd[i]=2 then inc(x);
   if dd[i]=3 then inc(y);
  end;
 if (x=d[lt]) or (y=d[lt]) then exit(false);
 exit(true);
end;
function check1:boolean;
var  x,y,i:longint;
begin
 x:=0; y:=0;
 for i:=1 to d[lt] do
  begin
   if (dd[i]=2) or (dd[i]=3) then exit(false);
   if dd[i]=0 then inc(x);
   if dd[i]=1 then inc(y);
  end;
 if (x=d[lt]) or (y=d[lt]) then exit(false);
 exit(true);
end;
procedure xuli;
var i,j:longint;
begin
 fillchar(free,sizeof(free),true);
 for i:=1 to n do
  for j:=1 to n do
   if free[i,j] then
    begin
     inc(lt);
     d[lt]:=1;
     BFS(i,j);
     k1[lt]:=i;
     k2[lt]:=j;
     if d[lt]=4 then check(lt);
     if d[lt]=1 then inc(tamgiac);
     if d[lt]=2 then check1(lt);
     if d[lt] mod 2=0 then
      begin
       if (a[i,j]=2) or (a[i,j]=3) then
        if check then inc(hbh);
       if (a[i,j]=0) or (a[i,j]=1) then
        if check1 then inc(hbh);
     end;
    if (d[lt] mod 2=1) and (d[lt]<>1) then
     begin
       if (a[i,j]=2) or (a[i,j]=3) then
        if check then inc(ht);
       if (a[i,j]=0) or (a[i,j]=1) then
        if check1 then inc(ht);
     end;
    end;
  writeln(lt);
  writeln(tamgiac);
  writeln(hv);
  writeln(hbh);
  writeln(ht);
  writeln(lt-tamgiac-hv-ht-hbh);
end;
begin
 assign(input,'BRICK.inp');reset(input);
 assign(output,'BRICK.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
