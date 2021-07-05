uses math;
var lab,u,v,w,tt,free:array[0..500000] of longint;
    query:array[0..500000] of int64;
    n,m,c,dem,tplt:longint;
    res:int64;
function getrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=getrout(lab[u]);
 exit(lab[u]);
end;

procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tG:=x;
 X:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=w[l+random(r-l+1)];
 repeat
  while w[i]<mid do inc(i);
  while w[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(w[i],w[j]);
    doicho(u[i],u[j]);
    doicho(v[i],v[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;

procedure nhap;
var i,p,q:longint;
begin
 read(n,m,c);
 for i:=1 to m do read(u[i],v[i],w[i]);
 qsort(1,m);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to m do
  begin
   p:=u[i]; q:=v[i];
   if getrout(p)<>getrout(q) then
    begin
     lab[lab[p]]:=lab[q];
    // query[i]:=query[i-1]+w[i];
     inc(Dem); tt[dem]:=w[i];
     query[dem]:=query[dem-1]+w[i];
    end;
  end;
 for i:=1 to n do free[getrout(i)]:=1;
 for i:=1 to n do
  if free[i]<>0 then inc(tplt);
end;


function find(l,r,x:longint):longint;
var kq,mid:longint;
begin
 kq:=dem+1;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if tt[mid]>x then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
procedure xuli;
var i,b,a,tmp,tg:longint;
begin
 for i:=1 to c do
  begin
   read(b,a);
   if a<tplt then
    begin
     writeln(-1);
     continue;
    end;
   res:=int64(b)*tplt;
   tmp:=A-tplt;
   tg:=find(1,dem,b);
   if tg<dem-tmp+1 then tg:=dem-tmp+1;
   res:=res+int64(b)*(dem-tg+1)+query[tg-1];
   writeln(res);
  end;
end;
begin
 assign(input,'airports.inp');reset(input);
 assign(output,'airports.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
