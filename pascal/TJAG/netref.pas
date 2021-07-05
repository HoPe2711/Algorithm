uses math;
const base=1000000007;
var ke,next,head,num,low,stack,lab,sl:array[-200000..200000] of longint;
    free:array[-200000..200000] of boolean;
    res,n,m,slt,top,dem:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
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
procedure DFS(u:longint);
var v,j:longint;
begin
 push(u);
 inc(dem);
 num[u]:=dem; low[u]:=dem;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if (lab[v]=0) and (free[j]=false) then
    begin
     if num[v]=0 then
      begin
       free[-j]:=true;
       DFS(v);
       low[u]:=min(low[u],low[v]);
      end
     else low[u]:=min(low[u],num[v]);
    end;
   j:=next[j];
  end;
 if num[u]<=low[u] then
  begin
   inc(slt);
   repeat
    v:=pop;
    lab[v]:=slt;
    inc(sl[slt]);
   until v=u;
  end;
end;
procedure xuli;
var i:longint;
begin
 res:=1;
 for i:=1 to n do
  if num[i]=0 then
   begin
    top:=0; dem:=0;
    DFS(i);
   end;
 for i:=1 to slt do res:=(int64(res)*sl[i]) mod base;
 write(Res);
end;
begin
 assign(input,'netref.inp');reset(input);
 assign(output,'netref.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.