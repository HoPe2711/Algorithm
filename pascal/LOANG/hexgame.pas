uses math;
type arr=array[0..10] of longint;
var n,dem,f,r:longint;
    a:array[0..4,0..4] of longint;
    x,gt,u1,u,kp:array[0..10] of longint;
    queu:array[-2000000..3700000] of arr;
    free:array[0..50000000] of boolean;
    d:array[0..50000000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
 begin
  for j:=1 to i do
   begin
    read(a[i,j]);
    inc(dem);
    x[dem]:=a[i,j];
   end;
 end;
 gt[0]:=1;           kp[1]:=1; kp[2]:=2; kp[3]:=4; kp[4]:=7;
 for i:=1 to dem do gt[i]:=gt[i-1]*i;
end;
function check(u:arr):longint;
var sum,i,j,tungduong,kk:longint;
begin
 sum:=0;
 tungduong:=dem;
 for i:=1 to dem-1 do
 begin
  kk:=0;
  for j:=i+1 to dem do
  if u[i]>u[j] then inc(kk);
  sum:=sum+gt[tungduong]*kk;
  dec(tungduong);
 end;
 exit(sum);
end;
procedure push(x:arr);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:arr;
begin
 pop:=queu[f];
 inc(f);
end;
procedure back(x:arr);
begin
 dec(f);
 queu[f]:=x;
end;
procedure xoay(i,j,k:longint);
var tg:longint;
begin
 tg:=u1[i];
 u1[i]:=u1[k];
 u1[k]:=u1[j];
 u1[j]:=tg;
end;
procedure BFS(s:arr);
var
    as,asg,i,j,tp:longint;
begin
 f:=1;
 r:=0;
 push(s);
 while f<=r do
  begin
   u:=pop;
   asg:=check(u);
   if asg=0 then break;
   for i:=1 to dem-n do
    begin
     u1:=u;
     if i=1 then xoay(i,i+2,i+1)
     else if i=2 then xoay(i,i+3,i+2)
     else xoay(i,i+4,i+3);
     as:=check(u1);
     if free[as]=false then
      begin
       d[as]:=d[asg]+1;
       free[as]:=true;
       push(u1);
      end;
    end;

   for i:=1 to dem-n do
    begin
     u1:=u;
     if dem=5 then xoay(i,i-3,i-2);
     if dem=8 then xoay(i,i-4,i-3);
     if dem=9 then xoay(i,i-4,i-3);
     as:=check(u1);
     if free[as]=false then
      begin
       d[as]:=d[asg]+1;
       free[as]:=true;
       push(u1);
      end;
    end;
   for i:=2 to n do
    begin
     u1:=u;
     tp:=kp[i];
     for j:=tp to tp+i-2 do u1[j+1]:=u[j];
     u1[tp]:=u[tp+i-1];  as:=check(u1);
     if free[as]=false then
      begin
       d[as]:=d[asg];
       free[as]:=true;
       back(u1);
      end;
    end;
  end;
end;
procedure xuli;
begin
 BFS(x);
 write(d[0]);
end;
begin
 assign(input,'hexgame.inp');reset(input);
 assign(output,'hexgame.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
