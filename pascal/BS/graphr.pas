uses math;
var ke,next,head,ts,tt:array[-500000..500000] of longint;
    n,m,mid:longint;
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
var  i,u,v,c:longint;
begin
 read(n,m);
 For i:=1 to m do
  begin
   read(u,v,c);
   add(i,u,v,c);
  end;
end;
procedure dfs(u:longint);
var  j,v:longint;
begin
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if ts[j]<=mid then
   if tt[v]=0 then
    begin
     tt[v]:=1;
     DFS(v);
    end;
   j:=next[j];
  end;
end;
function check:boolean;
var i:longint;
begin
 for i:=1 to n do tt[i]:=0;
 tt[1]:=1;
 DFS(1);
 if tt[n]=0 then exit(false);
 exit(true);
end;
procedure xuli;
var l,r,res:longint;
begin
 res:=0;
 l:=1;
 r:=10**7;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check then
    begin
     res:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 if res=0 then
  begin
   write('NO PATH EXISTS');
   exit;
  end;
 write(res);
end;
begin
 assign(input,'graphr.inp');reset(input);
 assign(output,'graphr.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
