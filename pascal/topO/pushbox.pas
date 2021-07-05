var head,ts,d,truoc,queu,next,ke,dd:array[0..50000] of longint;
    free:array[0..50000] of boolean;
    n,m,k,res,f,r:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=u;
 next[i]:=head[v];
 head[v]:=i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,m,k);
 for i:=1 to k do
  begin
   read(u);
   ts[u]:=1;
   dd[i]:=u;
  end;
 for i:=1 to m do
  begin
   read(u,v);
   add(i,u,v);
  end;
end;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
procedure BFS(s:longint);
var u,v,j:longint;
begin
 push(s);
 free[s]:=false;
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if free[v] then
      begin
       free[v]:=false;
       truoc[v]:=u;
       d[v]:=d[u]+1;
       push(v);
      end;
     j:=next[j];
    end;
  end;
end;
Procedure doicho(var x,y:longint);
Var
  tg:longint;
  Begin
    tg:=x;
    x:=y;
    y:=tg;
  End;
Procedure Qsort(l,r:longint);
Var
  i,j,key:longint;
  Begin
    i:=l;
    j:=r;
    key:=d[dd[(l+r) div 2]];
    repeat
      while d[dd[i]] < key do inc(i);
      while d[dd[j]] > key do dec(j);
      if i <= j then
      Begin
      doicho(dd[i],dd[j]);
      inc(i);
      dec(j);
      End;
    until i > j;
    if l < j then Qsort(l,j);
    if i < r then Qsort(i,r);
  End;
procedure xuli;
var i,j:longint;
begin
 fillchar(free,sizeof(free),true);
 f:=1;
 r:=0;
 BFS(1);
 for i:=1 to n do
 if ts[i]=1 then  res:=res+d[i];
 writeln(res);
 qsort(1,k);
 for j:=1 to k do
 begin
  i:=dd[j];
  while i<>1 do
   begin
    writeln(i,' ',truoc[i]);
    i:=truoc[i];
   end;
  end;
end;
begin
 assign(input,'PUSHBOX.inp');reset(input);
 assign(output,'PUSHBOX.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
