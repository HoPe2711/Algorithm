uses math;
var n,time,l,test,t:longint;
    f:array[0..1000,0..10] of longint;
    free:array[0..1000] of boolean;
    ke,next,head,tin,tout:array[-1000..1000] of longint;
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
var i,j,k,x,u:longint;
begin
 fillchar(ke,sizeof(ke),0);
 fillchar(head,sizeof(head),0);
 fillchar(next,sizeof(next),0);
 time:=0;
 k:=0;
 read(n);
 for i:=1 to n do
  begin
   read(x);
   for j:=1 to x do
    begin
     read(u);
     inc(k);
     add(k,i,u);
    end;
  end;
 f[1,0]:=1;
 l:=trunc(log2(n));
end;
procedure DFS(u:longint);
var j,v:longint;
begin
 inc(time);
 tin[u]:=time;
 for j:=1 to l do f[u,j]:=f[f[u,j-1],j-1];
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>f[u,0] then
    begin
     f[v,0]:=u;
     DFS(v);
    end;
   j:=next[j];
  end;
 inc(time);
 tout[u]:=time;
end;
function anc(u,v:longint):boolean;
begin
 if (tin[u]<=tin[v]) and (tout[u]>=tout[v]) then exit(true);
 exit(false);
end;
function LCA(u,v:longint):longint;
var j:longint;
begin
 if anc(u,v) then exit(u);
 if anc(v,u) then exit(v);
 for j:=l downto 0 do
  if anc(f[u,j],v)=false then u:=f[u,j];
 exit(f[u,0]);
end;
procedure inkq;
var q,v,w,i:longint;
begin
 DFS(1);
 read(q);
 write('Case',' ');
 write(t);
 writeln(':');
 for i:=1 to q do
  begin
    read(v,w);
    writeln(LCA(v,w));
  end;
end;
BEGIN
  assign(input,'LCA.inp');reset(input);
  assign(output,'lCA.out');rewrite(output);
  read(test);
  for t:=1 to test do
   begin
    nhap;
    inkq;
   end;
 close(input);close(output);
END.

