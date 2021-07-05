Uses math;
Const
  x1 : array [1..6] of longint = (1,0,1,0,-1,-1);
  y1 : array [1..6] of longint = (0,1,1,-1,0,-1);
  x2 : array [1..6] of longint = (-1,-1,0,1,0,1);
  y2 : array [1..6] of longint = (1,0,1,0,-1,-1);

Type
  node = record
  u,v : longint
  end;

VAR
  n,m,f,r : longint;
  c,d : array [1..500,1..500] of longint;
  queue : array [-250000..250000] of node;
  a : array [1..500,1..500] of char;

Procedure nhap;
  Var
    i,j : longint;
    ch : char;
  Begin
    readln(n,m);
    for i := 1 to n do
      Begin
        for j := 1 to m do
          Begin
            read(ch);
            if ((i+j) mod 2 = 0) then
              Begin
                if (ch='/') then c[i,j] := 1;
                a[i,j] := '\';
              End;
            if ((i+j) mod 2 = 1) then
  Begin
   if (ch='\') then c[i,j] := 1;
   a[i,j] := '/';
  end;
    end;
   readln;
  end;
   end;

  procedure pushcuoi(x,y : longint);
  Begin
   inc(r);
   queue[r].u := x;
   queue[r].v := y;
  end;

  procedure pushdau(x,y : longint);
  Begin
   dec(f);
   queue[f].u := x;
   queue[f].v := y;
  end;

  function pop : node;
  Begin
   pop := queue[f];
   inc(f);
  end;

  procedure bfs(u,v : longint);
  var i,x,y : longint;
   Begin
    f := 1;
    r := 0;
    pushcuoi(u,v);
    while f <= r do
  with pop do
   for i := 1 to 6 do
    Begin
    if a[u,v]='\' then
  Begin
   x := u+x1[i];
   y := v+y1[i];
  end
    else
  Begin
   x := u+x2[i];
   y := v+y2[i];
  end;
    if (x>0) and (y>0) and (x<=n) and (y<=m) then
  if d[x,y] = -1 then
   Begin
    d[x,y] := d[u,v]+c[x,y];
    if c[x,y] = 0 then pushdau(x,y)
    else pushcuoi(x,y);
   end
  else d[x,y] := min(d[x,y],d[u,v]+c[x,y]);
    end;
   end;

  procedure xuly;
  var i,j : longint;
   Begin
    if (n+m) mod 2 = 1 then
  Begin
   write('NO SOLUTION');
   exit;
  end;
    for i := 1 to n do
  for j := 1 to m do d[i,j] := -1;
    d[1,1] := c[1,1];
    bfs(1,1);
    write(d[n,m]);
   end;

BEGIN
  assign(input,'lamp.inp');reset(input);
  assign(output,'lamp.out');rewrite(output);
    nhap;
    xuly;
  close(input);close(output);
END.
