uses math;
type
 node=record
 res,t,d,tt:longint;
end;
var  n,kq,dem,ymin,ymax:longint;
     a:array[1..10000] of node;
     c,val:array[1..40000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 ymin:=30000;
 ymax:=0;
 for i:=1 to n do
  begin
   inc(dem);
   read(a[dem].res,a[dem].t);
   a[dem].tt:=-1;
   inc(dem);
   read(a[dem].res,a[dem].d);
   a[dem].tt:=1;
   a[dem-1].d:=a[dem].d;
   a[dem].t:=a[dem-1].t;
   ymax:=max(ymax,a[dem].d);
   ymin:=min(ymin,a[dem].t);
 end;
end;
procedure doicho(var x,y:node);
var
 tg:node;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure sort(l,r:longint);
var i,j,mid:longint;
begin
        i:=l;
        j:=r;
        mid:=l+random(r-l+1);
        repeat
         while (a[i].res<a[mid].res) do inc(i);
         while (a[j].res>a[mid].res) do dec(j);
         if i<=j then
          begin
           doicho(a[i],a[j]);
           inc(i);
           dec(j);
          end;
        until i>j;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
end;
procedure update1(s,l,r,u,v:longint);
var mid:longint;
begin
 if (v<l) or (u>r) then exit;
 if (u<=l) and (v>=r) then
  begin
   c[s]:=c[s]+1;
   val[s]:=r-l;
   exit;
  end;
 if l=r then exit;
 mid:=(l+r) div 2;
 update1(2*s,l,mid,u,v);
 update1(2*s+1,mid+1,r,u,v);
 if c[s]=0 then val[s]:=val[2*s]+val[2*s+1];
end;
procedure update2(s,l,r,u,v:longint);
var mid:longint;
begin
 if (v<l) or (u>r) then exit;
 if (u<=l) and (v>=r) then
  begin
   c[s]:=c[s]-1;
   if c[s]>0 then exit;
   val[s]:=val[2*s]+val[2*s+1];
   exit;
  end;
 if l=r then
  begin
   c[s]:=0;
   exit;
  end;
 mid:=(l+r) div 2;
 update2(2*s,l,mid,u,v);
 update2(2*s+1,mid+1,r,u,v);
 if c[s]=0 then val[s]:=val[2*s]+val[2*s+1];
end;
procedure xuli;
var i:longint;
begin
 sort(1,dem);
 update1(1,ymin,ymax,a[1].t,a[1].d);
 for i:=2 to dem do
  begin
   kq:=kq+(a[i].res-a[i-1].res)*val[1];
   if a[i].tt=-1 then update1(1,ymin,ymax,a[i].t,a[i].d)
   else update2(1,ymin,ymax,a[i].t,a[i].d);
  end;
 write(kq);
end;
begin
 nhap;
 xuli;
end.
