uses math;
var res,n,top,t,h:longint;  a,b,c:int64;
    free,stack,tt,last:array[0..17000000] of longint;
procedure push(x:longint);
begin
 inc(top);
 stack[top]:=x;
end;
function pop:longint;
begin
 pop:=stack[top];
 dec(top);
end;
procedure nhap;
var  dem,i,u,j,kq:longint;
     v:int64;
     stop,ok:boolean;
begin
 read(a,b,c,n);
 fillchar(tt,sizeof(tt),0);
 fillchar(free,sizeof(free),0);
 res:=0;
 for i:=0 to n-1 do
  begin
   dem:=0; top:=0; stop:=false; ok:=false; kq:=0;
   v:=i;
   while stop=false  do
    begin
     if free[v]=0 then
      begin
       free[v]:=1;
       inc(dem);
       push(v);
       v:=((int64(a)*((v mod n)*(v mod n) mod n)) mod n+(b*v) mod n+c) mod n;
      end
     else stop:=true;
    end;
   dem:=0;
   if free[v]=1 then
    begin
     repeat
      u:=pop;
      inc(dem);
      free[u]:=2;
      last[dem]:=u;
     until u=v;
     for j:=1 to dem do tt[last[j]]:=dem;
    end;
   dem:=tt[v];
   while top>0 do
    begin
     u:=pop;
     inc(dem);
     free[u]:=2;
     tt[u]:=dem;
    end;
   res:=max(res,dem);
  end;

 writeln(Res);
end;
begin
 assign(input,'gems.inp');reset(input);
 assign(output,'gems.out');rewrite(output);
 read(t);
 for h:=1 to t do nhap;
 close(input);
 close(output);
end.
