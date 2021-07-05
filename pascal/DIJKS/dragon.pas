uses math;
const oo=maxlongint;
var n,m,res,p,x,y,nheap:longint;
    t,ts,head,next,ke,heap,tt:array[-6000..6000] of longint;
    free:array[0..6000] of boolean;
    free1:array[0..6000,0..6000] of boolean;
    d,pos:array[0..6000,0..6000] of longint;
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
var i,u,v,c:longint;
begin
 read(n,m);
 for i:=1 to n do read(t[i]);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;

procedure DFS(u:longint);
var v,j:longint;
begin
 free[u]:=false;
 j:=head[u];
 while j<>0 do
 begin
  v:=ke[j];
  if (t[1]>=ts[j]) and (free[v]) then
   begin
    res:=max(res,t[v]);
    free[v]:=false;
    DFS(v);
   end;
  j:=next[j];
 end;
end;
procedure xuli;
begin
 fillchar(free,sizeof(free),true);
 res:=t[1];
 DFS(1);
 write(res);
end;


procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i],tt[i]]>d[heap[i div 2],tt[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(tt[i],tt[i div 2]);
 doicho(pos[heap[i],tt[i]],pos[heap[i div 2],tt[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j],tt[j]]>d[heap[j+1],tt[j+1]]) then inc(j);
 if (d[heap[i],tt[i]]>d[heap[j],tt[j]]) then
  begin
   doicho(heap[i],heap[j]);
   doicho(tt[i],tt[j]);
   doicho(pos[heap[i],tt[i]],pos[heap[j],tt[j]]);
   downheap(j);
  end;
end;
procedure push(x,i:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 tt[nheap]:=i;
 pos[x,i]:=nheap;
 upheap(nheap);
end;
procedure pop;
begin
 x:=heap[1];
 y:=tt[1];
 heap[1]:=heap[nheap];
 tt[1]:=tt[nheap];
 pos[heap[nheap],tt[nheap]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure khoitao;
var i,j:longint;
begin
 fillchar(free1,sizeof(free1),true);
 for i:=1 to n do
  for j:=1 to n do d[i,j]:=oo;
 d[1,1]:=0;
end;
procedure xuli2;
var v,j,i:longint;
begin
 push(1,1);
 repeat
  pop;
  free1[x,y]:=false;
  j:=head[x];
  while j<>0 do
   begin
    if ts[j]<=t[y] then
    begin
     v:=ke[j];
     if t[v]>t[y] then
      begin
       if (d[v,v]>d[x,y]+ts[j]) and (free1[v,v]) then
        begin
         d[v,v]:=d[x,y]+ts[j];
         if pos[v,v]=0 then push(v,v)
         else upheap(pos[v,v]);
        end;
      end
     else if (d[v,y]>d[x,y]+ts[j]) and (free1[v,y]) then
      begin
       d[v,y]:=d[x,y]+ts[j];
       if pos[v,y]=0 then push(v,y)
       else upheap(pos[v,y]);
      end;
    end;
    j:=next[j];
   end;
  until nheap=0;
  res:=oo;
  for i:=1 to n do res:=min(res,d[n,i]);
  write(res);
end;


begin
 assign(input,'dragon.inp');reset(input);
 assign(output,'dragon.out');rewrite(output);
 read(p);
 if p=1 then
 begin
  nhap;
  xuli;
 end;
 if p=2 then
  begin
   nhap;
   khoitao;
   xuli2;
  end;
 close(input);
 close(output);
end.
