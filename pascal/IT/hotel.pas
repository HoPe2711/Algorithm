uses math;
type node=record
     id,le,ri:longint;
end;
var n,p:longint;
    rem:array[0..100000] of longint;
    val:array[0..100000] of node;
procedure gan(s,l,r,x:longint);
begin
 if x=1 then
  begin
   val[s].id:=0;
   val[s].le:=0;
   val[s].ri:=0;
  end;
 if x=0 then
  begin
   val[s].id:=r-l+1;
   val[s].le:=r-l+1;
   val[s].ri:=r-l+1;
  end;
 rem[s]:=x;
end;
procedure trans(s,l,r:longint);
var mid:longint;
begin
 if (l=r) or (rem[s]=0) then exit;
 mid:=(l+r) div 2;
 gan(2*s,l,mid,rem[s]);
 gan(2*s+1,mid+1,r,rem[s]);
 rem[s]:=0;
end;
procedure update(s,l,r,u,v,x:longint);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (v>=r) then
  begin
   gan(s,l,r,x);
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 val[s].le:=val[2*s].le;
 if val[2*s].le=mid-l+1 then val[s].le:=val[2*s].le+val[2*s+1].le;
 val[s].ri:=val[2*s+1].ri;
 if val[2*s+1].ri=r-mid then val[s].ri:=val[2*s].ri+val[2*s+1].ri;
 val[s].id:=max(val[2*s].id,max(val[2*s+1].id,val[2*s].ri+val[2*s+1].le));
end;
procedure nhap;
var i,x,k,q:longint;
begin
 read(n,p);
 for i:=1 to n do update(1,1,n,i,i,0);
 for i:=1 to p do
  begin
   read(x);
   if x=1 then
    begin
     read(k,q);
     update(1,1,n,k,k+q-1,1);
    end;
   if x=2 then
    begin
     read(k,q);
     update(1,1,n,k,k+q-1,0);
    end;
   if x=3 then writeln(val[1].id);
  end;
end;
begin
 assign(input,'hotel.inp');reset(input);
 assign(output,'hotel.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
