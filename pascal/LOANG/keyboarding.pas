{$H+}
uses math;
const oo=maxlongint;
var r,c,res,ff,rr,ff1,rr1,x,y,z,n,tmp:longint;
    s:string;
    st:array[0..20000] of string;
    queu,queu1:array[-500000..500000] of longint;
    q,q1:array[0..100,0..100,0..4] of longint;
    d:Array[0..100,0..100] of longint;
procedure nhap;
var i,j:longint;
begin
 readln(R,c);
 for i:=1 to r do readln(St[i]);
 readln(s);
 for i:=1 to r do
 begin
  for j:=1 to c do
  begin
   q[i,j,1]:=i;
   if (j=1) or (st[i,j]<>St[i,j-1])  then q1[i,j,1]:=j-1
   else q1[i,j,1]:=q1[i,j-1,1];
  end;
  for j:=c downto 1 do
  begin
   q[i,j,2]:=i;
   if (j=c) or (st[i,j]<>St[i,j+1]) then q1[i,j,2]:=j+1
   else q1[i,j,2]:=q1[i,j+1,2];
  end;
 end;

 for i:=1 to c do
 begin
  for j:=1 to r do
  begin
   q1[j,i,3]:=i;
   if (j=1) or (st[j,i]<>St[j-1,i]) then q[j,i,3]:=j-1
   else q[j,i,3]:=q[j-1,i,3];
  end;
  for j:=r downto 1 do
  begin
   q1[j,i,4]:=i;
   if (j=r) or (st[j,i]<>St[j+1,i]) then q[j,i,4]:=j+1
   else q[j,i,4]:=q[j+1,i,4];
  end;
 end;
end;
procedure push(x,y:longint);
begin
 inc(rr);
 queu[rr]:=x;
 queu1[rr]:=y;
end;
procedure pop;
begin
 x:=queu[ff];
 y:=queu1[ff];
 inc(ff);
end;
procedure BFS(k:longint);
var i,j,u,v:longint;
begin
 if k=1 then
  begin
   for i:=1 to r do
    for j:=1 to c do d[i,j]:=oo;
   d[1,1]:=0; ff:=1; rr:=0;
   push(1,1);
  end
 else
  begin
   ff:=1; rr:=0;
   for i:=1 to r do
    for j:=1 to c do
    if st[i,j]<>s[k-1] then d[i,j]:=oo
   else
    begin
     if (d[i,j]<>oo) then push(i,j);
    end;
  end;
 while ff<=rr do
  begin
   pop;
   for i:=1 to 4 do
    begin
     u:=q[x,y,i];
     v:=q1[x,y,i];
     if (u>=1) and (v>=1) and (u<=r) and (v<=c) then
        if d[u,v]>d[x,y]+1 then
         begin
          d[u,v]:=d[x,y]+1;
          push(u,v);
         end;
    end;
  end;
end;
procedure xuli;
var i,j:longint;
begin
 s:=s+'*';
 n:=length(S);
 for i:=1 to n do
  begin
   BFS(i);
  end;
 res:=maxlongint;
 for i:=1 to r do
  for j:=1 to c do
   if st[i,j]=s[n] then res:=min(res,d[i,j]);
 write(Res+n);
end;
begin
 assign(input,'keyboarding.inp');reset(input);
 assign(output,'keyboarding.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.