uses math;
const
      oo=1000000000;
var n,nheap,x,m:longint;
    l,r,mid,res:int64;
    ok:boolean;
    ke,next,head,ts,nl,heap,tt1:array[-300000..300000] of longint;
    d,pos,d1,time:array[0..500] of int64;
procedure add(i,u,v,c,t:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c; nl[i]:=t;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c; nl[-i]:=t;
end;
procedure nhap;
var i,u,v,c,t:longint;
begin
 read(n);
 for i:=1 to n do read(tt1[i]);
 read(m);
 for i:=1 to m do
  begin
   read(u,v,c,t);
   add(i,u,v,c,t);
  end;
end;
procedure khoitao;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=0 to 10000 do d[i]:=oo;
 d[n]:=0;
end;

procedure doicho( var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i]]>d[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j]]>d[heap[j+1]]) then inc(j);
 if d[heap[i]]>d[heap[j]] then
  begin
   doicho(heap[i],heap[j]);
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
procedure pop;
begin
 x:=heap[1];
 heap[1]:=heap[nheap];
 pos[heap[1]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if (d1[u]+d[v]+ts[j]=d[1]) and (time[u]>=nl[j]) then
    begin
     if tt1[v]=1 then time[v]:=time[1] else time[v]:=time[u]-nl[j];
     d1[v]:=d1[u]+ts[j];
     if v=n then
      begin
       ok:=true;
       exit;
      end;
     dfs(v);
    end;
   j:=next[j];
  end;
end;
function check(x:longint):boolean;
begin
 fillchar(d1,sizeof(d1),0);
 fillchar(time,sizeof(time),0);
 ok:=false;
 time[1]:=x;
 DFS(1);
 exit(ok);
end;
procedure xuli;
var  j,v:longint;
begin
 khoitao;
 push(n);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if d[v]>d[x]+ts[j] then
     begin
      d[v]:=d[x]+ts[j];
      if pos[v]=0 then push(v)
      else upheap(pos[v]);
     end;
    j:=next[j];
   end;
 until nheap=0;

 l:=0;
 r:=10**9;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 write(res);
end;
begin
 assign(input,'qbrobot.inp'); reset(input);
 assign(output,'qbrobot.out'); rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
