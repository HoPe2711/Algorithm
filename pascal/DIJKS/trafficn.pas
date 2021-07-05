uses math;
const oo=1000000000;
var ke,next,head,ts,heap,tt,free:array[-200000..200000] of longint;
    d,pos:array[0..10000,0..1] of longint;
    n,m,k,s,t,res,h,test,nheap,x,y:longint;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 fillchar(ke,sizeof(ke),0);
 fillchar(next,sizeof(next),0);
 fillchar(head,sizeof(head),0);
 fillchar(free,sizeof(free),0);
 fillchar(pos,sizeof(pos),0);
 read(n,m,k,s,t);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
 for i:=1 to k do
  begin
   read(u,v,c);
   add(i+m,u,v,c);
   add(-i-m,v,u,c);
   free[i+m]:=1; free[-i-m]:=1;
  end;
end;


procedure khoitao;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=0 to 1 do d[i,j]:=oo;
 d[s,0]:=0;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i],tt[i]]>d[heap[i div 2],tt[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(tt[i],tt[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j],tt[j]]>d[heap[j+1],tt[j+1]]) then inc(j);
 if d[heap[i],tt[i]]>d[heap[j],tt[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(tt[i],tt[j]);
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
 pos[heap[1],tt[1]]:=1;
 dec(nheap);
 downheap(1);
end;


procedure xuli;
var j,v:longint;
begin
 khoitao;
 push(s,0);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if (free[j]=0) and (y=1) then
     if d[v,1]>d[x,y]+ts[j] then
     begin
      d[v,1]:=d[x,y]+ts[j];
      if pos[v,1]=0 then push(v,1)
      else upheap(pos[v,1]);
     end;
    if (y=0) then
     if d[v,free[j]]>d[x,y]+ts[j] then
      begin
       d[v,free[j]]:=d[x,y]+ts[j];
       if pos[v,free[j]]=0 then push(v,free[j])
       else upheap(pos[v,free[j]]);
      end;
    j:=next[j];
   end;
 until nheap=0;
 res:=min(d[t,0],d[t,1]);
 if res=oo then res:=-1;
 writeln(res);
end;


begin
 //assign(input,'trafficn.inp'); reset(input);
 read(test);
 for h:=1 to test do
  begin
   nhap;
   xuli;
  end;
 //close(input);
end.