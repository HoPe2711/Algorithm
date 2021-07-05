type arr=array[0..4,0..4] of longint;
     arr1=array[0..16] of longint;
const q1:array[1..4] of longint=(1,-1,0,0);
      q2:array[1..4] of longint=(0,0,-1,1);
var n,i,f,r,kq,kq1,kq2,dem,res:longint;
    giaithua:array[0..16] of longint;
    a:array[0..4,0..4] of longint;
    queu:array[0..4000000] of arr;
    queu1:array[0..4000000] of arr1;
    tz,b:arr1;
    t,d,pzz,pzz1,pzz2,pzz3:array[0..4000000] of longint;
    trace,trace1,trace2,ok,pos:array[0..4000000] of longint;
    free:array[0..16] of boolean;
    d1,tr,tr1,tr2:array[0..16,0..16,0..16] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to n do
  for j:=1 to n do
   begin
    read(a[i,j]);
    if a[i,j]=n*n then
     begin
      kq:=i; kq1:=j;
     end;
   end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
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
function check(u:arr):longint;
var dem,sum,i,j,kk,ii:longint;
begin
 dem:=0; sum:=0;
 for i:=1 to n do
  for j:=1 to n do
   begin
    inc(dem);
    t[dem]:=u[i,j];
   end;
  ii:=n*n;
  for i:=1 to dem-1 do
   begin
    kk:=0;
    for j:=i+1 to dem do
     if t[i]>t[j] then inc(kk);
    sum:=sum+kk*giaithua[ii];
    dec(ii);
   end;
  exit(sum);
end;
procedure BFS(x:arr);
var u,u1:arr;
    asg,as,c,c1,tt,tt1,i,j:longint;
begin
 push(x);
 while f<=r do
  begin
   u:=pop; asg:=check(u);
   if asg=0 then break;
   for i:=1 to n do
    for j:=1 to n do
     if u[i,j]=n*n then
      begin
       tt:=i; tt1:=j;
      end;
   for i:=1 to 4 do
    begin
     c:=tt+q1[i]; c1:=tt1+q2[i];
     if (c<=n) and (c>=1) and (c1<=n) and (c1>=1) then
      begin
       u1:=u;
       doicho(u1[tt,tt1],u1[c,c1]);
       as:=check(u1);
       if d[as]=0 then
        begin
         d[as]:=d[asg]+1;
         push(u1);
         trace[as]:=tt;
         trace1[as]:=tt1;
         trace2[as]:=asg;
        end;
      end;
    end;
  end;
end;
procedure truyvet(x,y,z:longint);
begin
 if (x=kq) and (y=kq1) and (z=kq2) then exit;
 inc(dem);
 pzz[dem]:=x;
 pzz1[dem]:=y;
 pzz2[dem]:=trace[z];
 pzz3[dem]:=trace1[z];
 //writeln(x,' ',y,' ',trace[x,y,z],' ',trace1[x,y,z]);
 truyvet(trace[z],trace1[z],trace2[z]);
end;
procedure xuli;
var i:longint;
begin
 giaithua[1]:=1;
 for i:=2 to n*n do giaithua[i]:=giaithua[i-1]*i;
 kq2:=check(a);
 f:=1; r:=0;
 BFS(a);
 writeln(d[0]);
 if d[0]<>0 then truyvet(n,n,0);
 for i:=dem downto 1 do writeln(pzz[i],' ',pzz1[i],' ',pzz2[i],' ',pzz3[i]);
end;
procedure push1(x:arr1);
begin
 inc(r);
 queu1[r]:=x;
end;
function pop1:arr1;
begin
 pop1:=queu1[f];
 inc(f);
end;
procedure bfs(s:arr1;t,t1:longint);
var x,y,z:longint;
    u,u1:arr1;
