uses math ;

const
  oo = 10000000000;

var
  n, m ,top, l, r, p, s ,c, cnt, t : longint ;
  dd, d, fre : array[1..500000] of boolean ;
  stk, q, ke, head, next, kee,hed, nxt, num, low, lab, sin , free, uu, vv : array[1..500000] of longint ;
  pt, pp: array[0..500000] of int64;
  a : array [0..500000] of longint ;

procedure push(i : longint);
  begin
    inc(top);
    stk[top] := i;
  end;

function pop : longint ;
  begin
    pop := stk[top] ;
    dec(top);
  end ;

procedure pushq(i : longint);
  begin
    inc(r);
    q[r] := i;
  end;

function popp : longint ;
  begin
    popp := q[l];
    inc(l);
  end;

procedure dfs(u : longint);
  var v, j : longint ;
  begin
    inc(c);
    push(u);
    num[u] := c;
    low[u] := c;
    j := head[u] ;
    while j <> 0 do
      begin
        v := ke[j];
        if lab[v] = 0 then
          begin
            if num[v] = 0 then
              begin
                dfs(v);
                low[u] := min(low[u], low[v]) ;
              end
            else low[u] := min(low[u], num[v]);
          end;
        j := next[j] ;
      end ;
    if num[u] = low[u] then
      begin
        inc(cnt);
        repeat
          v := pop;
          lab[v] := cnt ;
        until u= v;
      end;
  end ;

procedure ad(i, u, v : longint );
  begin
    ke[i] := v;
    next[i] := head[u] ;
    head[u] := i ;
  end ;

procedure ad1(u, v : longint );
  begin
    inc(t);
    kee[t] := v ;
    nxt[t] := hed[u] ;
    hed[u] := t ;
  end;

procedure xuli;
  var i, j, ss, u, v: longint ; res : int64 ;
  begin
    res := -oo;
    t := 0;
    c := 0; cnt := 0;
    for i := 1 to n do
      if num[i] = 0 then
        begin
          dfs(i);
        end ;

    for i := 1 to n do
      begin
        pt[lab[i]] := pt[lab[i]] + a[i] ;
        if dd[i] then d[lab[i]] := true ;
        if i = s then ss := lab[i] ;
      end;

    for i := 1 to m do
      begin
        if (lab[uu[i]] <> lab[vv[i]]) and (free[lab[vv[i]]] <> lab[uu[i]]) then
          begin
            ad1(lab[uu[i]], lab[vv[i]]);
            free[lab[vv[i]]] := lab[uu[i]];
            inc(sin[lab[vv[i]]]);
          end;
      end;

    l :=1 ;r := 0;

    for i := 1 to cnt do
      if sin[i] = 0 then
        begin
          pushq(i);
        end;

    for i := 1 to cnt do pp[i] := -oo ;
    pp[ss] := pt[ss] ;

    while l <= r do
      begin

        u := popp;
        j := hed[u] ;
        while j<> 0 do
          begin
            v := kee[j];
            pp[v] := max(pp[u] + pt[v], pp[v]);
            dec(sin[v]);
            if sin[v] = 0 then pushq(v);
            j := nxt[j] ;
          end;

      end;

    for i := 1 to cnt do
       if d[i] then res := max(res, pp[i]);
    writeln(res );
  end;

procedure nhap;
  var i, x, u, v : longint ;
  begin
    readln(n, m);
    for i := 1 to m do
      begin
        readln(uu[i], vv[i]);
        ad(i, uu[i], vv[i]);
      end;
    for i := 1 to n do readln(a[i]);
    readln(s, p);
    for i := 1 to p do
      begin
        read(x);
        dd[x] := true ;
      end;
    xuli ;
  end;

begin
  assign(input,'atm.inp'); reset(input);
  assign(output,'atm.out'); rewrite(output);
  nhap;
  close(input); close(output);
end.
