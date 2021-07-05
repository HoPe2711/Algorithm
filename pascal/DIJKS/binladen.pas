const
 q1:array[1..4] of longint=(1,-1,0,0);
 q2:array[1..4] of longint=(0,0,-1,1);
var m,n,nheap,x,y:longint;
    ts:array[1..4,-1..3000,-1..11] of longint;
    free:array[-1..3000,-1..11] of boolean;
    d,pos:array[-1..3000,-1..11] of longint;
    heap,heap1:array[-1..1000000] of longint;
procedure nhap;
var i,j,u:longint;
begin
 read(m,n);
 for i:=0 to m-1 do
  begin
   for j:=1 to n do
    begin
     read(u);
     ts[1,i,j]:=u;
     ts[2,i+1,j]:=u;
    end;
   for j:=1 to n-1 do
    begin
     read(u);
     ts[4,i+1,j]:=u;
     ts[3,i+1,j+1]:=u;
    end;
  end;
end;
procedure doicho(var x,y:longint);
var tmp:longint;
begin
 tmp := x;
 x := y;
 y := tmp;
end;
procedure upheap(i:longint);
begin
 if (i=1) or (d[heap[i],heap1[i]]>=d[heap[i div 2],heap1[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 doicho(heap1[i],heap1[i div 2]);
 doicho(pos[heap[i],heap1[i]],pos[heap[i div 2],heap1[i div 2]]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (d[heap[j],heap1[j]]>d[heap[j+1],heap1[j+1]]) then inc(j);
 if d[heap[i],heap1[i]]>=d[heap[j],heap1[j]] then
  begin
   doicho(heap[i],heap[j]);
   doicho(heap1[i],heap1[j]);
   doicho(pos[heap[i],heap1[i]],pos[heap[j],heap1[j]]);
   downheap(j);
  end;
end;
procedure push(i,j:longint);
begin
 inc(nheap);
 heap[nheap]:=i;
 heap1[nheap]:=j;
 pos[i,j]:=nheap;
 upheap(nheap);
end;
procedure pop;
begin
 x:=heap[1];
 y:=heap1[1];
 heap[1]:=heap[nheap];
 heap1[1]:=heap1[nheap];
 pos[heap[nheap],heap1[nheap]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure khoitao;
var i,j:longint;
begin
 for i:=0 to m do
  for j:=1 to n do d[i,j]:=maxlongint;
 d[0,1]:=0;
end;
procedure xuli;
var i:longint;
begin
 fillchar(free,sizeof(free),true);
 nheap:=0;
 push(0,1);
 repeat
  pop;
  if (x=m) and (y=n) then break;
  free[x,y]:=false;
   for i:=1 to 4 do
    begin
      if (d[x+q1[i],y+q2[i]]>d[x,y]+ts[i,x,y]) and free[x+q1[i],y+q2[i]] then
       begin
        d[x+q1[i],y+q2[i]]:=d[x,y]+ts[i,x,y];
        if pos[x+q1[i],y+q2[i]]=0 then push(x+q1[i],y+q2[i])
        else upheap(pos[x+q1[i],y+q2[i]]);
       end;
   end;
 until nheap=0;
 write(d[m,n]);
end;
BEGIN
  assign(input,'binladen.inp');reset(input);
  assign(output,'binladen.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
  close(input);close(output);
END.

