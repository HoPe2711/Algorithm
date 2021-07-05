uses math;
var n,m,k,u,v:longint;
    f,fl,fr,rem:array[0..40000] of longint;
procedure gan(s,l,r,x:longint);
begin
 if x=2 then
  begin
    f[s]:=0;
    fl[s]:=0;
    fr[s]:=0;
  end;
 if x=1 then
  begin
   f[s]:=r-l+1;
   fl[s]:=r-l+1;
   fr[s]:=r-l+1;
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
 if (u<=l) and (r<=v) then
  begin
   gan(s,l,r,x);
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 fl[s]:=fl[2*s];
 if fl[2*s]=mid-l+1 then fl[s]:=fl[2*s]+fl[2*s+1];
 fr[s]:=fr[2*s+1];
 if fr[2*s+1]=r-mid then fr[s]:=fr[2*s]+fr[2*s+1];
 f[s]:=max(f[2*s],max(f[2*s+1],fr[2*s]+fl[2*s+1]));
end;
procedure nhap;
var i:longint;
begin
 readln(n);
 read(m);
 update(1,1,n,1,n,1);
 for i:=1 to m do
  begin
   read(k);
   if k=3 then writeln(f[1])
   else
    begin
     read(u,v);
     update(1,1,n,u,v,k);
    end;
  end;
end;
begin
 nhap;
end.