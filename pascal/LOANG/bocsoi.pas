uses math;
var  a,b,c,f,r,x,y,sum,res:longint;
     queu,queu1:array[0..1000000] of longint;
     free:array[0..5000,0..5000] of boolean;
     d:array[0..5000,0..5000] of longint;
procedure nhap;
begin
 res:=maxlongint;
 read(a,b,c);
 sum:=a+b+c;
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
procedure BFS(s,s1:longint);
var z:longint;
begin
 push(s,s1);
 while f<=r do
    begin
     pop;
     z:=sum-x-y;
     free[x,y]:=false;
     if (x>=y) and (free[x-y,2*y]) then
      begin
       free[x-y,2*y]:=false;
       d[x-y,2*y]:=d[x,y]+1;
       push(x-y,2*y);
      end;
     if (x>=z) and (free[x-z,y]) then
      begin
       free[x-z,y]:=false;
       d[x-z,y]:=d[x,y]+1;
       push(x-z,y);
      end;
     if (y>=x) and (free[x*2,y-x]) then
      begin
       free[x*2,y-x]:=false;
       d[x*2,y-x]:=d[x,y]+1;
       push(x*2,y-x);
      end;
     if (y>=z) and (free[x,y-z]) then
      begin
       free[x,y-z]:=false;
       d[x,y-z]:=d[x,y]+1;
       push(x,y-z);
      end;
     if (z>=x) and (free[x*2,y]) then
      begin
       free[x*2,y]:=false;
       d[x*2,y]:=d[x,y]+1;
       push(x*2,y);
      end;
     if (z>=y) and (free[x,2*y]) then
      begin
       free[x,2*y]:=false;
       d[x,2*y]:=d[x,y]+1;
       push(x,2*y);
      end;
    end;
end;
procedure xuli;
begin
 f:=1;
 fillchar(free,sizeof(free),true);
 BFS(a,b);
 if d[0,0]<>0 then res:=d[0,0];
 if d[0,sum]<>0 then res:=min(res,d[0,sum]);
 if d[sum,0]<>0 then res:=min(res,d[sum,0]);
 if res=maxlongint then write(-1)
 else write(res);
end;
begin
 assign(input,'bocsoi.inp');reset(input);
 assign(output,'bocsoi.out');rewrite(output);
 nhap;
 xuli;
 close(input);
 close(output);
end.
