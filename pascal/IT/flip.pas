uses math;
var a,b,c,x,pos,pos1,left,ts,tt,val,t,trace,trace1:array[0..3000000] of longint;
    n,m,l:longint;
procedure update1(i,x:longint);
begin
 while i>0 do
  begin
   t[i]:=t[i]+x;
   i:=i-i and (-i);
  end;
end;
function get1(i:longint):longint;
begin
 get1:=0;
 while i<=m do
  begin
   get1:=get1+t[i];
   i:=i+i and (-i);
  end;
end;
procedure nhap;
var  i:longint;
begin
 read(n,m);
 for i:=1 to n do
  begin
   read(a[i],b[i]);
   trace[i]:=a[i];
   trace1[i]:=b[i];
   x[i]:=a[i];
   x[n+i]:=b[i];
   pos[i]:=i;
   pos[n+i]:=n+i;
  end;
 for i:=1 to m do
  begin
   read(c[i]);
   x[2*n+i]:=c[i];
   pos[2*n+i]:=2*n+i;
  end;
end;
procedure update(s,l,r,i,x:longint);
var mid:longint;
begin
 if (i<l) or (i>r) then exit;
 if l=r then
  begin
   val[s]:=x;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=max(val[2*s],val[2*s+1]);
end;
function get(s,u,v,l,r:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u>=l) and (r>=v) then exit(val[s]);
 mid:=(u+v) div 2;
 exit(max(get(2*s,u,mid,l,r),get(2*s+1,mid+1,v,l,r)));
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
 mid:=x[random(r-l+1)+l];
 repeat
  while x[i]<mid do inc(i);
  while x[j]>mid do dec(J);
  if i<=j then
   begin
    doicho(x[i],x[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure build;
var i,limit:longint;
begin
 qsort(1,2*n+m);
 limit:=1;
 i:=1;
 if pos[i]<=n then a[pos[i]]:=limit else
 if (pos[i]>n) and (pos[i]<=2*n) then b[pos[i]-n]:=limit
 else c[pos[i]-2*n]:=limit;
 for i:=2 to 2*n+m do
 begin
  if x[i]<>x[i-1] then inc(limit);
  if pos[i]<=n then a[pos[i]]:=limit else
  if (pos[i]>n) and (pos[i]<=2*n) then b[pos[i]-n]:=limit
  else c[pos[i]-2*n]:=limit;
 end;
end;
procedure qsort1(l,r:longint);
var i,j:longint; mid:longint;
begin
 i:=l;
 j:=r;
 mid:=c[l+random(r-l+1)];
 repeat
  while c[i]>mid do inc(i);
  while c[j]<mid do dec(j);
  if i<=j then
   begin
    doicho(c[i],c[j]);
    doicho(pos1[i],pos1[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;

procedure qsort2(l,r:longint);
var i,j:longint; mid:longint;
begin
 i:=l;
 j:=r;
 mid:=ts[l+random(r-l+1)];
 repeat
  while ts[i]>mid do inc(i);
  while ts[j]<mid do dec(j);
  if i<=j then
   begin
    doicho(ts[i],ts[j]);
    doicho(pos[i],pos[j]);
    doicho(left[i],left[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort2(i,r);
 if l<j then qsort2(l,j);
end;

procedure xuli;
var i,vt:longint;
begin
 l:=6*100000;
 for i:=1 to m do
  begin
   update(1,1,l,c[i],i);
   pos1[i]:=i;
  end;
 for i:=1 to n do
 if a[i]<=b[i] then
  begin
   vt:=get(1,1,l,a[i],b[i]-1)+1;
   if vt=1 then tt[i]:=0 else tt[i]:=1;
   left[i]:=vt;    pos[i]:=i;    ts[i]:=b[i];
  end
 else
  begin
   vt:=get(1,1,l,b[i],a[i]-1)+1;
   left[i]:=vt;   pos[i]:=i;  ts[i]:=a[i];
  end;
end;

procedure kquery;
var i,j:longint;
begin
 qsort2(1,n);
 qsort1(1,m);
 j:=1;
 for i:=1 to n do
  begin
   while (j<=m) and (c[j]>=ts[i]) do
    begin
     update1(pos1[j],1);
     inc(j);
    end;
   tt[pos[i]]:=(get1(left[i])+tt[pos[i]]) mod 2;
  end;
 for i:=1 to n do
  if tt[i]=0 then write(trace[i],' ') else write(trace1[i],' ');
end;
begin
 assigN(input,'flip.inp');reseT(input);
 assign(output,'flip.out');rewrite(output);
 nhap;
 build;
 xuli;
 kquery;
 close(input); close(output);
end.
