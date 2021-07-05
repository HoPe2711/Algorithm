const base=1000000007;
var ke,next,head,tin,dp,queu:array[0..100000] of longint;
    n,m,f,r,res:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,u,v:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v);
   inc(tin[v]);
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
procedure xuli;
var i,u,v,j:longint;
begin
 f:=1; r:=0;
 for i:=1 to n do
  if tin[i]=0 then push(i);
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     dp[v]:=(dp[v]+(dp[u]+1) mod base) mod base;
     dec(tin[v]);
     if tin[v]=0 then push(v);
     j:=next[j];
    end;
  end;
 for i:=1 to n do res:=(res+dp[i]) mod base;
 write(res);
end;
begin
 assign(input,'cpdag.inp');reset(input);
 assign(output,'cpdag.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
