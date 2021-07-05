uses math;
var n,m,res,nheap:longint;
    free:array[0..10000] of boolean;
    ke,next,head,ts,heap,d,pos:array[-10000..10000] of longint;
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
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
{procedure doicho(var x,y:longint);
var tmp:longint;
begin
 tmp := x;
 x := y;
 y := tmp;
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
 if (j<nheap) and (d[heap[j]]>=d[heap[j+1]]) then inc(j);
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
end;           }
procedure khoitao;
var i:longint;
begin
 d[1]:=0;
 for i:=2 to n do d[i]:=1000000;
end;
function findmin:longint;
var kq,i:longint;
begin
 kq:=maxlongint;
 for i:=1 to n do
  if (kq>d[i]) and (free[i]) then
   begin
    kq:=d[i];
    findmin:=i;
   end;
end;
procedure xuli;
var i,j,u,v:longint;
begin
 fillchar(free,sizeof(free),true);
{ for i:=1 to n do push(d[i]);   }
 for i:=1 to n do
  begin
   u:=findmin;
   res:=res+d[u];
   free[u]:=false;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if (d[v]>ts[j]) and free[v] then
      begin
       d[v]:=ts[j];
 {      upheap(pos[v]);  }
      end;
     j:=next[j];
    end;
  end;
 write(res);
end;
BEGIN
  assign(input,'prim.inp');reset(input);
  assign(output,'prim.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  close(input);close(output);
END.

