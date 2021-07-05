uses math;
const oo=2000000000;
var ke,next,head,ts,d,res,a,b,queu:array[-500000..500000] of longint;
    n,m,f,r:longint;
    free:Array[0..200000] of boolean;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m);
 for i:=1 to n do res[i]:=oo;
 for i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(F);
end;
procedure BFS(s:longint);
var  u,j,v,i:longint;
begin
 f:=1; r:=0;
 for i:=1 to n do d[i]:=oo;
 d[s]:=0;
 push(S);
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if d[v]>d[u]+1 then
      begin
       d[v]:=d[u]+1;
       push(v);
      end;
     j:=next[j];
    end;
  end;
end;
procedure BFS1;
var tmp,u,j,v,dem,tg,i:longint;
begin
 free[1]:=true;        f:=1; r:=0;
 push(1);      u:=1;      dem:=0;
 while dem<a[n] do
  begin
   inc(dem);
   tmp:=oo;
   for i:=f to r do
    begin
     u:=queu[i];
     j:=head[u];
     while j<>0 do
      begin
       v:=ke[j];
       if (free[v]=false) and (a[u]+1+b[v]=a[n]) then tmp:=min(tmp,ts[j]);
       j:=next[j];
      end;
    end;
   res[dem]:=tmp; tg:=r;
   for i:=f to r do
    begin
     u:=queu[i];
     j:=head[u];
     while j<>0 do
      begin
       v:=ke[j];
       if (free[v]=false) and (ts[j]=res[dem]) and (a[u]+1+b[v]=a[n])  then
        begin
         free[v]:=true;
         push(v);
        end;
       j:=next[j];
      end;
     end;
   f:=tg+1;
  end;
end;
procedure xuli;
var i:longint;
begin
 BFS(1);
 writeln(d[n]);
 a:=d;
 BFS(n);
 b:=d;
 BFS1;
 for i:=1 to a[n] do write(res[i],' ');
end;
begin
 assign(input,'cpath.inp');reset(input);
 assign(output,'cpath.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
