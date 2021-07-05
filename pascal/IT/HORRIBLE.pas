uses math;
var n,c,u,v,k,h,t,i1:longint;
    val,rem:array[0..400000] of int64;
procedure trans(s,l,r:longint);
var mid:longint;
begin
 if (l=r) or (rem[s]=0) then exit;
 mid:=(l+r) div 2;
 inc(val[2*s],int64(rem[s])*(mid-l+1));
 inc(val[2*s+1],int64(rem[s])*(r-mid));
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
   inc(val[s],int64(x)*(r-l+1));
   inc(rem[s],x);
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 val[s]:=val[2*s]+val[2*s+1];
end;
function get(s,l,r,u,v:longint):int64;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u<=l) and (r<=v) then exit(val[s]);
 trans(s,l,r);
 mid:=(l+r) div 2;
 exit(get(2*s,l,mid,u,v)+get(2*s+1,mid+1,r,u,v));
end;
procedure nhap;
var i:longint;
begin
 for i:=1 to 400000 do
 begin
   rem[i]:=0;
   val[i]:=0;
  end;
 read(n,c);
 for i:=1 to c do
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
 read(t);
 for i1:=1 to t do
  begin
   nhap;
  end;
end.
