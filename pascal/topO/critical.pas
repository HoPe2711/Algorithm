uses math;
var ke,next:array[-400000..400000] of longint;
    head,num,low,d,vt,cha:array[0..400000] of longint;
    stack,dd:array[0..400000] of int64;
    free:array[0..400000] of boolean;
    n,m,dem,top,goc:longint;
    kq,res1:int64;
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
procedure DFS(u,p:longint);
var j,v,c:longint;
begin
 c:=0;
 d[u]:=1;
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
     cha[v]:=u;
     inc(c);
     DFS(v,u);
     low[u]:=min(low[u],low[v]);
     d[u]:=d[u]+d[v];
    end
   else low[u]:=min(low[u],num[v]);
  j:=next[j];
 end;
 if p=-1  then
    begin
     if c>1 then
      begin
       inc(res1);
       dd[res1]:=u;
      end;
    end
   else if (num[p]<=low[u]) and (p<> goc) then
   if p<>-1 then
    begin
     inc(res1);
     dd[res1]:=p;
    end;
end;
procedure xuli;
var i,u,v,h,j,t:longint;
    sum:int64;
begin
 kq:=0;
 fillchar(free,sizeof(free),true);
 for h:=1 to n do
  if num[h]=0 then
   begin
    dem:=0;
    res1:=0;
    goc:=h;
    DFS(h,-1);
    for i:=1 to res1 do
      begin
       top:=0;
       u:=dd[i];
       push(d[h]-d[u]);
       j:=head[u];
       while j<>0 do
        begin
         v:=ke[j];
         if (free[v]) and (cha[v]=u) then
          begin
           free[v]:=false;
            if num[u]<=low[v] then  push(d[v])
             else inc(stack[1],d[v]);
          end;
         j:=next[j];
        end;
       sum:=0;
       for t:=1 to top do sum:=sum+stack[t];
       for t:=1 to top do kq:=kq+stack[t]*(sum-stack[t]);
      end;
   end;
  write(kq/2/n:0:2);
end;
begin
 assign(input,'CRITICAL.inp');reset(input);
  assign(output,'CRITICAL.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
