uses math;
type node=record
     dd,sc:longint;
end;
const base=1000000007;
var n,limit:longint;
    a,pos,b:array[0..400000] of longint;
    g:array[0..400000] of node;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   pos[i]:=i;
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
procedure update(i:longint;tmp:node);
begin
 while i<=limit do
  begin
   if g[i].dd<tmp.dd then g[i]:=tmp
   else if g[i].dd=tmp.dd then g[i].sc:=(g[i].sc+tmp.sc) mod base;
   i:=i+(i and (-i));
  end;
end;
function get(i:longint):node;
var x:node;
begin
 x.sc:=0; x.dd:=0;
 while i>0 do
  begin
   if x.dd<g[i].dd then x:=g[i]
   else if x.dd=g[i].dd then x.sc:=(x.sc+g[i].sc) mod base;
   i:=i - (i and (-i));
  end;
 exit(x);
end;
procedure xuli;
var i:longint;
    tmp:node;
begin
 qsort(1,n);
 limit:=1;
 b[pos[1]]:=1;
 for i:=2 to n do
 begin
  if a[i]<>a[i-1] then inc(limit);
  b[pos[i]]:=limit;
 end;
 for i:=1 to n do
  begin
   tmp:=get(b[i]-1);
   tmp.dd:=tmp.dd+1;
   if tmp.sc=0 then tmp.sc:=1;
   update(b[i],tmp);
  end;
 write(get(limit).sc);
end;
begin
 //assign(input,'ntseq.inp');reset(input);
 nhap;
 xuli;
 //close(input);
end.