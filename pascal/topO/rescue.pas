var ke,next:array[-15001..15001] of longint;
    free:array[1..10001] of boolean;
    head,deg:array[1..10001] of longint;
    n,m,k,res:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,m,k);
 for i:=1 to m do
  begin
   read(u,v);
   inc(deg[u]);
   inc(deg[v]);
   add(i,u,v);
  end;
end;
procedure xuli;
var i,j,k1:longint;
    ok:boolean;
begin
 fillchar(free,sizeof(free),true);
 repeat
  ok:=true;
  for i:=1 to n do
   if free[i] and (deg[i]<k) then
    begin
     free[i]:=false;
     j:=head[i];
     while j<>0 do
      begin
       k1:=ke[j];
       dec(deg[k1]);
       j:=next[j];
      end;
     ok:=false;
    end;
 until ok;
 for i:=1 to n do
  if free[i] then inc(res);
  write(res);
end;
begin
 assign(input,'rescue.inp');reset(input);
 assign(output,'rescue.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.