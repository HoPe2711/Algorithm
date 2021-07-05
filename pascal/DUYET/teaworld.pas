uses math;
var m,n,k1,u,v,t,res,hailong:longint;
    x,y,z,r,a,b,c,w,xx:Array[0..5000] of longint;
    free:Array[0..20,0..3000] of longint;
procedure nhap;
var  i:longint;
begin
 read(m,n,k1);
 for i:=1 to m do read(x[i],y[i],z[i],r[i]);
 for i:=1 to n do read(a[i],b[i],c[i],w[i]);
 read(u,v,t);
end;

function tinh(x,y,z,a,b,c:longint):real;
var tg:real;
begin
 tg:=sqrt(sqr(x-a)+sqr(y-b)+sqr(z-c));
 exit(tg);
end;

function tamgiac(i,j:longint):real;
var x1,x2,y1,y2,z1,z2,px,py,pz:longint;
begin
 x1:=u-x[j]; y1:=v-y[j]; z1:=t-z[j];
 x2:=a[i]-x[j]; y2:=b[i]-y[j]; z2:=c[i]-z[j];
 px:=y1*z2-z1*y2;
 py:=z1*x2-x1*z2;
 pz:=x1*y2-y1*x2;
 tamgiac:=tinh(px,py,pz,0,0,0);
end;

procedure duyet(i:longint);
var j,tungduong,k,tmp,tmp1,ok:longint;   tg,tg1,s,p,p1:real;
begin
 if hailong>k1 then exit;
 if i=n+1 then
  begin
   tungduong:=0;
   for j:=1 to n do
    if xx[j]=1 then tungduong:=tungduong+w[j];
   res:=max(Res,tungduong);
  end
 else
 for j:=0 to 1 do
  begin
   xx[i]:=j;   hailong:=0;
   if xx[i]=1 then
   begin
    for k:=1 to m do
    begin
    if free[i-1,k]<>1 then
     begin
      p:=tinh(u,v,t,x[k],y[k],z[k]);
      if p>r[k] then tmp:=1 else tmp:=0;
      p1:=tinh(a[i],b[i],c[i],x[k],y[k],z[k]);
      if p1>r[k] then tmp1:=1 else tmp1:=0;
      if (tmp=1-tmp1) then free[i,k]:=1;
      if (tmp=1) and (tmp1=1) then
       begin
        tg:=tinh(u,v,t,a[i],b[i],c[i]);
        s:=tamgiac(i,k);
        if tg<>0 then
         begin
          if (r[k]*tg<s) then free[i,k]:=0
          else
           begin
            ok:=0;
            tg1:=(sqr(p)+sqr(tg)-sqr(p1));
            if tg1<=0 then ok:=1;
            tg1:=(sqr(tg)+sqr(p1)-sqr(p));
            if tg1<=0 then ok:=1;
            if ok=0 then free[i,k]:=1;
           end;
         end
        else free[i,k]:=0;
       end;
     end
    else free[i,k]:=free[i-1,k];
    hailong:=hailong+free[i,k];
    end
   end
   else for k:=1 to m do
    begin
     free[i,k]:=free[i-1,k];
     hailong:=hailong+free[i,k];
    end;
   duyet(i+1);
  end;
end;
begin
 assign(input,'teaworld.inp');reset(input);
 assign(output,'teaworld.out');rewrite(output);
 nhap;
 duyet(1);
 write(res);
 close(input); close(output);
end.
