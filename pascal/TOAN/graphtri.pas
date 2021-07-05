uses math;
var  ke,next,head,ke1,next1,head1,ke2,next2,head2:array[-500000..500000] of longint;
     n,canh:longint;       res:int64;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;

procedure add1(i,u,v:longint);
begin
 ke1[i]:=v;
 next1[i]:=head1[u];
 head1[u]:=i;
 ke1[-i]:=u;
 next1[-i]:=head1[v];
 head1[v]:=-i;
end;
procedure add2(i,u,v:longint);
begin
 ke2[i]:=v;
 next2[i]:=head2[u];
 head2[u]:=i;
 ke2[-i]:=u;
 next2[-i]:=head2[v];
 head2[v]:=-i;
end;
procedure nhap;
var  t,i,m,u,v:longint;
begin
 read(n);
 read(m);     canh:=m;
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
 read(m);
 for i:=1 to m do
  begin
   read(u,v);
   adD1(i,u,v);
  end;
 read(m);
 for i:=1 to m do
  begin
   read(u,v);
   adD2(i,u,v);
  end;
end;
procedure xuli;
var i,u,v,p,q,ok,okt,ok1,okt1,j:longint;
begin
 for i:=1 to canh do
  begin
   p:=ke[i]; q:=ke[-i];
   for u:=1 to n do
   if (u<>p) and (u<>Q) then
    begin
     ok:=0; okt:=0; ok1:=0; okt1:=0;
     j:=head1[u];
     while j<>0 do
      begin
       v:=ke1[j];
       if v=p then ok:=1;
       if v=q then ok1:=1;
       j:=next1[j];
      end;
     j:=head2[u];
     while j<>0 do
      begin
       v:=ke2[j];
       if v=p then okt:=1;
       if v=q then okt1:=1;
       j:=next2[j];
      end;
     if (ok=1) and (okt1=1) then inc(reS);
     if (ok1=1) and (okt=1) then inc(reS);
    end;
  end;
 write(Res);
end;
begin
 assign(input,'graphtri.inp');reset(input);
 assign(output,'graphtri.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.