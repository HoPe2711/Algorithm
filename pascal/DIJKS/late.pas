uses math;
const oo=1000000000;
      esp=0.0000001;
var ke,next,head,ts,trace,heap,pos,canh,canh1,canh2:array[-200000..200000] of longint;
    d,kc:Array[-200000..200000] of real;
    n,m,p,nheap:longint;
    tt,free:array[-200000..200000] of boolean;
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
 canh[i]:=i;
 canh1[i]:=u;
 canh2[i]:=v;
end;
procedure nhap;
var i,u,v,c,j:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
 read(p);
 read(u);
 if canh1[u]=1 then
  begin
   trace[1]:=1;
   trace[1+1]:=canh2[u];
   tt[canh[u]]:=true;
  end
 else
  begin
   trace[1]:=1;
   trace[2]:=canh1[u];
   tt[-canh[u]]:=true;
  end;
 for i:=2 to p do
  begin
   read(u);
   if canh1[u]=trace[i] then
    begin
     trace[i]:=canh1[u];
     trace[i+1]:=canh2[u];
     tt[canh[u]]:=true;
    end
  else
    begin
     trace[i]:=canh2[u];
     trace[i+1]:=canh1[u];
     tt[-canh[u]]:=true;
    end
  end;
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
 if (i=1) or (d[heap[i]]>=d[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(pos[heap[i]],pos[heap[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j]]>d[heap[j+1]]) then inc(j);
 if d[heap[i]]>=d[heap[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(pos[heap[i]],pos[heap[j]]);
   downheap(j);
  end;
end;
procedure push(x:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 pos[x]:=nheap;
 upheap(nheap);
end;
function pop:longint;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure khoitao;
var i:longint;
begin
 for i:=1 to n do d[i]:=oo;
 d[1]:=0;
end;
function check(delta:real):boolean ;
var u,v,j,i,ex:longint;
    w,bb:real;
begin
 ex:=0;
 fillchar(free,sizeof(free),true);
 fillchar(pos,sizeof(pos),0);
 khoitao;
 nheap:=0;
 push(1);
 repeat
  u:=pop;
  free[u]:=false;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    w:=ts[j];
    if tt[j] then
     begin
      w:=w-delta ;
      inc(ex);
      if w>1 then kc[ex]:=w else kc[ex]:=1;
     end
    else w:=w+delta;
    if w<1 then w:=1;
   // if w>10000 then w:=10000;
    if (free[v]) and (d[v]>d[u]+w) then
     begin
      d[v]:=d[u]+w;
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 bb:=0;
 for i:=1 to ex do bb:=bb+kc[i];
 if bb<=esp+d[n] then exit(true);
 exit(false);
end;
procedure xuli;
var l,r,mid,res:real;
begin
  l:=0;
  r:=10001;
  while l<=r do
   begin
    mid:=(l+r)/2;
    if check(mid) then
     begin
      res:=mid;
      r:=mid-esp;
     end
    else l:=mid+esp;
   end;
  write(res:0:5);
end;
begin
  assign(input,'late.inp');reset(input);
  assign(output,'late.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
end.