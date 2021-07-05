uses math;
var m,n,res:longint;
    a,pos,trace,f:array[0..2000000] of longint;
procedure nhap;
var i,j,x:longint;
begin
 read(m,n);
 for i:=1 to m do
   for j:=1 to n do
    begin
     read(x);
     a[(i-1)*n+j]:=x;
     pos[(i-1)*n+j]:=(i-1)*n+j;
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
var i,j:longint; mid:longint;
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
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i:longint;
begin
 qsort(1,n*m);
 for i:=1 to n*m do trace[pos[i]]:=i;
 for i:=1 to m*n do
  begin
   if (pos[i] mod n<>0) and (a[trace[pos[i]+1]]>a[i]) then f[trace[pos[i]+1]]:=max(f[i]+1,f[trace[pos[i]+1]]);
   if (pos[i] mod n<>1) and (a[trace[pos[i]-1]]>a[i]) then f[trace[pos[i]-1]]:=max(f[i]+1,f[trace[pos[i]-1]]);
   if (pos[i]>n) and (a[trace[pos[i]-n]]>a[i]) then f[trace[pos[i]-n]]:=max(f[i]+1,f[trace[pos[i]-n]]);
   if (pos[i]<=m*n-n) and (a[trace[pos[i]+n]]>a[i]) then f[trace[pos[i]+n]]:=max(f[i]+1,f[trace[pos[i]+n]]);
  end;
 for i:=1 to m*n do res:=max(res,f[i]);
 write(res+1);
end;
begin
 assign(input,'listab.inp');reset(input);
 assign(output,'listab.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
