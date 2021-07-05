var ke,next,head,ts,d:array[-100001..100001] of longint;
    dd:array[0..301,0..301] of longint;
    free:array[0..100001] of boolean;
    n,res:longint;
procedure add(i,u,v,c:longint);
begin
 ke[i]:=v;
 next[i]:=head[u];
 head[u]:=i;
 ts[i]:=c;
 ke[-i]:=u;
 next[-i]:=head[v];
 head[v]:=-i;
 ts[-i]:=c;
end;
procedure nhap;
var i,k,j,u:longint;
begin
 k:=0;
 read(n);
 for i:=1 to n do
 begin
  read(u);
  inc(k);
  add(k,i,n+1,u);
 end;
 for i:=1 to n do
  for j:=1 to n do
  begin
   read(u);
   if (i<>j) and (dd[j,i]=0) then
    begin
     inc(k);
     add(k,i,j,u);
     dd[i,j]:=1;
    end;
   end;
end;
procedure khoitao;
var i:longint;
begin
 d[1]:=0;
 for i:=2 to n+1 do d[i]:=1000000;
end;
function findmin:longint;
var kq,i:longint;
begin
 kq:=maxlongint;
 for i:=1 to n+1 do
  if (kq>d[i]) and (free[i]) then
   begin
    kq:=d[i];
    findmin:=i;
   end;
end;
procedure xuli;
var i,j,u,v:longint;
begin
 fillchar(free,sizeof(free),true);
 for i:=1 to n+1 do
  begin
   u:=findmin;
   free[u]:=false;
   res:=res+d[u];
   j:=head[u];
   while j<>0 do
    begin
     v:=ke[j];
     if (d[v]>ts[j]) and free[v] then d[v]:=ts[j];
     j:=next[j];
    end;
  end;
 write(res);
end;
BEGIN
//  assign(input,'fwater.inp');reset(input);
//  assign(output,'fwater.out');rewrite(output);
  nhap;
  khoitao;
  xuli;
//  close(input);close(output);
END.