begin
 push1(s);
 while f<=r do
  begin
   u:=pop1;
   for i:=1 to 16 do
   begin
    if u[i]=16 then z:=i;
    if u[i]=t then x:=i;
    if u[i]=t1 then y:=i;
   end;
   if  (x=ok[t]) and (y=ok[t1]) then
    begin
     free[x]:=true;
     free[y]:=true;
     tz:=u;
     res:=res+d1[x,y,z];
     break;
    end;

   u1:=u;
   if (z mod 4<>0)  and (free[z+1]=false) then
   begin
   if (z+1<>x) and (z+1<>y) and (d1[x,y,z+1]=0) then
    begin
     doicho(u1[z],u1[z+1]);
     d1[x,y,z+1]:=d1[x,y,z]+1;
     push1(u1);
     tr[x,y,z+1]:=x;
     tr1[x,y,z+1]:=y;
     tr2[x,y,z+1]:=z;
    end
   else if (z+1=x) and (d1[z,y,x]=0) then
    begin
     doicho(u1[z],u1[x]);
     d1[z,y,x]:=d1[x,y,z]+1;
     push1(u1);
     tr[z,y,x]:=x;
     tr1[z,y,x]:=y;
     tr2[z,y,x]:=z;
    end
   else
    if (d1[x,z,y]=0) then
     begin
      doicho(u1[z],u1[y]);
      d1[x,z,y]:=d1[x,y,z]+1;
      push1(u1);
      tr[x,z,y]:=x;
      tr1[x,z,y]:=y;
      tr2[x,z,y]:=z;
     end;
   end;

   u1:=u;
   if (z mod 4<>1) and (free[z-1]=false) then
   begin
   if (z-1<>x) and (z-1<>y) and (d1[x,y,z-1]=0) then
    begin
     doicho(u1[z],u1[z-1]);
     d1[x,y,z-1]:=d1[x,y,z]+1;
     push1(u1);
     tr[x,y,z-1]:=x;
     tr1[x,y,z-1]:=y;
     tr2[x,y,z-1]:=z;
    end
   else if (z-1=x) and (d1[z,y,x]=0) then
    begin
     doicho(u1[z],u1[x]);
     d1[z,y,x]:=d1[x,y,z]+1;
     push1(u1);
     tr[z,y,x]:=x;
     tr1[z,y,x]:=y;
     tr2[z,y,x]:=z;
    end
   else
    if (d1[x,z,y]=0) then
     begin
      doicho(u1[z],u1[y]);
      d1[x,z,y]:=d1[x,y,z]+1;
      push1(u1);
      tr[x,z,y]:=x;
      tr1[x,z,y]:=y;
      tr2[x,z,y]:=z;
     end;
   end;

   u1:=u;
   if (z >4) and (free[z-4]=false) then
   begin
   if (z-4<>x) and (z-4<>y) and (d1[x,y,z-4]=0) then
    begin
     doicho(u1[z],u1[z-4]);
     d1[x,y,z-4]:=d1[x,y,z]+1;
     push1(u1);
     tr[x,y,z-4]:=x;
     tr1[x,y,z-4]:=y;
     tr2[x,y,z-4]:=z;
    end
   else if (z-4=x) and (d1[z,y,x]=0) then
    begin
     doicho(u1[z],u1[x]);
     d1[z,y,x]:=d1[x,y,z]+1;
     push1(u1);
     tr[z,y,x]:=x;
     tr1[z,y,x]:=y;
     tr2[z,y,x]:=z;
    end
   else
    if (d1[x,z,y]=0) then
     begin
      doicho(u1[z],u1[y]);
      d1[x,z,y]:=d1[x,y,z]+1;
      push1(u1);
      tr[x,z,y]:=x;
      tr1[x,z,y]:=y;
      tr2[x,z,y]:=z;
     end;
   end;

   u1:=u;
   if (z <13) and (free[z+4]=false) then
   begin
   if (z+4<>x) and (z+4<>y) and (d1[x,y,z+4]=0) then
    begin
     doicho(u1[z],u1[z+4]);
     d1[x,y,z+4]:=d1[x,y,z]+1;
     push1(u1);
     tr[x,y,z+4]:=x;
     tr1[x,y,z+4]:=y;
     tr2[x,y,z+4]:=z;
    end
   else if (z+4=x) and (d1[z,y,x]=0) then
    begin
     doicho(u1[z],u1[x]);
     d1[z,y,x]:=d1[x,y,z]+1;
     push1(u1);
     tr[z,y,x]:=x;
     tr1[z,y,x]:=y;
     tr2[z,y,x]:=z;
    end
   else
    if (d1[x,z,y]=0) then
     begin
      doicho(u1[z],u1[y]);
      d1[x,z,y]:=d1[x,y,z]+1;
      push1(u1);
      tr[x,z,y]:=x;
      tr1[x,z,y]:=y;
      tr2[x,z,y]:=z;
     end;
    end;
  end;
