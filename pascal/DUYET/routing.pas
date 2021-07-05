{$H+}
const oo=1000000000;
var n,r,dem,kq:longint;
    a:array[0..100,0..100] of longint;
    aa,x:array[0..10000] of longint;
    free:array[0..100] of boolean;
procedure nhap;
var i,j:longint;
begin
 read(n,r);
 for i:=1 to n do
  for j:=1 to n do read(a[i,j]);
 readln;
end;
procedure change(s:string);
var i,j:longint;
begin
 dem:=1;
 fillchar(aa,sizeof(aa),0);
 for i:=1 to length(S) do
  begin
   if s[i]<>' ' then
    begin
   //  inc(dem);
     aa[dem]:=aa[dem]+(ord(s[i])-48);
     aa[dem]:=aa[dem]*10;
    end
   else
    begin
     aa[dem]:=aa[dem] div 10;
     inc(dem);
    end;
  end;
 if s[length(s)]<>' ' then aa[dem]:=aa[dem] div 10;
 j:=length(s);
 while s[j]=' ' do
  begin
   dec(j);
   dec(dem);
  end;
end;
procedure duyet(i,sum:longint);
var j:longint;
begin
 if sum>=kq then exit;
 if i=dem+1 then
  begin
   if sum<kq then kq:=sum;
   exit;
  end;
 if i<dem then
  begin
   for j:=2 to dem-1 do
   if (free[j]=false) then
   if (a[aa[x[i-1]],aa[j]]<>0)  then
    begin
     free[j]:=true;
     x[i]:=j;
     duyet(i+1,sum+a[aa[x[i-1]],aa[j]]);
     free[j]:=false;
    end;
  end
 else if i=dem then
  begin
   x[dem]:=dem;
   if a[aa[x[i-1]],aa[dem]]<>0 then duyet(i+1,sum+a[aa[x[i-1]],aa[dem]]);
  end;
end;
procedure xuli;
var i:longint;
    st:string;
begin
 for i:=1 to r do
  begin
   readln(st);
   change(st);
   kq:=oo;
   x[1]:=1;
   duyet(2,0);
   if kq=oo then kq:=0;
   writeln(kq);
  end;
end;
begin
 assign(input,'routing.inp');reset(input);
 assign(output,'routing.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
