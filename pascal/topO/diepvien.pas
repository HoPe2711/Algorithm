uses math;
const oo=1000000000;
var ke,head,next,a,f,f2:array[0..100000] of longint;
    f1:Array[0..5000,0..5000] of longint;
    free:array[0..5000] of boolean;
    n:longint;
procedure add(i,u,v:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
end;
procedure nhap;
var i,u,j:longint;
begin
 fillchar(free,sizeof(free),true);
 read(n);
 for i:=1 to n do read(a[i]);
 for i:=1 to n-1 do
  begin
   read(u);
   add(i,u,i+1);
  end;
end;
procedure DFS(u,p:longint);
var  j,v:longint;
begin
 f[u]:=a[u];
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if (v<>p) then
    begin
     DFS(v,u);
     f1[u,0]:=f1[u,0]+f[v];
     f[u]:=f[u]+min(f[v],f2[v]);
    end;
   j:=next[j];
  end;
 f2[u]:=f1[u,0];
 j:=head[u];
 while j<>0 do
  begin
   v:=ke[j];
   if v<>p then
    begin
     f1[u,v]:=f1[u,0]+f1[v,0]-f[v];
     f2[u]:=min(f1[u,v],f2[u]);
    end;
   j:=next[j];
  end;
end;
begin
 assign(input,'diepvien.inp');reset(input);
 assign(output,'diepvien.out');rewrite(output);
 nhap;
 DFS(1,0);
 write(min(f[1],f2[1]));
 close(input);close(output);
end.
