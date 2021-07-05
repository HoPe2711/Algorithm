uses math;
const q1:array[1..4] of longint=(1,-1,0,0);
      q2:array[1..4] of longint=(0,0,-1,1);
var n,res,r,f,res1,kt,x,y,hmin,hmax:longint;
    a:array[0..501,0..501] of longint;
    queu,queu1:array[0..250000] of longint;
    free:array[0..501,0..501] of boolean;
procedure nhap;
var i,j:longint;
begin
 read(n);
 hmin:=maxlongint;
 for i:=1 to n do
  for j:=1 to n do
   begin
    read(a[i,j]);
    hmin:=min(hmin,a[i,j]);
    hmax:=max(hmax,a[i,j]);
   end;
 if n*n mod 2=1 then kt:=n*n div 2+1
 else kt:=n*n div 2;
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
procedure bfs(x1,s,s1:longint);
var u,v,i:longint;
begin
 f:=1; r:=0;
 push(s,s1);
 free[s,s1]:=false;
 while f<=r do
  begin
   pop;
   for i:=1 to 4 do
    begin
     u:=x+q1[i];
     v:=y+q2[i];
     if (u>=1) and (u<=n) and (v>=1) and (v<=n) then
     if (free[u,v]) and (abs(a[u,v]-a[x,y])<=x1) then
      begin
       free[u,v]:=false;
       inc(res1);
       push(u,v);
      end;
    end;
  end;
end;
function check(x:longint):longint;
var pp,i,j:longint;
begin
 fillchar(free,sizeof(free),true);
 pp:=0;
 for i:=1 to n do
  for j:=1 to n do
   if free[i,j] then
   begin
    res1:=1;
    bfs(x,i,j);
    pp:=max(pp,res1);
   end;
 exit(pp);
end;
procedure xuli;
var l,r1,mid:longint;
begin
 res:=maxlongint;
 l:=hmin;
 r1:=hmax;
 while l<=r1 do
  begin
   mid:=(l+r1) div 2;
   if check(mid)>=kt then
    begin
     res:=min(res,mid);
     r1:=mid-1;
    end
   else l:=mid+1;
  end;
 write(res);
end;
begin
 assign(input,'xedh.inp');reset(input);
 assign(output,'xedh.out');rewrite(output);
 nhap;
 xuli;
 close(input);close(output);
end.
