uses math;
const
 q1:array[1..4] of longint=(1,-1,0,0);
 q2:array[1..4] of longint=(0,0,-1,1);
var  x1,y1,heap,heap1:array[0..500000] of longint;
     d,a,pos:array[0..500,0..500] of longint;
     dd:array[1..4,0..500,0..500] of longint;
     free:array[0..500,0..500] of boolean;
     m,n,nheap,x,y,res:longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to 3 do read(x1[i],y1[i]);
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
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
procedure xuli(tt,k,k1:longint);
var i,j:longint;
begin
 for i:=1 to m do
  for j:=1 to n do d[i,j]:=maxlongint;
 d[k,k1]:=0;
 fillchar(free,sizeof(free),true);
 nheap:=0;
 push(k,k1);
 repeat
  pop;
  free[x,y]:=false;
   for i:=1 to 4 do
    begin
      if (d[x+q1[i],y+q2[i]]>d[x,y]+a[x+q1[i],y+q2[i]]) and free[x+q1[i],y+q2[i]] then
       begin
        d[x+q1[i],y+q2[i]]:=d[x,y]+a[x+q1[i],y+q2[i]];
        if pos[x+q1[i],y+q2[i]]=0 then push(x+q1[i],y+q2[i])
        else upheap(pos[x+q1[i],y+q2[i]]);
       end;
      pos[x,y]:=0;
   end;
 until nheap=0;
 for i:=1 to m do
  for j:=1 to n do dd[tt,i,j]:=d[i,j];
end;
procedure inkq;
begin
 res:=maxlongint;
 xuli(1,1,1);
 xuli(2,x1[1],y1[1]);
 xuli(3,x1[2],y1[2]);
 xuli(4,x1[3],y1[3]);
 res:=min(res,dd[1,x1[1],y1[1]]+dd[2,x1[2],y1[2]]+dd[3,m,n]+a[1,1]);
 res:=min(res,dd[1,x1[1],y1[1]]+dd[2,x1[3],y1[3]]+dd[4,m,n]+a[1,1]);
 res:=min(res,dd[1,x1[2],y1[2]]+dd[3,x1[1],y1[1]]+dd[2,m,n]+a[1,1]);
 res:=min(res,dd[1,x1[2],y1[2]]+dd[3,x1[3],y1[3]]+dd[4,m,n]+a[1,1]);
 res:=min(res,dd[1,x1[3],y1[3]]+dd[4,x1[1],y1[1]]+dd[2,m,n]+a[1,1]);
 res:=min(res,dd[1,x1[3],y1[3]]+dd[4,x1[2],y1[2]]+dd[3,m,n]+a[1,1]);
 write(res);
end;
BEGIN
  assign(input,'vuichoi.inp');reset(input);
  assign(output,'vuichoi.out');rewrite(output);
  nhap;
  inkq;
  close(input);close(output);
END.

