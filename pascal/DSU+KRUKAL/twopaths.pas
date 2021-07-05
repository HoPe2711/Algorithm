uses math;
var ke,next,head,ke1,next1,head1,lab,lab1,free,dis,num,low,tin,tout,u1,v1,t,khop:Array[-2000000..2000000] of longint;
    n,m,query,dem,top,canh,slt,l,tt,goc:longint;
    f:array[0..1000000,0..25] of longint;
    stack:array[0..2000000] of longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure add1(i,u,v:longint);
begin
 ke1[i]:=v;
 next1[i]:=head1[u];
 head1[u]:=i;
 ke1[-i]:=u;
 next1[-i]:=head1[v];
 head1[v]:=-i;
end;
function getrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=getrout(lab[u]);
 exit(lab[u]);
end;
procedure nhap;
var i,p,q:longint;
begin
 read(n,m,query);
 for i:=1 to n do lab[i]:=i;
 for i:=1 to m do
  begin
   read(u1[i],v1[i],t[i]);
   if t[i]=1 then
   if getrout(u1[i])<>getrout(V1[i]) then lab[lab[u1[i]]]:=lab[v1[i]];
  end;
 for i:=1 to m do
 if t[i]=0 then
  begin
   p:=getrout(u1[i]); q:=getrout(v1[i]);
   if p<>q then
    begin
     inc(canh);
     add(canh,p,q);
    end;
  end;
 for i:=1 to n do lab[i]:=getrout(i);
end;

procedure push(x:longint);
begin
 inc(top);
 stack[top]:=x;
end;
function pop:longint;
begin
 pop:=stack[top];
 dec(Top);
end;
procedure DFS(u,p:longint);
var j,v,c:longint;
begin
 inc(dem); c:=0;
 num[u]:=dem; ; low[u]:=dem;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if (v<>p) then
    if num[v]=0 then
     begin
      push(u);
      DFS(v,u);
      inc(c);
      low[u]:=min(low[u],low[v]);
      if (low[v]>=num[u]) then
       begin
        inc(Slt);
        repeat
         v:=pop;
         if lab1[v]<slt then lab1[v]:=slt;
        until v=u;
       end;
     end
    else low[u]:=min(low[u],num[v]);
   j:=next[j];
  end;
 push(u);
 if (p<>-1) and (p<>goc) then
  begin
   if (num[p]<=low[u])  then
    begin
     khop[p]:=1;
    end;
  end
 else
 if p=-1 then
  if c>1 then khop[u]:=1;
end;
procedure buildtree;
var i,j,v:longint;
begin
 canh:=0;
 for i:=1 to n do
  if num[i]=0 then
   begin
    dem:=0;
    goc:=i;
    top:=0;
    DFS(i,-1);
    if dem=1 then khop[i]:=1;
   end;
 m:=slt;
 for i:=1 to n do
  if khop[i]=1 then
   begin
    inc(slt);
    lab1[i]:=slt;
   end;
 for i:=1 to slt do lab2[i]=i;
 for i:=1 to n do
 if khop[i]=1 then
  begin
   j:=head[i];
   while j<>0 do
    begin
     v:=ke[j];
     if khop[v]<>1 then
     if lab1[v]<>lab1[i] then
      begin
       inc(Canh);
       lab2[lab1[i]]:=lab2[lab2[lab1[v]]];
       add1(canh,lab1[i],lab1[v]);
      end;
     j:=next[j];
    end;
  end;
 for i:=1 to n do
  if khop[i]=1 then
   begin
    j:=head[i];
    while j<>0 do
     begin
      v:=ke[j];
      if khop[v]=1 then
       if lab1[v]<>lab1[i] then
        begin
         p:=getrout(lab1[i]);
         q:=getrout(lab1[v]);
         if p<>q then
          begin
           inc(Canh);
          end;
        end;
      j:=next[j];
     end;
   end;
