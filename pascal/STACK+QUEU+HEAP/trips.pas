uses math;
var n,m,res,nheap:longint;
    s,pos,pos1,u,v,heap,clan,tour:array[0..400000] of longint;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to n do
  begin
   read(s[i]);
   pos[i]:=i;
  end;
 for i:=1 to m do
  begin
   read(v[i],u[i]);
   pos1[i]:=i;
  end;
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
 mid:=s[l+random(r-l+1)];
 repeat
  while s[i]<mid do inc(I);
  while s[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(s[i],s[j]);
    doicho(pos[i],pos[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure qsort1(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=v[l+random(r-l+1)];
 repeat
  while v[i]<mid do inc(I);
  while v[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(v[i],v[j]);
    doicho(u[i],u[j]);
    doicho(pos1[i],pos1[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;
procedure upheap(i:longint);
begin
 if (i=1) or (u[heap[i]]>u[heap[i div 2]]) then exit;
 doicho(heap[i],heap[i div 2]);
 upheap(i div 2);
end;
procedure downheap(i:longint);
var j:longint;
begin
 j:=2*i;
 if j>nheap then exit;
 if (j<nheap) and (u[heap[j]]>u[heap[j+1]]) then inc(j);
 if u[heap[i]]>u[heap[j]] then
  begin
   doicho(heap[i],heap[j]);
   downheap(j);
  end;
end;
procedure push(x:longint);
begin
 inc(nheap);
 heap[nheap]:=x;
 upheap(nheap);
end;
function pop:longint;
begin
 pop:=heap[1];
 heap[1]:=heap[nheap];
 dec(nheap);
 downheap(1);
end;
procedure xuli;
var j,i,t:longint;
begin
 qsort(1,n);
 qsort1(1,m);
 j:=1;
 for i:=1 to n do
  begin
   while (j<=m) and (v[j]<=s[i]) do
    begin
     push(j);
     inc(j);
    end;
   while (nheap>0) and (u[heap[1]]<s[i]) do pop;
   if nheap<>0 then
    begin
     t:=pop;
     inc(res);
     clan[res]:=pos[i];
     tour[res]:=pos1[t];
    end;
  end;
 writeln(Res);
 for i:=1 to res do writeln(clan[i],' ',tour[i]);
end;
begin
 assign(input,'trips.inp');reset(input);
 assign(output,'trips.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.