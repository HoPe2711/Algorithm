uses math;
const oo=1000000000;
var n,m,k,nheap,x,y:longint;
    ke,next,head,ts,heap,tt:array[-100000..100000] of longint;
    d:array[0..100000,0..10] of real;
    pos:array[0..100000,0..10] of longint;
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
 read(n,m,k);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure khoitao;
var i,j:longint;
begin
 for i:=1 to n do
 for j:=0 to k do d[i,j]:=oo;
 d[1,0]:=0;
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
procedure xuli;
var j,v,q:longint;
begin
 nheap:=0;
 push(1,0);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    for q:=0 to k do
     if y+q<= k then
     if d[v,y+q]>d[x,y]+ts[j]/(1 shl q) then
      begin
       d[v,y+q]:=d[x,y]+ts[j]/(1 shl q);
       if pos[v,y+q]=0 then push(v,y+q)
       else upheap(pos[v,y+q]);
      end;
    j:=next[j];
   end;
 until nheap=0;
 write(d[n,k]:0:2);
end;
begin
 //assign(input,'netaccel.inp');reset(input);
// assign(output,'netaccel.out');rewrite(output);
 nhap;
 khoitao;
 xuli;
 //close(input);
 //close(output);
end.
