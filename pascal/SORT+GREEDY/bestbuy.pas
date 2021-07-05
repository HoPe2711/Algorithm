uses math;
var res,c,c1,n,m:longint;
    u,kk,pos,a,t,v:array[0..500000] of longint;
    free:array[0..500000] of boolean;
procedure nhap;
var i:longint;
begin
 read(c,c1);
 read(n);
 for i:=1 to n do read(a[i],t[i]);
 read(m);
 for i:=1 to n do
  begin
   kk[m+m+i]:=a[i];
   u[m+m+i]:=t[i];
   pos[m+m+i]:=m+m+i;
  end;
 for i:=1 to m do
  begin
   read(u[i],v[i]);
   u[i+m]:=v[i];
   pos[i]:=i;
   pos[i+m]:=i+m;
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid,mid1,key:longint;
begin
 i:=l;
 j:=r;
 mid1:=l+random(r-l+1);
 mid:=u[mid1];
 key:=pos[mid1];
 repeat
  while (u[i]<mid) or ((u[i]=mid) and (pos[i]>key)) do  inc(i);
  while (u[j]>mid) or ((u[j]=mid) and (pos[j]<key)) do dec(j);
  if i<=j then
   begin
    doicho(u[i],u[j]);
    doicho(kk[i],kk[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var money:int64;
    i,tien:longint;
begin
 money:=0;
 qsort(1,2*m+n);
 for i:=1 to 2*m+n do
 if pos[i]>m*2 then money:=money+kk[i]
 else
 //if free[pos[i]]=false then
 begin
 if pos[i]>m then
  begin
   tien:=c1 ;
   if free[pos[i]-m]=true then continue;
   free[pos[i]-m]:=true;
  end
 else
  begin
   tien:=c;
   if free[pos[i]+m]=true then continue;
   free[pos[i]+m]:=true;
  end;
 if (money>=tien) then
  begin
   money:=money-tien;
   inc(Res);
   free[pos[i]]:=true;
  end;
 end;
 write(res);
end;
begin
 assign(input,'bestbuy.inp');reset(input);
 assign(output,'bestbuy.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.