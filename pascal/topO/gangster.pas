var ke,next,ts:array[-5000..5000] of longint;
    head:array[1..1000] of longint;
    free:array[1..1000] of boolean;
    res,n,m:longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,u,v:longint;
    ch:char;
begin
 read(n);
 readln(m);
 for i:=1 to m do
  begin
   readln(ch,u,v);
   if ch='E' then add(i,u,v,2)
   else add(i,u,v,1);
  end;
end;
procedure DFS(u:longint);
var j,v,j1,v1:longint;
begin
 free[u]:=false;
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if ts[j]=1 then
    begin
     if free[v] then DFS(v) ;
    end
   else
    begin
     j1:=head[v];
     while j1<>0 do
      begin
       v1:=ke[j1];
       if (free[v1]) and (ts[j1]=2) then DFS(v1);
       j1:=next[j1];
      end;
    end;
   j:=next[j];
  end;
end;
procedure xuli;
var i:longint;
begin
 fillchar(free,sizeof(free),true);
 for i:=1 to n do
  if free[i] then
   begin
    inc(res);
    DFS(i);
   end;
 write(res);
end;
begin
// assign(input,'GANGSTER.inp');reset(input);
// assign(output,'GANGSTER.out');rewrite(output);
 nhap;
 xuli;
// close(input);
// close(output);
end.
