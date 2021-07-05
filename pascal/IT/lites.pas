uses math;
var rem,val:array[0..500000] of longint;
    n,m:longint;
procedure trans(s,l,r:longint);
var mid:longint;
begin
 if (l=r) or (rem[s]=0) then exit;
 mid:=(l+r) div 2;
 rem[2*s]:=1-rem[2*s];
 val[2*s]:=(mid-l+1)-val[2*s];
 rem[2*s+1]:=1-rem[2*s+1];
 val[2*s+1]:=(r-mid)-val[2*s+1];
 rem[s]:=0;
end;
procedure update(s,l,r,u,v:longint);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   val[s]:=(r-l+1)-val[s];
   rem[s]:=1-rem[s];
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v);
 update(2*s+1,mid+1,r,u,v);
 val[s]:=val[2*s]+val[2*s+1];
end;
function get(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u<=l) and (r<=v) then exit(val[s]);
 trans(s,l,r);
 mid:=(l+r) div 2;
 exit(get(2*s,l,mid,u,v)+get(2*s+1,mid+1,r,u,v));
end;
procedure nhap;
var i,x,p,q:longint;
begin
 read(n,m);
 for i:=1 to m do
  begin
   read(x,p,q);
   if x=0 then update(1,1,n,p,q)
   else writeln(get(1,1,n,p,q));
  end;
end;
begin
 assign(input,'lites.inp');reset(input);
 assign(output,'lites.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
