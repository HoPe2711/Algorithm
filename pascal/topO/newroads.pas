uses math;
var ke,next,head,stack,num,low,dem:array[0..200000] of longint;
    n,m,top,cnt,ss:longint;
    res:int64;
    free,lab:array[0..100000] of longint;
    dd:array[0..100000] of int64;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,m);
 for i:=1 to m do
 begin
  read(u,v);
  add(i,u,v);
 end;
end;
procedure push(x:longint);
begin
 inc(top);
 stack[top]:=x;
end;
function pop:longint;
begin
 pop:=stack[top];
 dec(top);
end;
procedure dfs(u:longint);
var v,j,tt,i:longint;
begin
 push(u);
 inc(cnt);
 num[u]:=cnt;
 low[u]:=cnt;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if lab[v]=0 then
    begin
    if (num[v]=0) then
     begin
      dfs(v);
      low[u]:=min(low[u],low[v]);
     end
    else low[u]:=min(low[u],num[v]);
    end;
   j:=next[j];
  end;
 if low[u]=num[u] then
  begin
   inc(ss);
   repeat
    v:=pop;
    lab[v]:=ss;
   Until v=u;
  end;
end;
procedure xuli;
var i,j,v:longint;
begin
 for i:=1 to n do
 if num[i]=0 then
  begin
   cnt:=0;
   top:=0;
   dfs(i);
  end;
 for i:=1 to n do inc(dd[lab[i]]);
 for i:=1 to n do
  begin
   j:=head[i];
   while j<>0 do
    begin
     v:=ke[j];
     if (lab[i]=lab[v]) and (free[v]<>i) then
      begin
       inc(dem[lab[i]]);
       free[v]:=i;
      end;
     j:=next[j];
    end;
  end;
 for i:=1 to ss do res:=res+dd[i]*(dd[i]-1)-dem[i];
 write(res);
end;
begin
 assign(input,'newroads.inp');reset(input);
 assign(output,'newroads.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
