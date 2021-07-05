uses math;
const oo=1000000000;
var  n,m,res,x,y,nheap,s,t,k:longint;
     ke,next,head,free1,tt,heap,ts:array[-20{0000}..20{0000}] of longint;
     free:array[-10{0000}..10{0000},0..10] of boolean;
     d,pos:array[0..10{0},0..20{00}] of longint;
function batbit(x,i:longint):longint;
begin
 exit(x or (1 shl i));
end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
function tatbit(x,i:longint):longint;
begin
 exit(x and (not(1 shl i)));
end;

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
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,u,c,v,p,x,q,j:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
 read(k);
 for i:=1 to k do
  begin
   read(p);  free1[p]:=i;
   read(x);
   for j:=1 to x do
    begin
     read(q);
     free[q,i]:=true;
     free[-q,i]:=true;
    end;
  end;
 read(s,t);
end;

procedure khoitao;
var i,tt:longint;
begin
 for i:=1 to n do
  for tt:=0 to 2**k-1 do d[i,tt]:=oo;
 d[s,0]:=0;
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
function rush(y,x:longint):longint;
begin
  if getbit(y,free1[x]-1)=0 then rush:=batbit(y,free1[x]-1)
  else rush:=tatbit(y,free1[x]-1);
end;
procedure xuli;
var j,v,pack,i,dem,qq:longint;
begin
 khoitao;
 push(s,0);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];   pack:=oo;  dem:=0;
    for i:=1 to k do
     begin
      qq:=getbit(y,i-1);
      if (qq=1) and (free[j,i]) then inc(dem);
     end;
    if dem mod 2+ ts[j]=1 then
     begin
      pack:=y;
      if (pack<>oo) and (d[v,pack]>d[x,y]+1) then
       begin
        d[v,pack]:=d[x,y]+1;
        if pos[v,pack]=0 then push(v,pack)
        else upheap(pos[v,pack]);
       end;
      if (free1[x]<>0) and (free[j,free1[x]]=false) then pack:=rush(y,x);
      if (pack<>oo) and (d[v,pack]>d[x,y]+1) then
       begin
        d[v,pack]:=d[x,y]+1;
        if pos[v,pack]=0 then push(v,pack)
        else upheap(pos[v,pack]);
       end;
     end
    else
      if (free1[x]<>0) and (free[j,free1[x]]) then
       begin
        pack:=rush(y,x);
        if (pack<>oo) and (d[v,pack]>d[x,y]+1) then
         begin
          d[v,pack]:=d[x,y]+1;
          if pos[v,pack]=0 then push(v,pack)
          else upheap(pos[v,pack]);
         end;
       end;
    j:=next[j];
   end;
 until nheap=0;
 res:=oo;
 for i:=0 to 2**k-1 do res:=min(res,d[t,i]);
 if res=oo then res:=-1;
 write(res);
end;
begin
 assign(input,'maze.inp'); reset(input);
 assign(output,'maze.out'); rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
