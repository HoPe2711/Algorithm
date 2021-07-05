uses math;
const oo=100;
type node=record
     x,y:longint;
end;
var n,m,res:longint;
    a,b,ff:array[0..51,0..51] of longint;
    f,f1,f2,f3,fm1,fm,fm2,fm3:array[0..51] of node;
procedure nhap;
var i,j,kk:longint ;
begin
 read(n,m);   kk:=0;
 for i:=1 to n do
  for j:=1 to m do
   begin
    read(a[i,j]);
    if a[i,j]=2 then inc(kk);
    if a[i,j]=1 then b[i,j]:=1;
   end;
 if kk=1 then
  begin
   writeln(1);
   halt;
  end;
end;
function check(u,v,i,j:longint):boolean;
begin
 if (u=0) or (v=0) or (i=51) or (j=51) then exit(false);
 if (ff[u,v]-ff[i-1,v]-ff[u,j-1]+ff[i-1,j-1]=0) then exit(true);
 exit(False);
end;
procedure buildmin;
var i,j,kk,kk1:longint;
begin
 f[0].x:=oo;
 f[0].y:=oo;
 f1[0].x:=oo;
 f1[0].y:=oo;
 f2[0].x:=oo;
 f2[0].y:=oo;
 f3[0].x:=oo;
 f3[0].y:=oo;
 f[n+1].x:=oo;
 f[n+1].y:=oo;
 f1[n+1].x:=oo;
 f1[n+1].y:=oo;
 f2[m+1].x:=oo;
 f2[m+1].y:=oo;
 f3[m+1].x:=oo;
 f3[m+1].y:=oo;
 for i:=1 to n do
 begin
  kk:=51; kk1:=51;
  for j:=1 to m do
  if a[i,j]=2 then
   begin
    kk:=min(kk,j);
    kk1:=min(kk1,i);
   end;
  f[i].x:=min(f[i-1].x,kk1);
  f[i].y:=min(f[i-1].y,kk);
 end;
 for i:=n downto 1 do
 begin
  kk:=51; kk1:=51;
  for j:=1 to m do
  if a[i,j]=2 then
   begin
    kk:=min(kk,j);
    kk1:=min(kk1,i);
   end;
  f1[i].x:=min(f1[i+1].x,kk1);
  f1[i].y:=min(f1[i+1].y,kk);
 end;
 for i:=1 to m do
 begin
  kk:=51; kk1:=51;
  for j:=1 to n do
  if a[j,i]=2 then
   begin
    kk:=min(kk,i);
    kk1:=min(kk1,j);
   end;
  f2[i].x:=min(f2[i-1].x,kk1);
  f2[i].y:=min(f2[i-1].y,kk);
 end;
 for i:=m downto 1 do
 begin
  kk:=51; kk1:=51;
  for j:=1 to n do
  if a[j,i]=2 then
   begin
    kk:=min(kk,i);
    kk1:=min(kk1,j);
   end;
  f3[i].x:=min(f3[i+1].x,kk1);
  f3[i].y:=min(f3[i+1].y,kk);
 end;
end;



procedure buildmax;
var i,j,kk,kk1:longint;
begin
 for i:=1 to n do
 begin
  kk:=0; kk1:=0;
  for j:=1 to m do
  if a[i,j]=2 then
   begin
    kk:=max(kk,j);
    kk1:=max(kk1,i);
   end;
  fm[i].x:=max(fm[i-1].x,kk1);
  fm[i].y:=max(fm[i-1].y,kk);
 end;
 for i:=n downto 1 do
 begin
  kk:=0; kk1:=0;
  for j:=1 to m do
  if a[i,j]=2 then
   begin
    kk:=max(kk,j);
    kk1:=max(kk1,i);
   end;
  fm1[i].x:=max(fm1[i+1].x,kk1);
  fm1[i].y:=max(fm1[i+1].y,kk);
 end;
 for i:=1 to m do
 begin
  kk:=0; kk1:=0;
  for j:=1 to n do
  if a[j,i]=2 then
   begin
    kk:=max(kk,i);
    kk1:=max(kk1,j);
   end;
  fm2[i].x:=max(fm2[i-1].x,kk1);
  fm2[i].y:=max(fm2[i-1].y,kk);
 end;
 for i:=m downto 1 do
 begin
  kk:=0; kk1:=0;
  for j:=1 to n do
  if a[j,i]=2 then
   begin
    kk:=max(kk,i);
    kk1:=max(kk1,j);
   end;
  fm3[i].x:=max(fm3[i+1].x,kk1);
  fm3[i].y:=max(fm3[i+1].y,kk);
 end;
end;






procedure xuli;
var  i,j,u,v,kq,x1,x2,y1,y2:longint;
     tt,tt1:node;
begin
 buildmin;
 buildmax;
 for i:=1 to n do
  for j:=1 to m do ff[i,j]:=ff[i-1,j]+ff[i,j-1]-ff[i-1,j-1]+b[i,j];
 res:=51*51;
 for i:=1 to n do
  for j:=1 to m do
   for u:=i to n do
    for v:=j to m do
     if check(u,v,i,j) then
      begin
       tt.x:=min(min(f[i-1].x,f1[u+1].x),min(f2[j-1].x,f3[v+1].x));
       tt.y:=min(min(f[i-1].y,f1[u+1].y),min(f2[j-1].y,f3[v+1].y));
       tt1.x:=max(max(fm[i-1].x,fm1[u+1].x),max(fm2[j-1].x,fm3[v+1].x));
       tt1.y:=max(max(fm[i-1].y,fm1[u+1].y),max(fm2[j-1].y,fm3[v+1].y));
       if check(tt1.x,tt1.y,tt.x,tt.y) then
        begin
         kq:=(u-i+1)*(v-j+1)+(tt1.x-tt.x+1)*(tt1.y-tt.y+1);
         if not((tt1.y<j) or (v<tt.y) or (u<tt.x) or (tt1.x<i)) then
          begin
           x1:=max(i,tt.x); y1:=max(j,tt.y); x2:=min(u,tt1.x); y2:=min(v,tt1.y);
           kq:=kq-(x2-x1+1)*(y2-y1+1);
          end;
         res:=min(res,kq);
        end;
      end;
 if res=51*51 then res:=-1;
 write(Res);
end;
begin
 assign(input,'reccover.inp');reset(input);
 assign(output,'reccover.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
