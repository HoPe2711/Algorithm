uses math;
const oo=high(int64);
      base=1000000000;
var n,m,res,dem,top:longint;
    ke,next,head,f,stack,num,low,lab,mark,tip,rush:array[0..100000] of int64;
Procedure Add(i,u,v:longint);
  Begin
    ke[i]:=v;
    next[i]:=head[u];
    head[u]:=i;
  End;
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
procedure DFS(u:longint);
var  j,v,tt:longint;
begin
 push(u);
 inc(dem);
 num[u]:=dem;
 low[u]:=dem;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if lab[v]=0 then
    begin
     if num[v]=0 then
      begin
       DFS(v);
       low[u]:=min(low[u],low[v]);
      end
      else low[u]:=min(low[u],num[v]);
    end;
   j:=next[j];
  end;
  if (low[u]=num[u]) then
   begin
    inc(res);
    mark[res]:=u;   tt:=u;
    repeat
     v:=pop;
     rush[tt]:=v;
     tt:=v;
     lab[v]:=res;
     inc(tip[res]);
    until v=u;
   end;
end;
procedure xuli;
var i,u,j,v:longint;
begin
 for i:=1 to n do
 if num[i]=0 then
  begin
   dem:=0;
   top:=0;
   DFS(i);
  end;
 for i:=res downto 1 do
  begin
   u:=mark[i];    dem:=0;
   if lab[1]=lab[u] then f[lab[u]]:=1;
   if tip[i]>1 then f[lab[u]]:=oo;
   while dem<tip[i] do
    begin
     u:=rush[u];  inc(dem);
     j:=head[u];
     while j<>0 do
      begin
       v:=ke[j];
       if lab[u]<>lab[v] then
        if f[lab[u]]<>oo then  f[lab[v]]:=f[lab[v]]+f[lab[u]]
        else f[lab[v]]:=oo;
       j:=next[j];
      end;
    end;
  end;
 if f[lab[2]]<>oo then write(f[lab[2]] mod base)
 else write('inf');
end;
BEGIN
  assign(input,'bic.inp');reset(input);
  assign(output,'bic.out');rewrite(output);
    Nhap;
    Xuli;
    //dp;
  close(input);close(output);
END.
