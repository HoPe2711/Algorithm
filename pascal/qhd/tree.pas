uses math;
var ke,next,head,d,queu:array[-500000..500000] of longint;
    f1,f2,g1,g2:array[0..500000] of int64;
    kq,f,r,n:longint;     res1,res:int64;
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
 read(n);
 for i:=1 to n-1 do
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
var u,j,v:longint;
begin
 f:=1; r:=0;
 push(s);   d[s] := 0;
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if d[v]=0 then
      begin
       d[v]:=d[u]+1;
       push(v);
      end;
     j:=next[j];
    end;
  end;
end;
procedure xuli;
var i:longint;
begin
 BFS(1);
 for i:=1 to n do
  if d[i]>res then
   begin
    res:=d[i];
    kq:=i;
   end;
 fillchar(d,sizeof(d),0);
 res:=0;
 BFS(kq);
 for i:=1 to n do res:=max(res,d[i]);
 write(res + 1,' ');
end;
procedure DFS(u,p:longint);
var  j,v:longint;
begin
 j:=head[u];
 g1[u]:=1;
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
   begin
    DFS(v,u);
    if f1[v]+1>f1[u] then
     begin
      f2[u]:=f1[u];
      g2[u]:=g1[u];
      f1[u]:=f1[v]+1;
      g1[u]:=g1[v];
     end
    else if (f1[v]+1=f1[u])  then
     begin
      f2[u]:=f1[u];
      g2[u]:=g1[u];
      g1[u]:=g1[u]+g1[v];
     end
    else
    begin
     if (f1[v]+1>f2[u]) then
      begin
       f2[u]:=f1[v]+1;
       g2[u]:=g1[v];
      end
     else if f1[v]+1=f2[u] then g2[u]:=g2[u]+g1[v];
    end;
   end;
   j:=next[j];
  end;
end;
procedure xuli1;
var i,j,v:longint;
    tmp : int64;
begin
 DFS(1,0);
 for i := 1 to n do res := max(res, f1[i] + f2[i]);
 for i:=1 to n do
 if f1[i]+f2[i] = res then
  begin
   if f1[i]=f2[i]  then
    begin
     tmp := 0;
     j:=head[i];
     while j<>0 do
      begin
       v:=ke[j];
       if (f1[v]+1=f1[i]) then tmp := tmp + g1[v]*(g1[i]-g1[v]);
       j:=next[j];
      end;
     res1 := res1 + tmp div 2;
    end
   else  res1:=res1+g1[i]*g2[i];
  end;
 write(res + 1,' ', res1);
end;
begin
 assign(input,'tree.inp');reset(input);
 assign(output,'tree.out');rewrite(output);
 nhap;
 //xuli;
 xuli1;
 close(input); close(output);
end.
