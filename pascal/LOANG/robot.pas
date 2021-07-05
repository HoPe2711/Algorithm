uses math;
const oo=1000000000;
     huong:array[1..4] of longint=(1,0,-1,0);
     huong1:array[1..4] of longint=(0,1,0,-1);
var n,u1,v1,s1,t1,f,r,x,y,z,t,res,res1:longint;
    q,q1,q2,q3:array[-20000000..20000000] of longint;
    d:array[0..1001,0..1001,0..4,0..1] of longint;
    dd,dd1:array[0..1001,0..1001,1..4] of longint;
    a:array[00..1000,0..1000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
  for j:=1 to n do read(a[i,j]);
 read(u1,v1,s1,t1);
end;

procedure push(x,y,z,t:longint);
begin
 inc(r); q[r]:=x; q1[r]:=y; q2[r]:=z; q3[r]:=t;
end;
procedure pack(x,y,z,t:longint);
begin
 dec(F);
 q[f]:=x; q1[f]:=y; q2[f]:=z; q3[f]:=t;
end;
procedure pop;
begin
 x:=q[f];
 y:=q1[f];
 z:=q2[f];
 t:=q3[f];
 inc(f);
end;
procedure BFS(u,v:longint);
var i,j,p,k,tt:longint;
begin
 f:=1; r:=0;
 for i:=1 to  n do
  for j:=1 to n do
  begin
   for p:=1 to 4 do dd[i,j,p]:=oo;
   for p:=1 to 4 do
   for k:=0 to 1 do d[i,j,p,k]:=oo;
  end;
 for p:=1 to 4 do
  begin
   d[u,v,p,0]:=0;
   push(u,v,p,0);
  end;
 while f<=r do
  begin
   pop;
   for p:=1 to 4 do
    begin
     u:=x+huong[p];
     v:=y+huong1[p];
     if (u>=1) and (v>=1) and (u<=n) and (v<=n) then
      begin
       if (a[u,v]=1) and (T=1) then continue;
       if (a[u,v]=1) then tt:=1 else tt:=t;
       if (a[u,v]=1) and (t=0) then
        begin
         if p<>z then dd[u,v,p]:=min(d[x,y,z,t]+1,dd[u,v,p])
         else dd[u,v,z]:=min(dd[u,v,z],d[x,y,z,t]);
        end;
       if p=z then
        begin
         if d[u,v,p,tt]>d[x,y,z,t] then
          begin
           d[u,v,p,tt]:=d[x,y,z,t];
           pack(u,v,p,tt);
          end;
        end
       else
        begin
         if d[u,v,p,tt]>d[x,y,z,t]+1 then
          begin
           d[u,v,p,tt]:=d[x,y,z,t]+1;
           push(u,v,p,tt);
          end;
        end;
      end;
    end;
  end;
end;


procedure xuli;
var  i,j,k,k1,ok:longint;
begin
 BFS(u1,v1);
 res:=oo;
 for i:=1 to 4 do res:=min(res,d[s1,t1,i,0]);
 write(res,' ');
 res:=oo;
 for i:=1 to 4 do res:=min(res,d[s1,t1,i,1]);
 write(res,' ');
 dd1:=dd;
 bfs(s1,t1);
 for i:=1 to n do
  for j:=1 to n do
   if a[i,j]=1 then
   begin
    ok:=0;
    for k:=1 to 4 do
     for k1:=1 to 4 do
     if (dd[i,j,k]<>oo) and (dd1[i,j,k1]<>oo) then
     begin
      if (abs(k-k1)=2) and (dd[i,j,k]+dd1[i,j,k1]=res)  then ok:=1
      else if dd[i,j,k]+dd1[i,j,k1]+1=res then ok:=1;
     end;
    if ok=1 then inc(res1);
   end;
  write(REs1);
end;
begin
 assign(input,'robot.inp');reset(input);
 assign(output,'robot.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
