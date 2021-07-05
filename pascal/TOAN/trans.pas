uses math;
var  ke,next,head,ke1,head1,next1,deg,res,res1:Array[0..10000] of longint;
     canh,canh1,n,m,k:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;

procedure add1(i,u,v:longint);
begin
 ke1[i]:=v;
 next1[i]:=head1[u];
 head1[u]:=i;
end;

procedure nhap;
var  i,u,v:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   inc(deg[u]); inc(deg[v]);
   inc(canh); add(canh,u,v);
   inc(canh); add(canh,v,u);
  end;
end;

procedure build(pp:longint);
var  u,i,j,v:longint;
begin
      fillchar(next1,sizeof(next1),0);
      fillchar(head1,sizeof(head1),0);
      fillchar(ke1,sizeof(ke1),0);
      canh1:=0;
      inc(k);
      res[k]:=1; res1[k]:=pp;
      for u:=1 to n do
      if u<>pp then
        begin
         j:=head[u];
         while j<>0 do
          begin
           v:=ke[j];
           if v<>pp then
            begin
             if v>pp then dec(V);
             inc(Canh1);
             if u>pp then add1(canh1,u-1,v) else add1(canh1,u,v);
            end;
           j:=next[j];
          end;
        end
      else
       begin
        j:=head[u];
        while j<>0 do
         begin
          v:=ke[j];
          dec(deg[v]);
          j:=next[j];
         end;
       end;
    ke:=ke1;
    next:=next1;
    head:=head1;
    canh:=canh1;
    for i:=pp to n-1 do deg[i]:=deg[i+1];
    deg[n]:=0;
    dec(n);
end;
procedure xuli;
var pp,i,j,u,v,c,tmp,tmp1:longint;
begin
  while canh<>0 do
   begin
    pp:=0;
    for u:=1 to n do
     if deg[u] mod 2=1 then pp:=u;
    if pp <>0 then
     begin
      build(pp);
      continue;
     end;
    inc(k); res[k]:=2;
     for u:=1 to n do
      begin
       j:=head[u];
       while j<>0 do
        begin
         v:=ke[j];
         inc(canh);   inc(deg[u+n]);
         add(canh,u+n,v+n);
         j:=next[j];
        end;
       inc(Canh);
       inc(deg[u]);
       add(canh,u,u+n);
       inc(Canh);
       inc(deg[u+n]);
       add(canh,u+n,u);
      end;
     n:=2*n;
     c:=n div 2;
     while n>c+1 do
      begin
       pp:=0;
       for u:=1+c to n do
        if deg[u] mod 2=1 then pp:=u;
       if pp=0 then break;
       build(pp);
      end;
     if n=c+1 then
      begin
       //build(n-1);
       for u:=1 to c do
        if deg[u] mod 2=1 then pp:=u;
       build(pp);
       continue;
      end;
     while true do
      begin
       tmp:=0; tmp1:=0;
       for u:=1 to n do
        if deg[u] mod 2= 1 then
         begin
          j:=head[u];
          while j<>0 do
           begin
            v:=ke[j];
            if ((u<=c) and (v>=c+1)) or ((u>=c+1) and (v<=c)) then
             begin
              if v>u then dec(v);
              tmp:=u; tmp1:=v;
             end;
            j:=next[j];
           end;
         end;
       if tmp=0 then break;
       build(tmp); build(tmp1);
      end;
   end;
 writeln(k);
 for i:=1 to k do
  begin
   write(res[i],' ');
   if res[i]=1 then write(res1[i]);
   writeln;
  end;
end;
begin
 assign(input,'trans.inp');reset(input);
 assign(output,'trans.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
