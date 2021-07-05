uses math;
var n,m,u,v,k,h:longint;
    val,rem:array[0..200000] of longint;
procedure trans(s,l,r:longint);
begin
 if (l=r) or (rem[s]=0) then exit;
 inc(val[2*s],rem[s]);
 inc(val[2*s+1],rem[s]);
 inc(rem[2*s],rem[s]);
 inc(rem[2*s+1],rem[s]);
 rem[s]:=0;
end;
procedure update(s,l,r,u,v,x:longint);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   inc(val[s],x);
   inc(rem[s],x);
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 val[s]:=max(val[2*s],val[2*s+1]);
end;
function get(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u<=l) and (r<=v) then exit(val[s]);
 trans(s,l,r);
 mid:=(l+r) div 2;
 exit(max(get(2*s,l,mid,u,v),get(2*s+1,mid+1,r,u,v)));
end;
procedure nhap;
var i:longint;
begin
 read(n,m);
 for i:=1 to m do
 begin
  read(h);
  if h=0 then
  begin
   read(u,v,k);
   update(1,1,n,u,v,k);
  end
  else
   begin
    read(u,v);
    writeln(get(1,1,n,u,v));
   end;
 end;
end;
begin
 nhap;
end.