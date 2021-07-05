uses math;
var ke,head,next,num,low,free:array[-200000..200000] of longint;
    khop,cau,n,m,dem:longint;
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
procedure DFS(u,p:longint);
var j,v,c:longint;
begin
 inc(dem); c:=0;
 num[u]:=dem; low[u]:=dem;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     if num[v]=0 then
      begin
       DFS(v,u); inc(C);
       low[u]:=min(low[v],low[u]);
      end
     else low[u]:=min(num[v],low[u]);
    end;
   j:=next[j];
  end;
 if (p<>-1) and (low[u]=num[u]) then inc(Cau);
 if p=-1 then
  begin
   if (c>1) and (free[u]=0) then
    begin
      inc(khop);
      free[u]:=1;
    end;
  end
 else if (num[p]<=low[u]) and (p<>1) and (Free[p]=0) then
  begin
   inc(khop);
   free[p]:=1;
  end;
end;
procedure xuli;
begin
 DFS(1,-1);
 write(cau,' ',khop);
end;
begin
 assign(input,'compnet.inp');reset(input);
 assign(output,'compnet.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
