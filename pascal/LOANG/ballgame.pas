uses math;
const  oo=1000000000;
       q:arrAy[1..4] of longint=(1,-1,0,0);
       q1:array[1..4] of longint=(0,0,1,-1);
var n,res,ok,m,f,r,x,y:longint;
    FREE,d:array[0..200,0..200] of longint;
    ts:Array[0..200,0..200] of int64;
    d1:array[0..200,0..200,0..200] of longint;
    queu,queu1:Array[0..2000000] of longint;
    vt,vt1:array[0..200] of longint;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(u,v); free[u,v]:=1;
  end;
 read(m);
 ok:=0;
 for i:=1 to m do
  begin
   read(vt[i],vt1[i]);
   if (vt[i]>100) or (Vt1[i]>100) or (vt[i]<=0) or (vt1[i]<=0) then ok:=1;
  end;
end;
procedure push(x,y:longint);
begin
 inc(r);
 queu[r]:=x; queu1[r]:=y;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(F);
end;
procedure BFS(s,s1:longint);
var i,j,u,v:longint;
begin
 for i:=0 to 101 do
  for j:=0 to 101 do d[i,j]:=oo;
 d[s,s1]:=0;
 f:=1; r:=0;
 push(s,s1);
 while f<=r do
  begin
   pop;
   for i:=1 to 4 do
    begin
     u:=x+q[i];
     v:=y+q1[i];
     if (u>=0) and (u<=101) and (v>=0) and (v<=101) then
      if free[u,v]=0 then
       if d[u,v]>d[x,y]+1 then
        begin
         d[u,v]:=d[x,y]+1;
         push(u,v);
        end;
    end;
  end;
end;
procedure xuli;
var  i,j,k,tmp,pp:longint;
begin
 res:=oo;
 for i:=1 to m do
  begin
   BFS(Vt[i],vt1[i]);
   for j:=0 to 101 do
    for k:=0 to 101 do d1[i,j,k]:=d[j,k];
  end;
 for i:=0 to 101 do
  for j:=0 to 101 do
   begin
    tmp:=0;      pp:=0;
    for k:=1 to m do
    if d1[k,i,j]<>oo then tmp:=tmp+d1[k,i,j]
    else
     begin
      pp:=1; break;
     end;
    if pp=0 then res:=min(Res,tmp);
   end;
 if res=oo then
  begin
   write(-1);
   exit;
  end;
 write(res);
end;
procedure xuli1;
var i,j,k,ans,ans1:longint; tmp,res1:int64;
begin
 res1:=high(int64);
 for i:=1 to m do
  begin
   ans:=vt[i];
   for j:=1 to m do
    begin
     ans1:=vt1[j];
     tmp:=0;
     for k:=1 to m do tmp:=tmp+abs(vt[k]-ans)+abs(vt1[k]-ans1);
     res1:=min(REs1,tmp);
    end;
  end;
 write(Res1);
end;
begin
 assign(input,'ballgame.inp');reset(input);
 assign(output,'ballgame.out');rewrite(output);
 nhap;
 if ok=0 then xuli
 else xuli1;
 close(input); close(output);
end.