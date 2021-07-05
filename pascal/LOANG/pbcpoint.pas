uses math;
var n,res,f,r,u,v:longint;
    x,y,queu,queu1:array[0..4000000] of longint;
    mind,minc,maxd,maxc:array[-1000..1000] of longint;
    free:array[-1000..1000,-1000..1000] of boolean;
    freed,freec:array[-1000..1000] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(X[i],y[i]);
end;
procedure push(x,y:longint);
begin
 inc(r);
 queu[r]:=x;
 queu1[r]:=y;
end;
procedure pop;
begin
 u:=queu[f];
 v:=queu1[f];
 inc(f);
end;
procedure BFS;
var i:longint;
begin
 f:=1; r:=0;
 for i:=1 to n do
  if free[x[i],y[i]]=false then
   begin
    inc(res);
    free[x[i],y[i]]:=true;
    push(x[i],y[i]);
   end;
 while f<=r do
  begin
   pop;
   if freed[u]=false then
    begin
     mind[u]:=v;
     maxd[u]:=v;
     freed[u]:=true;
    end
   else
    begin
     if mind[u]>v then
      begin
       for i:=v to mind[u] do
        if free[u,i]=false then
         begin
          inc(res);
          push(u,i);
          free[u,i]:=true;
         end;
       mind[u]:=v;
      end;
     if maxd[u]<v then
      begin
       for i:=maxd[u] to v do
        if free[u,i]=false then
         begin
          inc(res);
          push(u,i);
          free[u,i]:=true;
         end;
       maxd[u]:=v;
      end;
    end;
   if freec[v]=false then
    begin
     minc[v]:=u;
     maxc[v]:=u;
     freec[v]:=true;
    end
   else
    begin
     if minc[v]>u then
      begin
       for i:=u to minc[v] do
        if free[i,v]=false then
         begin
          inc(res);
          push(i,v);
          free[i,v]:=true;
         end;
       minc[v]:=u;
      end;
     if maxc[v]<u then
      begin
       for i:=maxc[v] to u do
        if free[i,v]=false then
         begin
          inc(res);
          push(i,v);
          free[i,v]:=true;
         end;
       maxc[v]:=u;
      end;
   end;
  end;
end;
procedure xuli;
begin
 BFS;
 write(res);
end;
begin
 //assign(input,'pbcpoint.inp');reset(input);
 nhap;
 xuli;
 //close(input);
end.