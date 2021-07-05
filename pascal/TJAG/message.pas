Uses Math;

VAR
  ke,next,head,s,lab,num,low:array[1..40000] of longint;
  free:array[1..800] of boolean;
  n,m,top,cnt,cnt1:longint;

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
      BEgin
        Read(x,y);
        Add(i,x,y);
      End;
    Fillchar(free,sizeof(free),true);
  End;

Procedure Push(x:longint);
  Begin
    inc(top);
    s[top]:=x;
  End;

Function pop:longint;
  Begin
    pop:=s[top];
    dec(top);
  End;

Procedure Dfs(u:longint);
  Var
    j,v:longint;
  Begin
    Push(u);
    inc(cnt1);
    num[u]:=cnt1;
    low[u]:=cnt1;
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
        inc(cnt);
        Repeat
          v:=pop;
          lab[v]:=cnt;
        Until v=u;
      End;
  End;

Procedure Xuli;
  Var
    i,j,v:longint;
  BEgin
    For i:=1 to n do If num[i]=0 then
      Begin
        Dfs(i);
      End;
    For i:=1 to n do
      Begin
        j:=head[i];
        While j<>0 do
          Begin
            v:=ke[j];
            If (free[lab[v]]) and (lab[i]<>lab[v]) then
              Begin
                dec(cnt);
                free[lab[v]]:=false;
              End;
            j:=next[j];
          End;
      End;
    Write(cnt);
  End;

BEGIN
  //assign(input,'message.inp');reset(input);
  //assign(output,'message.out');rewrite(output);
    Nhap;
    Xuli;
  //close(input);close(output);
END.
