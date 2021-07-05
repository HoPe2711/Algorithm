uses math;
var  ke,next,head,ts:array[-100000..100000] of longint;
     n,m,k,a,b,res,nheap,nheap1:longint;
     free:array[0..100000] of boolean;
     da,db,heap,heap1,pos,pos1,h,gia:array[0..100000] of longint;
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
procedure doicho(var x,y:longint);
var tmp:longint;
begin
 tmp := x;
 x := y;
 y := tmp;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m,k);
 read(a,b);
 for i:=1 to k do read(h[i],gia[i]);
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (da[heap[i]]>=da[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(pos[heap[i]],pos[heap[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (da[heap[j]]>da[heap[j+1]]) then inc(j);
 if da[heap[i]]>=da[heap[j]] then
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
procedure upheap1(i:longint);
begin
 if (i=1) or (db[heap1[i]]>=db[heap1[i div 2]]) then exit;
 doicho(heap1[i],heap1[i div 2]);
 doicho(pos1[heap1[i]],pos1[heap1[i div 2]]);
 upheap1(i div 2);
end;
procedure downheap1(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap1 then exit;
 if (j<nheap1) and (db[heap1[j]]>db[heap1[j+1]]) then inc(j);
 if db[heap1[i]]>=db[heap1[j]] then
  begin
   doicho(heap1[i],heap1[j]);
   doicho(pos1[heap1[i]],pos1[heap1[j]]);
   downheap1(j);
  end;
end;
procedure push1(x:longint);
begin
 inc(nheap1);
 heap1[nheap1]:=x;
 pos1[x]:=nheap1;
 upheap1(nheap1);
end;
function pop1:longint;
begin
 pop1:=heap1[1];
 heap1[1]:=heap1[nheap1];
 dec(nheap1);
 downheap1(1);
end;
procedure khoitao;
var i:longint;
begin
 for i:=1 to n do
  begin
   da[i]:=100000;
   db[i]:=100000;
  end;
 da[a]:=0;
 db[b]:=0;
end;
procedure xuli;
var u,v,j:longint;
begin
 fillchar(free,sizeof(free),true);
 nheap:=0;
 push(a);
 repeat
  u:=pop;
  free[u]:=false;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free[v] and (da[v]>da[u]+ts[j]) then
     begin
      da[v]:=da[u]+ts[j];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 fillchar(free,sizeof(free),true);
 nheap1:=0;
 push1(b);
 repeat
  u:=pop1;
  free[u]:=false;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free[v] and (db[v]>db[u]+ts[j]) then
     begin
      db[v]:=db[u]+ts[j];
      if pos1[v]=0 then push1(v)
      else upheap1(pos1[v]);
     end;
    j:=next[j];
   end;
 until nheap1=0;
end;
procedure inkq;
var i:longint;
begin
 res:=maxlongint;
 for i:=1 to k do res:=min(res,da[h[i]]+db[h[i]]+gia[i]);
 write(res);
end;
BEGIN
  assign(input,'money.inp');reset(input);
  assign(output,'money.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  inkq;
  close(input);close(output);
END.





