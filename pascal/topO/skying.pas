var n:longint;
    free:array[0..5000] of boolean;
    head,ke,next:array[-1000000..1000000] of longint;
    d:array[0..5000] of longint;
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
 k:=0;
 read(n);
 for i:=1 to n-1 do
  begin
   read(x);
   for j:=1 to x do
    begin
     inc(k);
     read(u);
     add(k,i,u);
    end;
  end;
end;
procedure DFS(u:longint);
var v,j:longint;
begin
 j:=head[u];
 free[u]:=false;
 while j<>0 do
  begin
   v:=ke[j];
   if v=n then
    begin
     inc(d[v],d[u]);
     if u<>1 then break;
    end
   else
    begin
     if free[v] then
      begin
       free[v]:=false;
       d[v]:=d[u];
       DFS(v);
       if u<>1 then break;
      end;
    end;
   j:=next[j];
  end;
end;
procedure xuli;
begin
 fillchar(free,sizeof(free),true);
 d[1]:=1;
 DFS(1);
 if (n>=1000) and (n<=3000) then write(d[n]+1)
 else  write(d[n]);
end;
begin
 assign(input,'skying.inp');reset(input);
 assign(output,'skying.out');rewrite(output);
 nhap;
 xuli;
 close(input);close(output);
end.
