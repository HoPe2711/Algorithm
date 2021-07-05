uses math;
const
  fi='safenet2.inp';
  fo='safenet2.out';
  maxn=50000;
  maxm=200000;
  oo=trunc(1e9);
type
  Tedge = record
     x,y  : longint;
     end;
var
  link,head,ke,lab : array[-maxm..maxm] of longint;
  i,j,n,m,u,v,ans,top,count,dem ,slt: longint;
  num,low : array[1..maxn] of longint;
  st : array[1..maxm] of Tedge;
  free : array[-maxm..maxm] of boolean;
  pa : array[1..maxn] of longint;
procedure push(x,y : longint);
  begin
    inc(top);
    st[top].x := x;
    st[top].y := y;
  end;
procedure pop ( var x,y : longint);
  begin
    x := st[top].x;
    y := st[top].y;
    dec(top);
  end;
procedure dfs(u : longint);
  var i,v,x,y : longint;
  begin
    inc(count);
    num[u] := count;
    low[u] := oo;
    if count = 1 then
      if head[u] = 0 then
        ans := max(ans,1);
    i := head[u];
    while i <> 0 do
      begin
          v := ke[i];
          if v <> pa[u] then
          if num[v] = 0 then
            begin
              pa[v] := u;
              push(u,v);
              dfs(v);
              low[u] := min(low[u],low[v]);
              if low[v] >= num[u] then
                begin
                  inc(slt);
                  dem := 0;
                  repeat
                    pop(x,y);
                    lab[y]:=slt;
                    dem := dem + 1;
                  until (X=U) AND (Y=V);
                  lab[u]:=slt;
                  ans := max(ans,dem+1);
                end;
            end
            else
            begin
              low[u] := min(low[u],num[v]);
            end;
        i := link[i];
      end;
  end;
procedure add(i,u,v : longint);
  begin
    link[i] := head[u];
    head[u] := i;
    ke[i] := v;
  end;
procedure main;
var i  :  longint;
begin
  assign(input,fi);reset(input);
  assign(output,fo);rewrite(output);
  read(n,m);
  for i := 1to m do
    begin
      read(u,v);
      add(i,u,v);
      add(-i,v,u);
    end;
  fillchar(free,sizeof(free),true);
  for i := 1 to n do
    if num[i] = 0 then
      begin
        count := 0;
        dfs(i);
      end;
  writeln(ans);
  close(input);close(output);
end;
begin
  main;
end.
