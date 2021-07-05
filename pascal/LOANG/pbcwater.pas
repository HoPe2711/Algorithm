uses math;
const q:array[1..4] of longint=(0,0,1,-1);
      q1:array[1..4] of longint=(1,-1,0,0);
var maxx,r,f,m,n,res,x,y:longint;
    a:array[0..100,0..100] of longint;
    queu,queu1:array[0..200000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n);
 for i:=1 to m do
  for j:=1 to n do
   begin
    read(a[i,j]);
    maxx:=max(maxx,a[i,j]);
   end;
end;
procedure push(i,j:longint);
begin
 inc(r);
 queu[r]:=i;
 queu1[r]:=j;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
procedure BFS(h:longint);
var i,u,v:longint;
begin
 f:=1; r:=0;
 for i:=1 to n do
  begin
   if a[1,i]=h then
    begin
     a[1,i]:=h+1;
     push(1,i);
    end;
   if a[m,i]=h then
    begin
     a[m,i]:=h+1;
     push(m,i);
    end;
  end;
 for i:=2 to m-1 do
  begin
   if a[i,n]=h then
    begin
     a[i,n]:=1+h;
     push(i,n);
    end;
   if a[i,1]=h then
    begin
     push(i,1);
     a[i,1]:=1+h;
    end;
  end;
 while f<=r do
  begin
   pop;
   for i:=1 to 4 do
    begin
     u:=x+q[i];
     v:=y+q1[i];
     if (u<=m) and (u>=1) and (v<=n) and (v>=1) then
      if a[u,v]=h then
       begin
        a[u,v]:=h+1;
        push(u,v);
       end;
    end;
  end;
end;
procedure xuli;
var i,t,k:longint;
begin
 for i:=1 to maxx-1 do
  begin
   BFS(i);
   for t:=1 to m do
    for k:=1 to n do
     if a[t,k]=i then
      begin
       a[t,k]:=i+1;
       inc(res);
      end;
  end;
 write(res);
end;
begin
 //assign(input,'pbcwater.inp');reset(input);
 nhap;
 xuli;
 //close(input);
end.