{$H+}
uses math;
const q1:array[1..8] of longint=(1,-1,0,0,1,1,-1,-1);
      q2:array[1..8] of longint=(0,0,-1,1,1,-1,1,-1);
var  m,n,res,f,r,x,y:longint;
     st:string;
     a,d:Array[0..1001,0..1001] of longint;
     queu,queu1:array[-1200000..1200000] of longint;
procedure nhap;
var i,j:longint;
begin
 readln(m,n);
 for i:=1 to m do
  begin
   readln(st);
   for j:=1 to length(st) do
    if st[j]='.' then a[i,j]:=0
    else a[i,j]:=1;
  end;
 for i:=2 to m-1 do a[i,0]:=1;
 for i:=2 to m-1 do a[i,n+1]:=1;
end;
procedure push(i,j:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
end;
procedure back(i,j:longint);
begin
 dec(f);
 queu[f]:=i;
 queu1[f]:=j;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure BFS;
var t,u,v:longint;
begin
 while f<=r do
  begin
   pop;
   for t:=1 to 8 do
    begin
     u:=x+q1[t];
     v:=y+q2[t];
     if (u<=m-1) and (v<=n+1) and (u>=2) and (v>=0) then
      begin
       if (a[u,v]=1) and (d[u,v]>d[x,y]) then
        begin
         d[u,v]:=d[x,y];
         back(u,v);
        end;
       if (a[u,v]=0) and (d[u,v]>d[x,y]+1)  then
        begin
         d[u,v]:=d[x,y]+1;
         push(u,v);
        end;
      end;
    end;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 f:=1;
 r:=0;
 for i:=2 to m-1 do
  for j:=0 to n+1 do d[i,j]:=10000000;
 for i:=2 to m-1 do
  begin
   push(i,0);
   d[i,0]:=0;
  end;
 BFS;
 write(d[m-1,n+1]);
end;
begin
 assign(input,'path.inp');reset(input);
 assign(output,'path.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
