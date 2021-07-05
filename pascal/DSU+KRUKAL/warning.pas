var n,m:longint;
    a,lab,ke,next,head:array[-200000..200000] of longint;
    free,build:array[0..200000] of boolean;
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
var i,u,v,x:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
    read(u,v);
    add(i,u,v);
  end;
 for i:=1 to n do
  begin
   read(a[i]);
  end;
end;
function gettrout(u:longint):longint;
begin
 if lab[u]=u then exit(u);
 lab[u]:=gettrout(lab[u]);
 exit(lab[u]);
end;
procedure xuli;
var i,j,v,lt,cnt:longint;
begin
 for i:=1 to n do lab[a[i]]:=a[i];  lt:=0;
 for i:=n downto 1 do
  begin
   cnt:=0;
   build[a[i]]:=true;
   j:=head[a[i]];
   while j<>0 do
    begin
     v:=ke[j];
     if build[v] then
       if gettrout(a[i])<>gettrout(v) then
        begin
         inc(cnt);
         lab[lab[a[i]]]:=lab[v];
        end;
     j:=next[j];
    end;
   if cnt=0 then inc(lt)
   else lt:=lt-(cnt-1);
   if lt=1 then free[i]:=true;
  end;
 for i:=1 to n do
  if free[i] then writeln('YES')
  else writeln('NO');
end;
begin
 assign(input,'warning.inp');reset(input);
 assign(output,'warning.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.