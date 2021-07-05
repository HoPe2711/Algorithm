uses math;
const base=1000000007;
      q:array[1..4] of longint=(1,-1,0,0);
      q1:array[1..4] of longint=(0,0,1,-1);
      q2:array[1..4] of longint=(1,-1,0,0);
      q3:array[1..4] of longint=(0,0,1,-1);
var x,y,z,n,m,xa,ya,xb,yb,xt,yt,f,r:longint;
    queu,queu1,queu2:array[0..2000000] of longint;
    d,f1:array[0..101,0..101,0..101] of longint;
procedure nhap;
begin
 read(n,m);
 read(xa,ya);
 read(xb,yb);
 read(xt,yt);
end;
function check(u,v:longint):boolean;
begin
 if (u<=n) and (v<=m) and (u>=1) and (v>=1) then exit(true);
 exit(false);
end;
procedure push(i,j,k:longint);
begin
 inc(R);
 queu[r]:=i;
 queu1[r]:=j;
 queu2[r]:=k;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 z:=queu2[f];
 inc(f);
end;
procedure bfs(s,s1,s2:longint);
var i,j,u,v,u1,v1,t,hh:longint;
begin
 f:=1; r:=0;
 push(s,s1,s2);
 d[s,s1,s2]:=1;
 while f<=r do
  begin
   pop;
   //if (x=xa) and (y=ya) and (z=xt) then exit;
   hh:=abs(x-xb)+abs(y-yb)-abs(z-xb);
   t:=hh+yb;
   for i:=1 to 4 do
    begin
     u:=x+q[i]; v:=q1[i]+y;
     if check(u,v) and ((u<>xt) or (v<>yt)) then
     for j:=1 to 4 do
      begin
       u1:=z+q2[j]; v1:=t+q3[j];
       if check(u1,v1) and ((u<>u1) or (v<>v1)) and ((u1<>xa) or (v1<>ya)) then
       if (f1[u,v,u1]=0) then
        begin
         f1[u,v,u1]:=f1[x,y,z]+1;
         d[u,v,u1]:=d[x,y,z];
         push(u,v,u1);
        end
       else if f1[u,v,u1]=f1[x,y,z]+1 then d[u,v,u1]:=(d[u,v,u1]+d[x,y,z]) mod base;
      end;
    end;
   t:=yb-hh;
   if (t>0) and (t<>hh+yb) then
   for i:=1 to 4 do
    begin
     u:=x+q[i]; v:=q1[i]+y;
     if check(u,v) and ((u<>xt) or (v<>yt)) then
     for j:=1 to 4 do
      begin
       u1:=z+q2[j]; v1:=t+q3[j];
       if check(u1,v1) and ((u<>u1) or (v<>v1)) and ((u1<>xa) or (v1<>ya)) then
       if (f1[u,v,u1]=0) then
        begin
         f1[u,v,u1]:=f1[x,y,z]+1;
         d[u,v,u1]:=d[x,y,z];
         push(u,v,u1);
        end
       else if f1[u,v,u1]=f1[x,y,z]+1 then d[u,v,u1]:=(d[u,v,u1]+d[x,y,z]) mod base;
      end;
    end;
  end;
end;
procedure xuli;
begin
 bfs(xb,yb,xb);
 write(d[xa,ya,xt]);
end;
begin
 assign(input,'sqgame.inp');reset(input);
 assign(output,'sqgame.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
