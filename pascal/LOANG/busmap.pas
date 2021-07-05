uses math;
const oo=1000000000;
var  n,m,a,b,f,r:longint;
     ke,next,head,d,cha,queu,last:array[-1000000..4000000] of longint;
     free:Array[-100000..100000,0..1000] of boolean;
     last1:array[0..1000,0..1000] of longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ke[-i]:=v;
 next[-i]:=head[v];
 head[v]:=-i;
end;
procedure nhap;
var  i,x,pp,canh,j:longint;
begin
 read(n,m,a,b);         canh:=0;
 for i:=1 to m do
  begin
   read(x);
   for j:=1 to x do
    begin
     read(pp);
     if last[pp]<>0 then
      begin
       inc(canh);
       add(canh,last[pp],i);
       free[canh,pp]:=true;
       free[-canh,pp]:=true;
      end;
     last[pp]:=i;
    end;
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
procedure bfs(S:longint);
var u,j,v,tt:longint;
begin
 f:=1; r:=0;
 push(s); d[s]:=0;
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     //cha[v]:=u;
     for tt:=1 to n do
      if free[j,tt] then
       begin
        if (last1[u,tt]=1) and (d[v]>d[u]) then
         begin
          d[v]:=d[u];
          last1[v,tt]:=1;
          push(v);
         end;
        if (last1[u,tt]=0) and (d[v]>d[u]+1) then
         begin
          d[v]:=d[u]+1;
          last1[v,tt]:=1;
          push(v);
         end;
       end;
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to m do d[i]:=oo;
 bfs(a);
 write(d[b]);
end;
BEGIN
  assign(input,'busmap.inp');reset(input);
  assign(output,'busmap.out');rewrite(output);
  nhap;
  xuli;
  close(input);close(output);
END.
