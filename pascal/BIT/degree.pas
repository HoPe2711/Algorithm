{$H+}
uses math;
const base=100000000;
var  a,b,c,dd,t,tt,x,pos,free,trace:array[0..1000] of longint;
     n,res:longint;
procedure nhap;
var  i,x:longint; s,s1:char;
begin
 readln(n);
 for i:=1 to n do
  begin
   read(s);
   read(s1);
   if s1='1' then
    begin
     a[i]:=5;
     readln(x);
     b[i]:=x;
    end
   else
    begin
     a[i]:=ord(s)-64;
     readln(x);
     b[i]:=x;
    end;
  end;
end;
procedure doicho(Var x,y:longint);
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
 mid:=c[l+random(r-l+1)];
 repeat
  while c[i]<mid do inc(i);
  while c[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(c[i],c[j]);
    doicho(pos[i],pos[j]);
    doicho(trace[i],trace[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure update(i,x:longint);
begin
 while i<=n do
  begin
   t[i]:=max(t[i],x);
   i:=i+i and (-i);
  end;
end;
function get(i:longint):longint;
begin
 get:=0;
 while i>0 do
  begin
   get:=max(get,t[i]);
   i:=i-i and (-i);
  end;
end;
procedure xuli;
var i,tmp,last:longint;
begin
 for i:=1 to n do t[i]:=0;
 for i:=1 to n do
  begin
   c[i]:=b[i]+dd[a[i]]*base;
   //if tt[a[i]]=1 then c[i]:=-c[i];
   pos[i]:=i;
  end;
 for i:=1 to n do trace[i]:=a[i];
 qsort(1,n);
 last:=1;
 for i:=1 to n do
 begin
  if tt[trace[i]]=1 then c[i]:=-c[i];
  if tt[trace[i]]<>tt[trace[i+1]] then
   begin
    qsort(last,i);
    last:=i+1;
   end;
 end;
 for i:=1 to n do
  begin
   tmp:=get(pos[i]-1)+1;
   res:=max(res,tmp);
   update(pos[i],tmp);
  end;
end;
procedure backtrack(i:longint);
var  j:longint;
begin
 if i=6 then xuli
 else
  for j:=0 to 1 do
   begin
    tt[x[i]]:=j;
    backtrack(i+1);
   end;
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=6 then backtrack(1)
 else
  for j:=1 to 5 do
  if free[j]=0 then
   begin
    x[i]:=j;
    dd[j]:=i;
    free[j]:=1;
    duyet(i+1);
    free[j]:=0;
   end;
end;
begin
 assign(input,'degree.inp');reset(input);
 assign(output,'degree.out');rewrite(output);
 nhap;
 duyet(1);
 writeln(n-res);
 close(input); close(output);
end.