end;
procedure truyvet1(x,y,z,kq,kq1:longint);
begin
 if (x=kq) and (y=kq1) then exit;
 writeln(z,' ',tr2[x,y,z]);
 truyvet1(tr[x,y,z],tr1[x,y,z],tr2[x,y,z],kq,kq1);
end;
procedure xuli2;
var i,j,dem,z:longint;
begin
 dem:=0;
 for i:=1 to n do
  for j:=1 to n do
   begin
    inc(dem);
    tz[dem]:=a[i,j];
    pos[tz[dem]]:=dem;
   end;
  for i:=1 to n*n do
   begin
    ok[i]:=i;
   end;
  f:=1; r:=0;
  fillchar(d1,sizeof(d1),0);
  fillchar(tr,sizeof(tr),0);
  fillchar(tr1,sizeof(tr1),0);
  fillchar(tr2,sizeof(tr2),0);
  bfs(tz,1,2);
  for i:=1 to 16 do if tz[i]=16 then z:=i;
  truyvet1(1,2,z,pos[1],pos[2]);
  f:=1; r:=0;
  fillchar(d1,sizeof(d1),0);
  fillchar(tr,sizeof(tr),0);
  fillchar(tr1,sizeof(tr1),0);
  fillchar(tr2,sizeof(tr2),0);
  bfs(tz,3,4);
  for i:=1 to 16 do if tz[i]=16 then z:=i;
 // truyvet1(3,4,z,pos[3],pos[4]);
  f:=1; r:=0;
  fillchar(d1,sizeof(d1),0);
  fillchar(tr,sizeof(tr),0);
  fillchar(tr1,sizeof(tr1),0);
  fillchar(tr2,sizeof(tr2),0);
  bfs(tz,5,6);
  for i:=1 to 16 do if tz[i]=16 then z:=i;
 // truyvet1(5,6,z,pos[5],pos[6]);
  f:=1; r:=0;
  fillchar(d1,sizeof(d1),0);
  fillchar(tr,sizeof(tr),0);
  fillchar(tr1,sizeof(tr1),0);
  fillchar(tr2,sizeof(tr2),0);
  bfs(tz,7,8);
  for i:=1 to 16 do if tz[i]=16 then z:=i;
  //truyvet1(7,8,z,pos[7],pos[8]);
  f:=1; r:=0;
  fillchar(d1,sizeof(d1),0);
  fillchar(tr,sizeof(tr),0);
  fillchar(tr1,sizeof(tr1),0);
  fillchar(tr2,sizeof(tr2),0);
  bfs(tz,9,13);
  for i:=1 to 16 do if tz[i]=16 then z:=i;
  //truyvet1(9,13,z,pos[9],pos[13]);
  f:=1; r:=0;
  fillchar(d1,sizeof(d1),0);
  fillchar(tr,sizeof(tr),0);
  fillchar(tr1,sizeof(tr1),0);
  fillchar(tr2,sizeof(tr2),0);
  bfs(tz,10,14);
  //for i:=1 to 16 do if tz[i]=16 then z:=i;
  //truyvet1(10,14,z,pos[10],pos[14]);
  f:=1; r:=0;
  fillchar(d1,sizeof(d1),0);
  fillchar(tr,sizeof(tr),0);
  fillchar(tr1,sizeof(tr1),0);
  fillchar(tr2,sizeof(tr2),0);
  bfs(tz,11,15);
  //for i:=1 to 16 do if tz[i]=16 then z:=i;
  //truyvet1(11,15,z,pos[11],pos[15]);
  if tz[12]=16 then
   begin
    inc(res);
    doicho(tz[12],tz[16]);
   end;
  write(res);
end;
begin
 assign(input,'pzz.inp');reset(input);
 assign(output,'pzz.out');rewrite(output);
 nhap;
 if n<=3 then xuli
 else xuli2;
 close(input);close(output);
end.
