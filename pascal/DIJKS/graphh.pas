uses math;
const oo=1000000000;
var ke,next,head,heap,heap1,ts:array[-10000..10000] of longint;
    canh,n,tungduong,hailong,latdot,nheap,x,y:longint;
    res:real;
    pos,d:Array[0..501,0..1001] of longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure nhap;
var i,j,y:longint;
begin
 read(n);
 for i:=1 to n do
   for j:=1 to n do
    begin
     read(y);
     if i=j then continue;
     inc(Canh);
     add(canh,i,j,y);
    end;
 for i:=1 to n do
  begin
   inc(canh);
   add(canh,n+1,i,0);
  end;
end;

procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i],heap1[i]]>d[heap[i div 2],heap1[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(heap1[i],heap1[i div 2]);
 doicho(pos[heap[i],heap1[i]],pos[heap[i div 2],heap1[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if (j>nheap) then exit;
 if (j<nheap) and (d[heap[j],heap1[j]]>D[heap[j+1],heap1[j+1]]) then inc(j);
 if d[heap[i],heap1[i]]>d[heap[j],heap1[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(heap1[i],heap1[j]);
   doicho(pos[heap[i],heap1[i]],pos[heap[j],heap1[j]]);
   downheap(j);
  end;
end;
procedure push(x,y:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 heap1[nheap]:=y;
 pos[x,y]:=nheap;
 upheap(nheap);
end;
procedure pop;
begin
 x:=heap[1];
 y:=heap1[1];
 heap[1]:=heap[nheap];
 heap1[1]:=heap1[nheap];
 pos[heap[1],heap1[1]]:=1;
 dec(nheap);
 downheap(1);
end;

procedure DIJks(s,t:longint);
var i,j,v:longint;
begin
 for i:=1 to n+1 do
  for j:=0 to n+1 do
   begin
    d[i,j]:=oo;
    pos[i,j]:=0;
   end;
 d[s,t]:=0;
 nheap:=0;
 push(s,t);
 repeat
  pop;
  j:=head[x];
  while j<>0 do
   begin
    v:=ke[j];
    if y<>n+1 then
     if d[v,y+1]>d[x,y]+ts[j] then
      begin
       d[v,y+1]:=d[x,y]+ts[j];
       if pos[v,y+1]=0 then push(v,y+1)
       else upheap(pos[v,y+1]);
      end;
    j:=next[j];
   end;
 until nheap=0;
end;

function GCd(a,b:longint):longint;
begin
 if b=0 then exit(a);
 exit(gcd(b,a mod b));
end;


procedure xuli;
var i,k,j,tmp,tmp1:longint; tg:real;
begin
 res:=oo;
 dijks(n+1,0);
 for i:=1 to n do
 begin
  tg:=-1;
  for j:=1 to n do
  if (d[i,j]<>oo) and (d[i,n+1]<>oo) then
   begin
    if tg*(n-j+1)<(d[i,n+1]-d[i,j]) then
       begin
        tg:=(d[i,n+1]-d[i,j])/(n-j+1);
        tmp:=d[i,n+1]-d[i,j];
        tmp1:=n-j+1;
       end;
   end;
  if tg<>-1 then
  if res>tg then
   begin
    res:=tg;
    latdot:=tmp;
    hailong:=tmp1;
   end;
 end;
 //writeln(res);
 tungduong:=GCD(latdot,hailong);
 write(latdot div tungduong);
 write('/');
 write(hailong div tungduong);
end;
begin
 assign(input,'graphh.inp');reset(input);
 assign(output,'graphh.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
