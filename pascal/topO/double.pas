uses math;
var ke,next,ts,head,d,d1:Array[-100000..100000] of longint;
    ddx,ddy:array[1..2,0..100000] of longint;
    free:array[0..100000] of boolean;
    n,k,x,res,kq,y:longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(x);
   if ddx[1,x]=0 then ddx[1,x]:=i
   else ddx[2,x]:=i;
  end;
 for i:=1 to n do
  begin
   read(y);
   if ddy[1,y]=0 then ddy[1,y]:=i
   else ddy[2,y]:=i;
  end;
 for i:=1 to 100000 do
  if ddx[2,i]<>0 then
   begin
    inc(k);
    add(k,ddx[1,i],ddx[2,i],1);
   end
  else if ddy[2,i]<>0 then
   begin
    inc(k);
    add(k,ddy[1,i],ddy[2,i],1)
   end
  else if (ddx[1,i]<>0) and (ddy[1,i]<>0) then
   begin
    inc(k);
    add(k,ddx[1,i],ddy[1,i],0);
   end;
end;
procedure DFS(u,tt:longint);
var v,j:longint;
begin
 if tt=1 then inc(d[res]) else inc(d1[res]);
 free[u]:=false;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if free[v] then
    if ts[j]=1 then  DFS(v,1-tt)
    else DFS(v,tt) ;
   j:=next[j];
  end;
end;
procedure xuli;
var i:longint;
begin
 fillchar(free,sizeof(free),true);
 res:=0;
 for i:=1 to n do
  if free[i] then
   begin
    inc(res);
    DFS(i,1);
    kq:=kq+min(d[res],d1[res]);
   end;
 write(kq);
end;
begin
 assign(input,'DOUBLE.inp');reset(input);
 assign(output,'DOUBLE.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
