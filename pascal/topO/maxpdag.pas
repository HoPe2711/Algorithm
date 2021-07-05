uses math;
var n,m,r,f:longint;
    res:int64;
    ke,next,head,ts,queu,tin:Array[0..100000] of longint;
    dp:array[0..100000] of int64;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
end;
procedure nhap;
var i,u,v,c:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(u,v,c);
   inc(tin[v]);
   add(i,u,v,c);
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
var i,j,v,u:longint;
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
     dp[v]:=max(dp[v],dp[u]+ts[j]);
     dec(tin[v]);
     if tin[v]=0 then push(v);
     j:=next[j];
    end;
  end;
 for i:=1 to n do res:=max(res,dp[i]);
 write(res);
end;
begin
 assign(input,'maxpdag.inp');reset(input);
 assign(output,'maxpdag.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
