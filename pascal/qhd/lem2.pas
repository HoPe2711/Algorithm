uses math;
const oo=maxlongint;
var  n,k,res,f,r,dot:longint;
     b,queu,d:array[0..1200000] of longint;
     a:array[0..21,0..21] of longint;
procedure nhap;
var  i,j,x1:longint;
begin
 read(n,k);
 for i :=1 to n do
  begin
   read(b[i]);
   for j:=1 to b[i] do read(a[i,j]);
  end;
 for i:=1 to n do
  begin
   read(x1);
   if x1=1 then dot:=dot+2**(i-1);
  end;
end;
function batbit(i,x:longint):longint;
begin
 exit(x or (1 shl i));
end;
function tatbit(i,x:longint):longint;
begin
 exit(x and (not(1 shl i)));
end;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
procedure BFS;
var i,j,u,tt:longint;
begin
 for i:=1 to 2**n-1 do d[i]:=oo;
 d[dot]:=0;
 f:=1; r:=0;
 push(dot);
 while f<=r do
  begin
   u:=pop;
   for i:=1 to n do
    begin
     tt:=batbit(i-1,u);
     for j:=1 to b[i] do tt:=tatbit(a[i,j]-1,tt);
     if d[tt]>d[u]+1 then
      begin
       d[tt]:=d[u]+1;
       push(tt);
      end;
    end;
  end;
end;
procedure xuli;
begin
 BFS;
 res:=d[2**(k-1)];
 if res=oo then write(-1)
 else write(res);
end;
begin
 assign(input,'lem2.inp');reset(input);
 assign(output,'lem2.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.