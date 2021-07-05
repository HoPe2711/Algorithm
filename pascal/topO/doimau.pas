var ke,next,ts:array[-1000000..1000000] of longint;
    head,queu,d:array[1..1000000] of longint;
    free:array[0..1000] of boolean;
    dd:Array[0..1000,0..1000] of longint;
    n,m,mau,r,f,k:longint;
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
var i,u,v,j:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   if ((u=1) and (v=n)) or ((u=n) and (v=1)) then mau:=1;
   dd[u,v]:=1;
   dd[v,u]:=1;
  end;
 k:=0;
 for i:=1 to n-1 do
  for j:=i+1 to n do
    begin
     inc(k);
     add(k,i,j,dd[i,j]);
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
 while f<=r do
  begin
  u:= pop;
   j:=head[u];
   free[u]:=false;
   while j<>0 do
    begin
     v:=ke[j];
     if (free[v]) and (ts[j]=0) then
      begin
       d[v]:=d[u]+1;
       push(v);
       free[v]:=false;
      end;
     j:=next[j];
    end;
  end;
end;
procedure BFS1(s:longint);
var u,v,j:longint;
begin
 push(s);
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   free[u]:=false;
   while j<>0 do
    begin
     v:=ke[j];
     if (free[v]) and (ts[j]=1) then
      begin
       d[v]:=d[u]+1;
       push(v);
       free[v]:=false;
      end;
     j:=next[j];
    end;
  end;
end;
procedure xuli;
begin
 fillchar(free,sizeof(free),true);
 f:=1;
 if mau=1 then BFS(1)
 else BFS1(1);
 if d[n]=0 then write(-1)
 else write(d[n]);
end;
begin
// assign(input,'12.inp');reset(input);
// assign(output,'12.out');rewrite(output);
 nhap;
 xuli;
// close(input);
// close(output);
end.
