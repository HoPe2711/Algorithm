uses math;
var ke,next:array[-400000..400000] of int64;
    head,queu,dd,d,num,low:array[0..1000000] of int64;
    free:array[0..1000000] of boolean;
    res,res1,kq,n,m,dem,r,f:int64;
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
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
procedure BFS(s:longint);
var j,u,v:int64;
begin
 push(s);
 while f<=r do
  begin
   u:=pop;
   free[u]:=false;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if free[v] then
      begin
       inc(d[res]);
       free[v]:=false;
       push(v);
      end;
     j:=next[j];
    end;
  end;
end;
procedure DFS(u,p:longint);
var j,v:int64;
begin
 inc(dem);
 num[u]:=dem;
 low[u]:=dem;
 j:=head[u];
 dd[u]:=1;
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    if num[v]=0 then
     begin
      DFS(v,u);
      dd[u]:=dd[v]+dd[u];
      low[u]:=min(low[u],low[v]);
     end
    else low[u]:=min(low[u],num[v]);
   j:=next[j];
  end;
  if (num[u]=low[u]) and (p<>-1) then inc(res1);
end;
procedure xuli1;
var i:longint;
begin
 for i:=1 to n do
  if num[i]=0 then
   begin
    dem:=0;
    DFS(i,-1);
   end;
end;
procedure xuli;
var i:longint;
begin
 fillchar(free,sizeof(free),true);
 f:=1;
 for i:=1 to n do
  if free[i] then
   begin
    inc(res);
    d[res]:=1;
    BFS(i);
   end;
 if res>=3 then
  begin
   write(0);
   exit;
  end;
 if res=2 then
  begin
   xuli1;
   write((m-res1)*d[1]*d[2]);
   exit;
  end;
 xuli1;
 kq:=(m-res1)*((n*(n-1)) div 2-m);
 for i:=2 to n do
  if low[i]=num[i] then kq:=kq+dd[i]*(n-dd[i])-1;
 write(kq);
end;
begin
 assign(input,'reform.inp');reset(input);
 assign(output,'reform.out');rewrite(output);
 nhap;
 xuli;
 close(input);close(output);
end.