end;



procedure DFS1(u:longint);
var  j,v,i:longint;
begin
 inc(Dem);
 tin[u]:=dem;
 for i:=1 to l do f[u,i]:=f[f[u,i-1],i-1];
 j:=head1[u];
 while j<>0 do
  begin
   v:=ke1[j];
   if v>m then
   if free[v]=0 then
    begin
     free[v]:=tt;
     f[v,0]:=u;
     dis[v]:=dis[u]+1;
     DFS1(v);
    end;
   j:=next1[j];
  end;
 j:=head1[u];
 while j<>0 do
  begin
   v:=ke1[j];
   if v<=m then
   if free[v]=0 then
    begin
     free[v]:=tt;
     f[v,0]:=u;
     dis[v]:=dis[u]+1;
     DFS1(v);
    end;
   j:=next1[j];
  end;
 inc(Dem); tout[u]:=dem;
end;

function anc(u,v:longint):boolean;
begin
 if (tin[u]<=tin[v]) and (tout[u]>=tout[v]) then exit(true);
 exit(False);
end;
function lca(u,v:longint):longint;
var j:longint;
begin
 if anc(u,v) then exit(u);
 if anc(v,u) then exit(v);
 for j:=l downto 0 do
  if anc(f[u,j],v)=false then u:=f[u,j];
  exit(f[u,0]);
end;


function check(a,b,c,d:longint):boolean;
var tg,tg1,cnt,distance,distance1:longint;
begin
 tg:=lca(A,b);
 cnt:=dis[a]+dis[b]-2*dis[tg];
 tg:=lca(a,c);
 distance:=dis[a]+dis[c]-2*dis[tg];
 tg1:=lca(c,b);
 distance1:=dis[b]+dis[c]-2*dis[tg1];
 if distance+distance1<>cnt then exit(false);
 tg:=lca(a,d);
 distance:=dis[a]+dis[d]-2*dis[tg];
 tg1:=lca(d,b);
 distance1:=dis[b]+dis[d]-2*dis[tg1];
 if distance+distance1<>cnt then exit(false);
 exit(true);
end;

procedure xuli;
var i,a,b,c,d,c1,d1,a1,b1:longint; tmp:boolean;
begin
 l:=trunc(log2(slt));
 for i:=1 to slt do
  if free[i]=0 then
   begin
    f[i,0]:=i;  dem:=0;
    inc(tt);
    free[i]:=tt;
    DFS1(i);
   end;

 for i:=1 to query do
  begin
   read(a1,b1,c1,d1);
   if lab[c1]=lab[d1] then
    begin
     writeln('No');
     continue;
    end;
   if lab[a1]=lab[b1] then
    begin
     writeln('Yes');
     continue;
    end;
     if (lab[a1]=lab[c1]) and (lab[b1]=lab[d1]) then
       begin
        writeln('No');
        continue;
       end;
     if (lab[a1]=lab[d1]) and (lab[b1]=lab[c1]) then
      begin
       writeln('No');
       continue;
      end;
   a:=lab1[lab[a1]]; b:=lab1[lab[b1]]; c:=lab1[lab[c1]]; d:=lab1[lab[d1]];
   if free[a]<>Free[b] then
    begin
     writeln('No');
     continue;
    end;
   if (free[c]<>free[a]) or (Free[d]<>free[a]) then
    begin
     writeln('Yes');
     continue;
    end;
   tmp:=check(a,b,c,d);
   if tmp=true then
    begin
     if (khop[lab[c1]]=0) or (khop[lab[d1]]=0) then
      begin
       writeln('Yes');
       continue;
      end;
     writeln('No');
     continue;
    end;
   writeln('Yes');
  end;
end;
begin
 assign(input,'twopaths.inp');reset(input);
 assign(output,'twopaths.out');rewrite(output);
 nhap;
 buildtree;
 xuli;
 close(input); close(output);
end.
