uses math;
var ke,next,head,ts:array[-300000..300000] of longint;
    free:array[0..200000] of boolean;
    n,m,cnt:longint;
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
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if (ts[j]=0) and (ts[-j]=0) then
    begin
     ts[j]:=cnt;
     ts[-j]:=cnt;
     inc(cnt);
    end;
   if free[v]=false then
    begin
     free[v]:=true;
     DFS(v);
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var i:longint;
begin
 cnt:=1;
 free[1]:=true;
 DFS(1);
 if n=1 then
  begin
   write(0);
   exit;
  end;
 for i:=1 to m do
  begin
  // if ts[i]=cnt-1 then ts[i]:=1;
   writeln(ke[-i],' ',ke[i],' ',ts[i]);
  end;
end;
begin
 assign(input,'onegcd.inp');reset(input);
 assign(output,'onegcd.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.