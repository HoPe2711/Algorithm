uses math;
var n:longint;
    pos,pos1,l,last,first,b,adj,trace,head,next:array[0..300000] of longint;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
function find(l,r,x:longint):longint;
var mid,kq:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if b[adj[mid]]>=x then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=head[l+random(r-l+1)];
 repeat
  while b[head[i]]<b[mid] do inc(i);
  while b[head[j]]>b[mid] do dec(j);
  if i<=j then
   begin
    doicho(head[i],head[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i,j,dem,a:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a,b[i]);
   next[i]:=head[a];
   head[a]:=i;
   pos[a]:=a;
  end;
 qsort(1,n);    dem:=0;
 for i:=1 to n do
 if head[i]<>0 then
  begin
   j:=head[i];
   first[i]:=dem;
   while j<>0 do
    begin
     inc(dem);
     adj[dem]:=j;
     j:=next[j];
    end;
   last[i]:=dem;
  end;
 for i:=1 to n do pos1[pos[i]]:=i;
end;
procedure xuli;
var tt,tt1,q,k,j,i,dem:longint;
begin
 read(q);
 for i:=1 to q do
  begin
   read(k);
   for j:=1 to k do
    begin
     read(l[j]);
     trace[l[j]]:=head[pos1[l[j]]];
     head[pos1[l[j]]]:=0;
    end;
   tt:=0; tt1:=0; dem:=0;
   for j:=n downto n-k-1 do
    if head[j]<>0 then
     begin
      inc(dem);
      if dem=1 then tt:=j;
      if dem=2 then
       begin
        tt1:=j;
        break;
       end;
     end;
    if dem=0 then writeln(0,' ',0)
    else if dem=1 then writeln(pos[tt],' ',b[adj[last[tt]]])
    else writeln(pos[tt],' ',b[adj[find(first[tt]+1,last[tt],b[head[tt1]])]]);
    for j:=1 to k do
     begin
      head[pos1[l[j]]]:=trace[l[j]];
      trace[l[j]]:=0;
     end;
  end;
end;
begin
 //assign(input,'d749.inp');reset(input);
 nhap;
 xuli;
 //close(input); close(output);
end.