uses math;
var rem,val,a,b,pos,gt,p:Array[0..2000000] of longint;
    h,c,q,limit:longint;
procedure trans(s,l,r:longint);
begin
 if  (l=r) or (rem[s]=0) then exit;
 val[2*s]:=max(val[2*s],rem[s]);
 val[2*s+1]:=max(Val[2*s+1],rem[s]);
 rem[2*s]:=max(rem[s],rem[2*s]);
 rem[2*s+1]:=max(rem[s],rem[2*s+1]);
 rem[s]:=0;
end;
procedure update(s,l,r,u,v,x:longint);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   val[s]:=max(val[s],x);
   rem[s]:=max(Rem[s],x);
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 val[s]:=max(Val[2*s],val[2*s+1]);
end;
function get(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u<=l) and (r<=v) then exit(Val[s]);
 trans(s,l,r);
 mid:=(l+r) div 2;
 exit(max(get(2*s,l,mid,u,v),get(2*s+1,mid+1,r,u,v)));
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 Y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(I);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i,l,r,t:longint;
begin
 read(h,c,q);
 for i:=1 to c do
  begin
   read(gt[i],l,r);
   a[i]:=l;
   a[i+c]:=r;
  end;
 for i:=1 to q do
  begin
   read(p[i],t);
   a[2*c+i]:=t;
  end;
 for i:=1 to 2*c +q do pos[i]:=i;
 qsort(1,2*c+q);
 limit:=1 ;
 b[pos[1]]:=limit;
 for i:=2 to 2*c+q do
  begin
   if a[i]<>a[i-1] then inc(limit);
   b[pos[i]]:=limit;
  end;
 h:=limit+1;
 a:=b;
 for i:=1 to c do update(1,1,h,a[i],a[i+c],gt[i]);
 for i:=1 to q do
  if get(1,1,h,a[i+2*c],a[i+2*c])<p[i] then writeln('YES')
  else writeln('NO');
end;
begin
 assign(input,'visiting.inp');reset(input);
 assign(output,'visiting.out');rewrite(output);
 nhap;
 close(input); close(output);
end.