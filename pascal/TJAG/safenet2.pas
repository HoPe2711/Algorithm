uses math;
var  ke,next,head,num,low,stack,lab:array[-100000..100000] of longint;
     n,m,res,top,dem,slt:longint;
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
procedure DFS(u,p:longint);
var j,v,pp,x:longint;
begin
 inc(dem);  push(u);
 num[u]:=dem; low[u]:=dem;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if (v<>p)  then
    if num[v]=0 then
     begin
      DFS(v,u);
      low[u]:=min(low[u],low[v]);
     end
    else low[u]:=min(low[u],num[v]);
   j:=next[j];
  end;
 if num[p]<=low[u] then
  begin
    inc(slt);
    pp:=0;
    repeat
     v:=pop;
     lab[v]:=slt;
     inc(pp);
    until v=u;
    res:=max(res,pp+1);
  end;

end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
 if num[i]=0 then
   begin
    dem:=0;
    top:=0;
    DFS(i,-1);
   end;
 if m=0 then res:=1;
 write(res);
end;
begin
 assign(input,'safenet2.inp'); reset(input);
 assign(output,'safenet2.out'); rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
