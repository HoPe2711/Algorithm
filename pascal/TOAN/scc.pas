uses math;
var ke,next,head,stack:array[0..100000] of longint;
    num,low,lab:array[0..10000] of longint;
    n,m,k,top,cnt,res,l:longint;
Procedure Add(i,u,v:longint);
  Begin
    ke[i]:=v;
    next[i]:=head[u];
    head[u]:=i;
  End;
Procedure Push(x:longint);
  Begin
    inc(top);
    stack[top]:=x;
  End;

Function Pop:longint;
  Begin
    pop:=stack[top];
    dec(top);
  End;

Procedure Dfs(u:longint);
  Var
    j,v:longint;
  Begin
    Push(u);
    inc(cnt);
    num[u]:=cnt;
    low[u]:=cnt;
    j:=head[u];
    While j<>0 do
      Begin
        v:=ke[j];
        If lab[v]=0 then
          Begin
            If num[v]=0 then
              Begin
                Dfs(v);
                low[u]:=min(low[u],low[v]);
              End
            else low[u]:=min(low[u],num[v]);
          End;
        j:=next[j];
      End;
    If num[u]=low[u] then
      Begin
        inc(res);
        Repeat
          v:=pop;
          lab[v]:=res;
        Until v=u;
      End;
  End;

procedure nhap;
var i,u,v:longint;
begin
 read(n,m,k);
 for i:=1 to m do
  begin
   read(u,v) ;
   add(i,u,v);
  end;
end;
Procedure Xuli;
  Var
    u:longint;
  Begin
    fillchar(lab,sizeof(lab),0);
    fillchar(num,sizeof(num),0);
    fillchar(low,sizeof(low),0);
    res:=0;
    For u:=1 to n do
     if num[u]=0 then
      Begin
        cnt:=0;
        top:=0;
        Dfs(u);
      End;
    Writeln(res);
  End;
procedure pack;
var l,u,v:longint;
begin
 xuli;
 for l:=1 to k do
  begin
   read(u,v);
   add(l+m,u,v);
   xuli;
  end;
end;
begin
 assign(input,'scc.inp');reset(input);
 assign(output,'scc.out');rewrite(output);
 nhap;
 pack;
 close(input); close(output);
end.