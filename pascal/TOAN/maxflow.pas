uses math;
const oo=10000000;
type
   node=record
   u,v,c,f:longint
end;
var ke,next,head,queu,trace:array[0..200000] of longint;
    dd:Array[0..200000] of boolean;
    n,m,s,t,maxflow,l,r:longint;
    e:array[0..200000] of node;
procedure add(i,u,v,l,l1:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 e[i].u:=u;
 e[i].v:=v;
 e[i].c:=l;
 e[i].f:=l1;
end;
procedure nhap;
var dem,u,v,c1,i:longint;
begin
 dem:=2;
 read(n,m,s,t);
 for i:=1 to m do
  begin
   read(u,v,c1);
   add(dem,u,v,c1,0);
   add(dem+1,v,u,0,0);
   dem:=dem+2;
  end;
end;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[l];
 inc(l);
end;
function findpath:boolean;
var u,j,v:longint; tt:boolean;
begin
 tt:=false;
 fillchar(dd,sizeof(dd),false);
 l:=1; r:=0;
 push(s);
 while l<=r do
  begin
   u:=pop;
   if u=t then tt:=true;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if (e[j].c>e[j].f) and (dd[v]=false) then
      begin
       push(v);
       dd[v]:=true;
       trace[v]:=j;
      end;
     j:=next[j];
    end;
  end;
 if tt=true then exit(true);
 exit(false);
end;
procedure incflow;
var v,delta,j:longint;
begin
 v:=t;
 delta:=oo;
 while v<>s do
  begin
   j:=trace[v];
   delta:=min(delta,e[j].c-e[j].f);
   v:=e[j].u;
  end;
 v:=t;
 while v<>s do
  begin
   j:=trace[v];
   inc(e[j].f,delta);
   dec(e[j xor 1].f,delta);
   v:=e[j].u;
  end;
 inc(maxflow,delta);
end;
procedure xuli;
begin
 while findpath do incflow;
 write(maxflow);
end;
begin
 assign(input,'maxflow.inp');reset(input);
 assign(output,'maxflow.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
