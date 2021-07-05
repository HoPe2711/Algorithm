uses math;
const oo=1000000000;
var pos,a,val,rem,b:array[0..500000] of longint;
    n,res,limit:longint;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tG:=x;
 X:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
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
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(A[i]);     pos[i]:=i;
  end;
 qsort(1,n);
end;
procedure trans(s,l,r:longint);
begin
 if (rem[s]=0) or (l=r) then exit;
 val[2*s]:=val[2*s]+rem[s];
 rem[2*s]:=rem[2*s]+rem[s];
 val[2*s+1]:=val[2*s+1]+rem[s];
 rem[2*s+1]:=rem[2*s+1]+rem[s];
 rem[s]:=0;
end;

procedure update(s,l,r,u,v,x:longint);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   val[s]:=val[s]+x;
   rem[s]:=rem[s]+x;
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 val[s]:=min(val[2*s],val[2*s+1]);
end;
function get(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(oo);
 if (u<=l) and (r<=v) then exit(Val[s]);
 trans(s,l,r);
 mid:=(l+r) div 2;
 exit(min(get(2*s,l,mid,u,v),get(2*s+1,mid+1,r,u,v)));
end;
procedure xuli;
var i,k,tmp:longint;
begin
 limit:=1;
 b[pos[1]       ]:=1;
 for i:=2 to n do
 begin
  if a[i]<>A[i-1] then inc(limit);
  b[pos[i]]:=limit;
 end;
 update(1,1,n,1,b[1],-1);
 update(1,1,n,1,b[2]-1,1);
 if get(1,1,n,1,n)>=0 then res:=1;
 for k:=2 to n div 2 do
  begin
   update(1,1,n,1,b[k]-1,-1);
   update(1,1,n,1,b[k],-1);
   update(1,1,n,1,b[2*k-1]-1,1);
   update(1,1,n,1,b[2*k]-1,1);
   tmp:=get(1,1,n,1,n);
   if tmp>=0 then res:=k;
  end;
 write(res);
end;
begin
 assign(input,'matroska.inp');reset(input);
 assign(output,'matroska.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.