uses math;
var left,right,next:array[0..500000] of longint;
    res,p,val:array[0..500000] of int64;
    n,m:longint;
    trans:int64;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure update(s,l,r,i:longint; x:int64);
var mid:longint;
begin
 if (i>R) or (i<l) then exit;
 if l=r then
  begin
  val[s]:=x;
  exit;
  end;
 mid:=(r+l) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=min(Val[2*s],val[2*s+1]);
end;
function get(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(trans);
 if (u<=l) and (r<=v) then exit(val[s]);
 mid:=(l+r) div 2;
 exit(min(Get(2*s,l,mid,u,v),get(2*s+1,mid+1,r,u,v)));
end;
procedure qsort(l,r:longint);
var i,j:longint;   mid,tg:int64;
begin
 i:=l;
 j:=r;
 mid:=p[l+random(r-l+1)];
 repeat
  while p[i]>mid do inc(i);
  while p[j]<mid do dec(j);
  if i<=j then
   begin
    tg:=p[i];
    p[i]:=p[j];
    p[j]:=tg;
    doicho(left[i],left[j]);
    doicho(right[i],right[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to m do read(left[i],right[i],p[i]);
 qsort(1,m);
 for i:=1 to n do next[i]:=i+1;
end;
procedure xuli;
var u,v,time,tg,tmp,i:longint;
begin
 for i:=1 to m do
  begin
   u:=left[i];
   v:=right[i];  tg:=u;
   while tg<=v do
    begin
     if res[tg]=0 then res[tg]:=p[i];
     tmp:=tg;
     tg:=next[tg];
     next[tmp]:=next[v] ;
    end;
  end;

 trans:=2**31-1;
 //for i:=1 to 4*n do val[i]:=trans;
 for i:=1 to n do
 begin
  if res[i]=0 then res[i]:=trans;
  //write(res[i],' ');
  update(1,1,n,i,res[i]);
 end;
 for i:=1 to m do
  if get(1,1,n,left[i],right[i])<>p[i] then
   begin
    writeln('inconsistent');
    exit;
   end;
 writeln('consistent');
 for i:=1 to n do write(res[i],' ');
end;
begin
 assign(input,'rermq.inp');reset(input);
 assign(output,'rermq.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
