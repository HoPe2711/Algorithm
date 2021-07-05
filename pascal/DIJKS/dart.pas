uses math;
const oo=1000000000;
var res,n,nheap:longint;
     ke,next,head,ts,d,heap,pos,tr,trace,tr1,dgd,trace1:array[0..100000] of longint;
     free:array[0..100000] of boolean;
procedure add(i,u,v,c,k:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 dgd[i]:=k;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure nhap;
var u,v,w1,w2,i,k,j:longint;
    st:string;
begin
 i:=0;      k:=0;
 readln(n);
 while not seekeof do
  begin
   read(u,v,w1,w2);
   readln(st);
   if st[2]='G' then
    begin
     inc(k);
     inc(i);
     add(i,u,v+n,w1,k);
     inc(i);
     add(i,v+n,u,w2,k);
    end
   else
    begin
     inc(k);
     inc(i);
     add(i,u+n,v,w1,k);
     inc(i);
     add(i,v,u+n,w2,k);
    end;
  end;
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
 for i:=1 to 2*n do d[i]:=oo;
 d[n]:=0; d[2*n]:=0;
end;
{procedure update(s:longint);
var u,v,j,i:longint;
begin}
procedure xuli;
var u,j,v,o,l,i:longint;
begin
 fillchar(free,sizeof(free),true);
// fillchar(pos,sizeof(pos),0);
 khoitao;
 nheap:=0;
 push(n);  push(2*n);
 repeat
  u:=pop;
  free[u]:=false;
  j:=head[u];
  while j<>0 do
   begin
    v:=ke[j];
    if free[v] and (d[v]>d[u]+ts[j]) then
     begin
      d[v]:=d[u]+ts[j];
      trace[v]:=u;
      trace1[v]:=dgd[j];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;
 res:=min(d[1],d[n+1]);
 if d[1]>d[n+1] then
  begin
   o:=0;
   writeln(res);
   l:=n+1;
   while (l<>0) do
    begin
     inc(o);
     if l>n then tr[o]:=l-n
     else tr[o]:=l;
     l:=trace[l];
    end;
   for i:=o downto 1 do write(tr[i],' ');
   writeln;
   o:=0;
   l:=n+1;
   while l<>0 do
    begin
     inc(o);
     tr1[o]:=trace1[l];
     l:=trace[l];
    end;
   for i:=o-1 downto 1 do write(tr1[i],' ');
  end;
 if d[1]<=d[n+1] then
  begin
   o:=0;
   writeln(res);
   l:=1;
   while (l<>0) do
    begin
     inc(o);
     if l>n then tr[o]:=l-n
     else tr[o]:=l;
     l:=trace[l];
    end;
   for i:=o downto 1 do write(tr[i],' ');
   writeln;
   o:=0;
   l:=1;
   while l<>0 do
    begin
     inc(o);
     tr1[o]:=trace1[l];
     l:=trace[l];
    end;
   for i:=o-1 downto 1 do write(tr1[i],' ');
  end;
end;
begin
 assign(input,'dart.inp');reset(input);
 assign(output,'dart.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
