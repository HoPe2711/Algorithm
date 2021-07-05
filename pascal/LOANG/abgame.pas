{$H+}
uses math;
var f,r,k,h,n,x,y:longint;
    kq,tt:int64;
    st:string;
    a,queu,queu1:array[0..4200000] of longint;
    d:Array[0..21,0..2100000] of longint;
    trace,trace1:array[0..21,0..2100000] of longint;
function batbit(x,i:longint):longint;
begin
 exit(x or (1 shl i));
end;
function getbit(x,i:longint):longint;
begin
 exit(1 and (x shr i));
end;
function tatbit(x,i:longint):longint;
begin
 exit(x xor (1 shl i));
end;
procedure nhap;
var i:longint;
begin
 tt:=0;
 kq:=0;
 readln(st);
 n:=length(st);
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
procedure BFS(i,j:longint);
var q1,q2,q3,q4,v,u:longint;
begin
 push(i,j);
 while f<=r do
  begin
   pop;
   q1:=getbit(y,x-1);
   if q1=0 then
   if (x>0) and (d[x-1,y]=0) then
    begin
     d[x-1,y]:=d[x,y]+1;
     push(x-1,y);
     trace[x-1,y]:=x;
     trace1[x-1,y]:=y;
    end;
   if q1=1 then
    begin
     v:=tatbit(y,x-1);
     u:=batbit(v,x);
     if (x>0) and (d[x-1,u]=0) then
      begin
       d[x-1,u]:=d[x,y]+1;
       push(x-1,u);
       trace[x-1,u]:=x;
       trace1[x-1,u]:=y;
      end;
    end;
   q2:=getbit(y,x-2);
   if q2=0 then
   if (x>1) and (d[x-2,y]=0) then
    begin
     d[x-2,y]:=d[x,y]+1;
     push(x-2,y);
     trace[x-2,y]:=x;
     trace1[x-2,y]:=y;
    end;
   if q2=1 then
    begin
     v:=tatbit(y,x-2);
     u:=batbit(v,x);
     if (x>1) and (d[x-2,u]=0) then
      begin
       d[x-2,u]:=d[x,y]+1;
       push(x-2,u);
       trace[x-2,u]:=x;
       trace1[x-2,u]:=y;
      end;
    end;
   q3:=getbit(y,x+1);
   if q3=0 then
   if (x<n-1) and (d[x+1,y]=0) then
    begin
     d[x+1,y]:=d[x,y]+1;
     push(x+1,y);
     trace[x+1,y]:=x;
     trace1[x+1,y]:=y;
    end;
   if q3=1 then
    begin
     v:=tatbit(y,x+1);
     u:=batbit(v,x);
     if (x<n-1) and (d[x+1,u]=0) then
      begin
       d[x+1,u]:=d[x,y]+1;
       push(x+1,u);
       trace[x+1,u]:=x;
       trace1[x+1,u]:=y;
      end;
    end;
   q4:=getbit(y,x+2);
   if q4=0 then
   if (x<n-2) and (d[x+2,y]=0) then
    begin
     d[x+2,y]:=d[x,y]+1;
     push(x+2,y);
     trace[x+2,y]:=x;
     trace1[x+2,y]:=y;
    end;
   if q4=1 then
    begin
     v:=tatbit(y,x+2);
     u:=batbit(v,x);
     if (x<n-2) and (d[x+2,u]=0) then
      begin
       d[x+2,u]:=d[x,y]+1;
       push(x+2,u);
       trace[x+2,u]:=x;
       trace1[x+2,u]:=y;
      end;
    end;
  end;
end;
procedure truyvet(mid,tt1:longint);
begin
 if (tt1=tt) and (mid=n div 2) then exit;
 truyvet(trace[mid,tt1],trace1[mid,tt1]);
 write(mid+1,' ');
end;
procedure xuli;
var i:longint;
begin
 for i:=1 to n do
  if st[i]='A' then a[i]:=1
  else if st[i]='B' then a[i]:=0
  else a[i]:=0;
 for i:=1 to n do
   if a[i]=1 then tt:=batbit(tt,i-1);
 for i:=1 to n div 2 do kq:=batbit(kq,i-1);
 fillchar(d,sizeof(d),0);
 f:=1; r:=0;
 BFS(n div 2,tt);
 write(d[n div 2,kq],' ');
 truyvet(n div 2,kq);
 writeln;
end;
procedure xuli2;
var qe,qe2,res,tt,i,w:longint;
begin
 qe:=n div 2;
 res:=qe*n+qe*(qe-1);
 write(res,' ');
 qe2:=qe+2;
 tt:=3;
 for w:=1 to n div 2 do
 begin
  i:=0;
  while (qe>=w) or (qe2>=w+1) do
  begin
   inc(i);
   if i mod 2=1 then
    begin
     write(qe2,' ');
     dec(qe2);
    end
   else
    begin
     write(qe,' ');
     dec(qe);
    end;
   end;
   if tt<= n div 2+1 then for i:=tt to tt+n div 2-1 do write(i,' ');
   inc(tt);
   qe:=qe+n div 2+1;
   qe2:=qe2+n div 2+2;
 end;
 writeln;
end;
BEGIN
  assign(input,'abgame.inp');reset(input);
  assign(output,'abgame.out');rewrite(output);
  readln(k);
  for h:=1 to k do
   begin
    nhap;
    if n <=21 then xuli
    else xuli2;
   end;
  close(input);close(output);
END.

