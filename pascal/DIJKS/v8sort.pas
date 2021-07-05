uses math;
const oo=1000000000;
var n,nheap,dem,pp,s:longint;
    a,tp,pos:array[0..100] of longint;
    c:array[0..7,0..7] of longint;
    d,pos1:array[0..7654321] of longint;
    tt,heap,x:array[0..100000] of longint;
    free:array[0..7] of boolean;
procedure nhap;
var i,j:longint;
begin
 while not seekeof do
  begin
   inc(n);
   read(a[n]);
  end;
 for i:=1 to 7 do
   if (n mod i=0)  and (n div i=i+1) then
    begin
     n:=i;
     break;
    end;
 for i:=1 to n do
  for j:=1 to n do c[i,j]:=a[n*i+j];
 for i:=1 to n do pos[i]:=i;
end;


procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;

procedure khoitao;
var i:longint;
begin
 for i:=1 to dem do d[tt[i]]:=oo;
 d[s]:=0;
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=n+1 then
  begin
   inc(dem);
   for j:=1 to n do tt[dem]:=tt[dem]+x[j]*(10**(n-j));
  end
 else
 for j:=1 to n do
 if free[j]=false then
  begin
   x[i]:=j;
   free[j]:=true;
   duyet(i+1);
   free[j]:=false;
  end;
end;
function tinh(u,i,j:longint):longint;
var k,v:longint;
begin
 v:=u;
 for k:=1 to n do
  begin
   tp[n-k+1]:=u mod 10;
   u:=u div 10;
  end;
 exit(v-tp[i]*(10**(n-i))-tp[j]*(10**(n-j))+tp[i]*(10**(n-j))+tp[j]*(10**(n-i)));
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
 pos1[x]:=nheap;
 upheap(nheap);
end;
function pop:longint;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 pos1[heap[1]]:=1;
 dec(nheap);
 downheap(1);
end;
procedure xuli;
var i,j,u,v:longint;
begin
 duyet(1);
 for i:=1 to n do s:=s+pos[i]*(10**(n-i));
 qsort(1,n);
 for i:=1 to n do pp:=pp+pos[i]*(10**(n-i));
 khoitao;
 push(s);
 repeat
  u:=pop;
  for i:=1 to n-1 do
   for j:=i+1 to n do
    begin
    v:=tinh(u,i,j);
    if d[v]>d[u]+c[i,j] then
     begin
      d[v]:=d[u]+c[i,j];
      if pos1[v]=0 then push(v)
      else upheap(pos1[v]);
     end;
    end;
 until nheap=0;
 write(d[pp]);
end;
begin
// assign(input,'v8sort.inp'); reset(input);
// assign(output,'v8sort.out'); rewrite(output);
 nhap;
 xuli;
// close(input); close(output);
end.
