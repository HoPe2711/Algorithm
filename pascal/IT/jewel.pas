//it tren doan thang
uses math;
const oo=high(int64) div 2;
var p,d,v,val,e:array[0..800000] of longint;
    res:int64;
    n,m:longint;
function  tinh(i,x:longint):int64;
begin
 exit(v[i]+int64((x-p[i]))*d[i]);
end;
procedure update(s,l,r,u,v,x:longint);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (v>=r) then
  begin
   if val[s]=0 then
    begin
     val[s]:=x;
     exit;
    end;
   if (tinh(val[s],l)>=tinh(x,l)) and (tinh(val[s],r)>=tinh(x,r)) then exit;
   if (tinh(val[s],l)<=tinh(x,l)) and (tinh(val[s],r)<=tinh(x,r)) then
    begin
     val[s]:=x;
     exit;
    end;
   mid:=(l+r) div 2;
   if (tinh(val[s],l)>=tinh(x,l)) and (tinh(val[s],mid)>=tinh(x,mid)) then
    begin
     update(2*s+1,mid+1,r,u,v,x);
     exit;
    end;
   if (tinh(val[s],l)<=tinh(x,l)) and (tinh(val[s],mid)<=tinh(x,mid)) then
    begin
     update(2*s+1,mid+1,r,u,v,val[s]);
     val[s]:=x;
     exit;
    end;
   if (tinh(val[s],mid+1)>=tinh(x,mid+1)) and (tinh(val[s],r)>=tinh(x,r)) then
    begin
     update(2*s,l,mid,u,v,x);
     exit;
    end;
   if (tinh(val[s],mid+1)<=tinh(x,mid+1)) and (tinh(val[s],r)<=tinh(x,r)) then
    begin
     update(2*s,l,mid,u,v,val[s]);
     val[s]:=x;
     exit;
    end;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
end;
function get(s,l,r,i:longint):int64;
var mid:longint;  tg,tg1:int64;
begin
 if (i>r) or (i<l) then exit(-oo);
 tg:=tinh(val[s],i);
 if (l=r) then exit(tinh(val[s],i));
 mid:=(l+r) div 2;
 tg1:=max(get(2*s,l,mid,i),get(2*s+1,mid+1,r,i));
 exit(max(tg,tg1));
// exit(max(get(2*s,l,mid,i),get(2*s+1,mid+1,r,i)));
end;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(p[i],e[i],v[i],d[i]);
   update(1,1,n,p[i],e[i],i);
  end;
 for i:=1 to n do
  begin
    res:=get(1,1,n,i);
    if res=-oo then res:=0;
    writeln(res);
  end;
end;
begin
 assign(input,'jewel.inp');reset(input);
 assign(output,'jewel.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
