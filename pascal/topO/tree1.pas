uses math;
const oo=maxlongint;
var ke,next,head,con,a,cha,d,tt:array[-10000..10000] of longint;
    res,n,dem:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n-1 do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u,p:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     cha[v]:=u;
     con[u]:=v;
     d[v]:=d[u]+a[v];
     DFS(v,u);
    end;
   j:=next[j];
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure xuli;
var  i,p,last,sum:longint;
begin
 d[1]:=a[1];
 DFS(1,-1);
 for i:=1 to n do
  if con[i]=0 then
   begin
    inc(Dem);
    tt[dem]:=i;
   end;
 while dem>0 do
  begin
   sum:=-oo;
   for i:=1 to dem do
    if sum<d[tt[i]] then
     begin
      sum:=d[tt[i]];
      p:=i;
     end;
   if sum<=0 then break;
   last:=p;
   p:=tt[p];
   while p<>0 do
    begin
     dec(a[p]);
     p:=cha[p];
    end;
   d[1]:=a[1];
   DFS(1,-1);
   doicho(tt[last],tt[dem]);
   dec(dem);
  end;
 for i:=1 to n do res:=res+abs(a[i]);
 write(Res);
end;
begin
 assign(input,'tree.inp');reseT(input);
 assign(output,'tree.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
