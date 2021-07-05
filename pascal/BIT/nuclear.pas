uses math;
var n,q,limit,dem:longint;
    a,b:array[1..2] of longint;
    x,y,r1,r2,hh:array[0..200000] of longint;
    t2,free,free1,f,f1:array[0..300000] of longint;
    th,colour,pos,th1:array[0..400000] of longint;
    //th1:array[0..400000] of real;
function dis(x,y,x1,y1:longint):real;
begin
 exit(sqrt(sqr(int64(x)-x1)+sqr(int64(y)-y1)));
end;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(x[i],y[i]);
 read(a[1],b[1],a[2],b[2],q);
end;
procedure update2(i,x:longint);
begin
 while i<=limit do
  begin
    t2[i]:=t2[i]+x;
    i:=i+(i and (-i));
  end;
end;
function get2(i:longint):longint;
begin
 get2:=0;
 while i>0 do
  begin
   get2:=get2+t2[i];
   i:=i-(i and (-i));
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
var i,j,mid,key1,key2,key:longint;
begin
 i:=l;
 j:=r;
 mid:=l+random(r-l+1);
 key:=th1[mid]; key1:=th[mid]; key2:=colour[mid];
 repeat
  while (th1[i]<key) or ((th[i]<key1) and (th1[i]=key)) or ((th[i]=key1) and (th1[i]=key) and (colour[i]<key2)) do inc(i);
  while (th1[j]>key) or ((th[j]>key1) and (th1[j]=key)) or ((th[j]=key1) and (th1[j]=key) and (colour[j]>key2)) do dec(j);
  if i<=j then
   begin
    doicho(th[i],th[j]);
    doicho(th1[i],th1[j]);
    doicho(colour[i],colour[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j ;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure xuli;
var i,res:longint;
    k,k1:real;
begin
 limit:=300000;
 for i:=1 to n do
  begin
   k:=dis(x[i],y[i],a[1],b[1]);
   if k<>trunc(k) then inc(free[trunc(k)+1])
   else inc(free[trunc(k)]);
   k1:=dis(x[i],y[i],a[2],b[2]);
   if k1<>trunc(k1) then  inc(free1[trunc(k1)+1])
   else inc(free1[trunc(k1)]);
   inc(dem);
   if trunc(k)<>k then th[dem]:=trunc(k)+1 else th[dem]:=trunc(k);
   if trunc(k1)<>k1 then th1[dem]:=trunc(k1)+1 else th1[dem]:=trunc(k1);
   //th1[dem]:=k1;
   colour[dem]:=0;    pos[dem]:=0;
  end;
 for i:=1 to 300000 do
  begin
   f[i]:=f[i-1]+free[i];
   f1[i]:=f1[i-1]+free1[i];
  end;
 for i:=1 to q do
  begin
   read(r1[i],r2[i]);
   inc(dem);
   th[dem]:=r1[i]; th1[dem]:=r2[i];  colour[dem]:=1; pos[dem]:=i;
  end;
 qsort(1,dem);


 for i:=1 to dem do
 if colour[i]=0 then  update2(th[i],1)
 else hh[pos[i]]:=get2(th[i]);
 for i:=1 to q do
  begin
   res:=f[r1[i]]+f1[r2[i]]-hh[i];
   writeln(res);
  end;
end;
begin
 //assign(input,'nuclear.inp');reset(input);
 //assign(output,'nuclear.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output)
end.
