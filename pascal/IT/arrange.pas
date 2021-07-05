uses math;
const oo=high(int64);
type node=record
     gt:int64;vt:longint;
end;
var n:longint; res,q,r:int64; pp:node;
    a,p:array[0..1000000] of longint;
    rem,val,rem1,free,b:array[0..1000000] of int64;
    w:array[0..1000000] of node;
procedure nhap;
var  i:longint;  sum:int64;
begin
 read(n);
 sum:=0;
 for i:=1 to n do
  begin
   read(a[i]);
   sum:=sum+a[i];
  end;
 q:=sum div n;
 r:=sum mod n;
 for i:=1 to n do
  begin
   a[i]:=a[i]-q;
   b[i]:=b[i-1]+a[i];
  end;
 for i:=n downto 1 do   if b[i]<=0 then p[i]:=p[i+1]-1 else p[i]:=p[i+1]+1;
end;

procedure trans(s,l,r:longint);
begin
 if (l=r) or (rem[s]=0) then exit;
 if val[2*s]<>oo then inc(Val[2*s],rem[s]);
 if val[2*s+1]<>oo then inc(val[2*s+1],rem[s]);
 inc(rem[2*s],rem[s]);
 inc(Rem[2*s+1],rem[s]);
 rem[s]:=0;
end;
procedure init(s,l,r,i:longint;x:int64;y:longint);
var  mid:longint;      tg,tg1:int64;
begin
 if (i<l) or (i>r) then exit;
 if l=r then
  begin
   val[s]:=x;
   w[s].gt:=y;
   w[s].vt:=i;
   exit;
  end;
 mid:=(l+r) div 2;
 init(2*s,l,mid,i,x,y);
 init(2*s+1,mid+1,r,i,x,y);
 if val[2*s]<=0 then tg:=oo else tg:=val[2*s];
 if val[2*s+1]<=0 then tg1:=oo else tg1:=val[2*s+1];
 val[s]:=min(tg,tg1);
 if w[2*s].gt<w[2*s+1].gt then w[s]:=w[2*s+1]
 else w[s]:=w[2*s];
end;


procedure trans1(s,l,r:longint);
begin
 if (l=r) or (rem1[s]=0) then exit;
 if w[2*s].gt<>-oo then inc(w[2*s].gt,rem1[s]);
 if w[2*s+1].gt<>-oo then inc(w[2*s+1].gt,rem1[s]);
 inc(rem1[2*s],rem1[s]);
 inc(Rem1[2*s+1],rem1[s]);
 rem1[s]:=0;
end;
procedure update1(s,l,r,u,v,x:longint);
var  mid:longint; tg,tg1:node;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   if w[s].gt<>-oo then w[s].gt:=w[s].gt+x;
   rem1[s]:=rem1[s]+x;
   exit;
  end;
 trans1(s,l,r);
 mid:=(l+r) div 2;
 update1(2*s,l,mid,u,v,x);
 update1(2*s+1,mid+1,r,u,v,x);
 if free[w[2*s].vt]=1 then tg:=pp else tg:=w[2*s];
 if free[w[2*s+1].vt]=1 then tg1:=pp else tg1:=w[2*s+1];
 if tg.gt<tg1.gt then w[s]:=tg1
 else w[s]:=tg;
end;

procedure find(s,l,r:longint);
var  mid:longint;  tg,tg1:int64;
begin
 if l=r then
 if val[s]=0 then
  begin
   update1(1,1,n,1,l,-2);
   exit;
  end
 else exit;
 mid:=(l+r) div 2;
 trans(s,l,r);
 find(2*s,l,mid);
 find(2*s+1,mid+1,r);
 if val[2*s]<=0 then tg:=oo else tg:=val[2*s];
 if val[2*s+1]<=0 then tg1:=oo else tg1:=val[2*s+1];
 val[s]:=min(tg,tg1);
end;
procedure update(s,l,r,u,v,x:longint);
var mid:longint;      tg,tg1:int64;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (r<=v) then
  begin
   if val[s]<>oo then val[s]:=val[s]+x;
   rem[s]:=rem[s]+x;
   if val[s]=0 then find(s,l,r);
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 if val[2*s]<=0 then tg:=oo else tg:=val[2*s];
 if val[2*s+1]<=0 then tg1:=oo else tg1:=val[2*s+1];
 val[s]:=min(tg,tg1);
end;

function get(s,l,r,u,v:longint):node;
var  tg,tg1:node;    mid:longint;
begin
 if (u>r) or (v<l) then exit(pp);
 if (u<=l) and (r<=v) then exit(w[s]);
 trans1(s,l,r);
 mid:=(l+r) div 2;
 tg:=get(2*s,l,mid,u,v);
 tg1:=get(2*s+1,mid+1,r,u,v);
 if tg.gt<tg1.gt then exit(tg1) else exit(tg);
end;

procedure xuli;
var kq:int64; tg:node; i,tmp:longint;
begin
 pp.gt:=-oo;   pp.vt:=0;   kq:=0;
 for i:=1 to n do
  begin
   kq:=kq+abs(b[i]);
   init(1,1,n,i,b[i],p[i]);
  end;
 res:=kq;
 for i:=1 to r do
  begin
   tg:=get(1,1,n,1,n);
   kq:=kq-tg.gt;
   tmp:=tg.vt;
   free[tmp]:=1;
   update1(1,1,n,tmp,tmp,0);
   update(1,1,n,tmp,n,-1);
  end;
 res:=kq;
 write(Res);
end;
begin
 assign(input,'arrange.inp');reseT(input);
 assign(output,'arrange.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
