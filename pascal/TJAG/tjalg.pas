Uses Math;

VAR
  ke,next,head,stack,num,low,lab:array[1..100000] of longint;
  n,m,top,cnt,res:longint;

Procedure Add(i,u,v:longint);
  Begin
    ke[i]:=v;
    next[i]:=head[u];
    head[u]:=i;
  End;

Procedure Nhap;
  Var
    i,x,y:longint;
  Begin
    Read(n,m);
    For i:=1 to m do
      Begin
        Read(x,y);
        Add(i,x,y);
      End;
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
        //  writeln(lab[v]);
        Until v=u;
      End;
  End;

Procedure Xuli;
  Var
    u:longint;
  Begin
    For u:=1 to n do
     if num[u]=0 then
      Begin
        cnt:=0;
        top:=0;
        Dfs(u);
      End;
    Write(res);
  End;
BEGIN
  assign(input,'tjalg.inp');reset(input);
  assign(output,'tjalg.out');rewrite(output);
    Nhap;
    Xuli;
  close(input);close(output);
END.
