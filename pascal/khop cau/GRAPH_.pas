uses math;
var ke,next:array[-50000..50000] of longint;
    head,num,low:array[-1..10000] of longint;
    dd:array[-1..10000] of boolean;
    n,m,res1,res2,dem,goc:longint;
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
 dem:=0;
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
 c:=0;
 inc(dem);
 num[u]:=dem;
 low[u]:=dem;
 j:=head[u];
 while j<>0 do
 begin
  v:=ke[j];
  if v<>p then
   if num[v]=0 then
    begin
     DFS(v,u);
     inc(c);
     low[u]:=min(low[u],low[v]);
    end
   else low[u]:=min(low[u],num[v]);
  j:=next[j];
 end;
 if (num[u]=low[u]) and (p<>-1) then inc(res2);
 if p=-1  then
    begin
     if (c>1) and (dd[p]=false) then
      begin
       inc(res1);
       dd[p]:=true;
      end;
    end
   else if ((num[p]<=low[u]) and (dd[p]=false) ) and (p<> goc) then
    begin
     inc(res1);
     dd[p]:=true;
    end;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  if num[i]=0 then
   begin
    dem:=0;
    goc:=i;
    DFS(i,-1);
   end;
 write(res1,' ',res2);
end;
begin
 nhap;
 xuli;
end.

