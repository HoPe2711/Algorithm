uses math;
const oo=1000000000;
      q:array[1..4] of longint=(1,0,0,-1);
      q1:array[1..4] of longint=(0,1,-1,0);
VAR  st:String;
     n,u,v,s,t,res,x,y,z,f,r:longint;
     a:array[0..200,0..200] of longint;
     d:Array[0..200,0..200,0..5] of longint;
     queu,queu1,queu2:Array[-2000000..2000000] of longint;
PROCEDURE nhap;
var i,j:longint;
begin
 readln(N);
 for i:=1 to n do
  begin
   readln(St);
   for j:=1 to n do if st[j]='.' then a[i,j]:=0 else a[i,j]:=1;
  end;
 readln(u,v,s,t);
 inc(u); inc(v); inc(s); inc(t);
end;
procedure push(x,y,z:longint);
begin
 inc(r);
 queu[r]:=x;
 queu1[r]:=y;
 queu2[r]:=z;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 z:=queu2[f];
 inc(f);
end;
procedure back(x,y,z:longint);
begin
 dec(f);
 queu[f]:=x;
 queu1[f]:=y;
 queu2[f]:=z;
end;
procedure BFS;
var  i,j,k,x1,y1:longint;
begin
 for i:=1 to n do
  for j:=1 to n do
   for k:=1 to 4 do d[i,j,k]:=oo;
 f:=1; r:=0;
 for k:=1 to 4 do
  begin
   d[u,v,k]:=0;
   push(u,v,k);
  end;
 while f<=r do
  begin
   pop;
   for i:=1 to 4 do
    begin
     x1:=x+q[i]; y1:=y+q1[i];
     if (x1<=n) and (x1>0) and (y1<=n) and (y1>0) then
     if a[x1,y1]=0 then
      begin
       if i=z then
        if d[x1,y1,z]>d[x,y,z] then
         begin
          d[x1,y1,z]:=d[x,y,z];
          back(X1,y1,z);
         end;
       if i<>Z then
       if d[x1,y1,i]>d[x,y,z]+1 then
        begin
         d[x1,y1,i]:=d[x,y,z]+1;
         push(x1,y1,i);
        end;
      end
    end;
  end;
end;
procedure xuli;
var i:longint;
begin
 BFS;
 res:=oo;
 for i:=1 to 4 do res:=min(res,d[s,t,i]);
 write(res+1);
end;
begin
 assign(input,'gird.inp');reset(input);
 assign(output,'gird.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.