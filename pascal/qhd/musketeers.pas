{$H+}
uses math;
var dd,free:Array[0..20000] of longint;
    f,dem:Array[0..20000] of int64;
    st:array[0..20000] of string;
    t,h,n:longint;
    res:int64;
procedure build;
var  i:longint;
begin
 for i:=3 to 10000 do f[i]:=int64(i)*(i-1)*(i-2) div 6;
end;
function get(x:longint):char;
begin
 if x=1 then exit('a');
 if x=2 then exit('e');
 if x=3 then exit('i');
 if x=4 then exit('o');
 if x=5 then exit('u');
end;
function getbit(i,x:longint):longint;
begin
 exit(1 and (x shr i));
end;
procedure cal(x:longint);
var dem1,pp,ok,i,j:longint;
begin
 dem1:=0;
 pp:=0;
 for j:=1 to 5 do pp:=pp+getbit(j-1,x);
 for i:=1 to n do
 begin
  ok:=0;
  for j:=1 to 5 do
   if (getbit(j-1,x)=1) and (Getbit(j-1,dd[i])=0) then ok:=1;
  if ok=0 then inc(Dem1);
 end;
 dem[pp]:=dem[pp]+f[dem1];
end;
procedure nhap;
var k,j,i:longint;
begin
 readln(N);
 for i:=1 to 5 do dem[i]:=0;
 for i:=1 to n do
  begin
   readln(St[i]);
   dd[i]:=0;
   for k:=1 to 5 do free[k]:=0;
   for j:=1 to length(St[i]) do
    for k:=1 to 5 do
     if st[i][j]=get(k) then free[k]:=1;
   for k:=1 to 5 do
    if free[k]=1 then dd[i]:=dd[i]+2**(k-1);
  end;
 for i:=1 to 31 do cal(i);
 dem[4]:=dem[4]-int64(5)*dem[5];
 dem[3]:=dem[3]-int64(4)*dem[4]-int64(10)*dem[5];
 dem[2]:=dem[2]-int64(3)*dem[3]-int64(6)*dem[4]-int64(10)*dem[5];
 dem[1]:=dem[1]-int64(2)*dem[2]-int64(3)*dem[3]-int64(4)*dem[4]-int64(5)*dem[5];
 res:=dem[5]+dem[4]+dem[3]+dem[2]+dem[1];
 writeln(res);
end;
begin
 assign(input,'musketeers.inp');reset(input);
 assign(output,'musketeers.out');rewrite(output);;
 build;
 readln(t);
 for h:=1 to t do nhap;
 close(input); close(output);
end.
