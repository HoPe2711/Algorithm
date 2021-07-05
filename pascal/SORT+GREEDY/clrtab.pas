uses math;
var m,n,t,h,res:longint;
    a,b,free:array[0..52,0..52] of longint;
    dem,pos,p,p1,p2,p3,ts:array[0..25000] of longint;

procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do read(A[i,j]);
end;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var  i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=ts[l+random(r-l+1)];
 repeat
  while ts[i]<mid do inc(i);
  while ts[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(ts[i],ts[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure glosbe;
var  tg,i,j,ok,u,v:longint;
begin
 res:=0;
 for i:=1 to m do
  for j:=1 to n do
   if a[i,j]<>b[i,j] then
   begin
    ok:=0;
    for u:=1 to m do
    begin
     if ok=1 then break;
     for v:=1 to n do
      if (a[u,v]=b[i,j]) and (free[u,v]=0) then
       begin
        inc(res);
        free[i,j]:=1;
        tg:=a[u,v];
        a[u,v]:=a[i,j];
        a[i,j]:=tg;
        p[res]:=i;  p1[res]:=j; p2[res]:=u; p3[res]:=v;
        ok:=1;  break;
       end;
    end
   // else free[i,j]:=1;
   end
  else free[i,j]:=1;
 writeln(Res);
 for i:=1 to res do writeln(p[i],' ',p1[i],' ',p2[i],' ',p3[i]);
end;
procedure xuli;
var i,j,ok,col,hailong:longint;
begin
 for i:=1 to n do
  begin
   dem[i]:=0;
   ts[i]:=0;
  end;
 fillchar(free,sizeof(Free),0);
 for i:=1 to m do
  for j:=1 to n do inc(dem[a[i,j]]);
 ok:=0;  hailong:=0;
 for i:=1 to n do
  begin
   if dem[i]<>0 then
    begin
     inc(hailong);
     ts[hailong]:=dem[i];
     pos[hailong]:=i;
    end;
   if dem[i]<>m then ok:=1;
  end;
 if ok=0 then
  begin
   //writeln(1);
   for i:=1 to n do
    for j:=1 to m do b[j,i]:=i;
   glosbe;
   exit;
  end;
 qsort(1,hailong);
 j:=1;        col:=1;
 while col<=n do
  begin
   for i:=1 to min(ts[j],m) do b[i,col]:=pos[j];
   for i:=ts[j]+1 to m do b[i,col]:=pos[hailong];
   ts[hailong]:=min(ts[hailong]-(m-ts[j]),ts[hailong]);
   ts[j]:=max(ts[j]-m,0);
   if ts[j]=0 then inc(j);
   qsort(j,hailong);
   inc(col);
  end;
// writeln(2);
 glosbe;
end;
begin
 assign(input,'clrtab.inp');reset(input);
 assign(output,'clrtab.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input); close(output);
end.
