 var n,m,res : longint;
        head,lab,u,v : array [1..200000] of longint;
        ke,next,c : array [-400000..400000] of longint;

    procedure add(u,v,i : longint);
     begin
      ke[i] := v;
      next[i] := head[u];
      head[u] := i;
      ke[-i] := u;
      next[-i] := head[v];
      head[v] := -i;
     end;

    procedure nhap;
     var i : longint;
      begin
       read(n,m);
       for i := 1 to m do read(u[i],v[i],c[i]);
      end;

     function getrout(u : longint) : longint;
      begin
       if lab[u] = u then exit(u);
       lab[u] := getrout(lab[u]);
       exit(lab[u]);
      end;

     procedure doicho(var x,y : longint);
      var tg : longint;
       begin
        tg := x;
        x := y;
        y := tg;
       end;

     procedure sort(l,r : longint);
      var i,j,key : longint;
       begin
        i := l;
        j := r;
        key := c[l+random(r-l+1)];
        repeat
         while c[i] < key do inc(i);
         while c[j] > key do dec(j);
         if i <= j then
          begin
           doicho(c[i],c[j]);
           doicho(u[i],u[j]);
           doicho(v[i],v[j]);
           inc(i);
           dec(j);
          end;
         until i > j;
        if l < j then sort(l,j);
        if i < r then sort(i,r);
       end;

     procedure add2;
      var i : longint;
       begin
        for i := 1 to m do add(u[i],v[i],i);
       end;

     procedure xuly;
      var j,u,v : longint;
       begin
        sort(1,m);
        add2;
        for u := 1 to n do lab[u] := u;
        for j := 1 to m do
         begin
          u := ke[-j];
          v := ke[j];
          if getrout(u) <> getrout(v) then
           begin
            lab[lab[u]] := lab[v];
            res := res+c[j];
           end;
         end;
        write(res);
       end;

     begin
      assign(input,'kruskal.inp');reset(input);
      assign(output,'kruskal.out');rewrite(output);
      nhap;
      xuly;
      close(input);close(output);
     end.
