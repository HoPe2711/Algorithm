uses math;
const oo=high(int64) div 2;
var  n:longint;
     res:int64;
     h,l,r,prime:array[0..100001] of longint;
     suml,sumr:array[0..100001] of int64;
     free:array[0..100001] of boolean;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(h[i]);
   l[i]:=l[i-1]+h[i];
   suml[i]:=suml[i-1]+l[i-1];
  end;
 for i:=n downto 1 do
  begin
   r[i]:=r[i+1]+h[i];
   sumr[i]:=sumr[i+1]+r[i+1];
  end;
end;
function getl(v,u:longint):int64;
begin
 exit(suml[u]-suml[v-1]-int64(l[v-1])*(u-v+1));
end;
function getr(v,u:longint):int64;
begin
 exit(sumr[u]-sumr[v+1]-int64(r[v+1])*(v-u+1));
end;
procedure build;
var i,j:longint;
begin
 for i:=2 to trunc(sqrt(n+10)) do
  if prime[i]=0 then
   begin
    j:=i*i;
    while j<=n+10 do
     begin
      prime[j]:=1;
      j:=j+i;
     end;
   end;
  for i:=2 to n+10 do
   if prime[i]=0 then free[i]:=true;
end;
procedure xuli;
var p,i,j,mid:longint;
    cp:int64;
begin
 res:=oo;
 for i:=1 to n do res:=min(res,suml[i]+sumr[i]);
 for p:=2 to n do
 if free[p] then
  begin
   for i:=1 to n-p do
    begin
     j:=i+p;
     mid:=(i+j) div 2;
     cp:=getr(mid,i)+getl(mid+1,j);
     res:=min(res,cp+getl(1,i)+getr(n,j));
     if free[p+2]=true then
     begin
     if (i>2) then res:=min(res,cp+getr(n,j)+getl(1,i-2)+h[i-1]);
     if (j<=n-2) then res:=min(res,cp+getl(1,i)+getr(n,j+2)+h[j+1]);
     end;
     if (i>2) and (j<=n-2) then
     if (free[p+2]) and (free[p+4]) then res:=min(res,cp+getl(1,i-2)+getr(n,j+2)+h[i-1]+h[j+1]);
    end;
  end;
 write(Res);
end;
begin
 assign(input,'mountain.inp');reset(input);
 assign(output,'mountain.out');rewrite(output);
 nhap;
 build;
 xuli;
 close(input);close(output);
end.
