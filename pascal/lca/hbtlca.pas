uses math;

var
  ke, next, head:array[-100000..100000] of longint;
  tin, tout, d:array[0..100000] of longint;
  f:array[1..100000, 0..20] of longint;
  time, n, goc, l:longint;

procedure ad(i, u, v:longint);
  begin
    ke[i]:=v;
    next[i]:=head[u];
    head[u]:=i;
    ke[-i]:=u;
    next[-i]:=head[v];
    head[v]:=-i;
  end;

procedure dfs(u:longint);
  var v, j:longint;
  begin
    inc(time);
    tin[u]:=time;
    for j:=1 to l do f[u, j]:=f[f[u, j-1], j-1];
    j:=head[u];
    while j<>0 do
      begin
        v:=ke[j];
        if v <> f[u, 0] then
          begin
            f[v, 0]:=u;
            d[v]:=d[u]+1;
            dfs(v);
          end;
        j:=next[j];
      end;
    inc(time);
    tout[u]:=time;
  end;

function anc(u, v:longint):boolean;
  begin
    if (tin[u]<=tin[v]) and (tout[u]>=tout[v]) then exit (true);
    exit(false);
  end;

function lca(u, v:longint):longint;
  var j:longint;
  begin
    if anc(u, v) then exit(u);
    if anc(v, u) then exit(v);
    for j:=l downto 0 do
      if not anc(f[ u, j], v) then u:=f[u, j];
    exit(f[u, 0]);
  end;

procedure check(u, v:longint);
  var p1, p2, p3, tg:longint;
  begin
    p1:=lca(u, v);
    p2:=lca(goc, u);
    p3:=lca(goc, v);
    if (d[p1]>=d[p2]) and (d[p1]>=d[p3]) then writeln(p1)
        else
        if (d[p2]>=d[p3]) and (d[p2]>=d[p1]) then writeln(p2)
        else writeln(p3);

  end;

procedure nhap;
  var i, u, v:longint;
  begin
    fillchar(head, sizeof(head), 0);
    fillchar(ke, sizeof(ke), 0);
    fillchar(next, sizeof(next), 0);
    readln(n);
    for i:=0 to 20 do if 1 shl i<=n then l:=i+1;
    //l:=trunc(log2(n));
    for i:=1 to n-1 do
      begin
        readln(u,v);
        ad(i, u, v);
      end;
  end;

procedure xuli;
  var i,j,q,u,v:longint; ch:char;
  begin
    while not seekeof (input) do
      begin
        nhap;
        if n=0 then exit;
        time:=0;
        f[1,0]:=1;
        dfs(1);
        readln(q);
        goc:=1;
        for i:=1 to q do
            begin
                read(ch);
                if ch='!' then
                    begin
                        readln(goc);
                    end
                else
                if ch='?' then
                    begin
                        readln(u,v);
                        check(u,v);
                    end;
            end;
      end;
  end;


begin
  //assign(input,'hbtlca.inp'); reset(input);
  //assign(output,'hbtlca.out'); rewrite(output);
  xuli;
  //close(input); close(output);
end.