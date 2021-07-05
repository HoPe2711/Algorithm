{$H+}
uses math;
const oo=maxlongint;
var a,sum,t,val,rem:array[0..4000000] of longint;
    st:string;
    n,m:longint;
procedure trans(s,l,r:longint);
begin
 if (rem[s]=0) or (l=r) then exit;
 val[2*s]:=val[2*s]+rem[s];
 val[2*s+1]:=val[2*s+1]+rem[s];
 rem[2*s]:=rem[s]+rem[2*s];
 rem[2*s+1]:=rem[s]+rem[2*s+1];
 rem[s]:=0;
end;
procedure init(s,l,r,i,x:longint);
var mid:longint;
begin
 if (i>r) or (i<l) then exit;
 if l=r then
  begin
   val[s]:=x;
   exit;
  end;
 mid:=(l+r) div 2;
 init(2*s,l,mid,i,x);
 init(2*s+1,mid+1,r,i,x);
 val[s]:=min(val[2*s],val[2*s+1]);
end;
procedure update(s,l,r,u,v,x:longint);
var  mid:longint;
begin
 if (u>r) or (l>v) then exit;
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

function find(S,l,r,u,v,p:longint):longint;
var  mid,tg:longint;
begin
 if (u>r) or (l>v) then exit(oo);
 if (u<=l) and (r<=v) then
  if val[s]>=p then exit(oo);
 if l=r then
  if val[s]>=p then exit(oo) else exit(l);
 trans(s,l,r);
 mid:=(l+r) div 2;
 tg:=find(2*s,l,mid,u,v,p);
 if tg=oo then tg:=find(2*s+1,mid+1,r,u,v,p);
 exit(tg);
end;

function find1(S,l,r,u,v,p:longint):longint;
var mid,tg:longint;
begin
 if (u>r) or (l>v) then exit(oo);
 if (u<=l) and (r<=v) then
  if val[s]>p then exit(oo);
 if l=r then
  if val[s]>p then exit(oo) else exit(l);
 trans(s,l,r);
 mid:=(l+r) div 2;
 tg:=find1(2*s+1,mid+1,r,u,v,p);
 if tg=oo then tg:=find1(2*s,l,mid,u,v,p);
 exit(tg);
end;
procedure nhap;
var i:longint;
begin
 readln(st);
 n:=length(St);
 for i:=1 to 4*n do val[i]:=oo;
 for i:=1 to n do
 begin
  if st[i]='(' then a[i]:=1
  else a[i]:=-1;
  sum[i]:=sum[i-1]+a[i];
  init(1,1,n,i,sum[i]);
 end;
end;
procedure update1(i,x:longint);
begin
 while i<=n+1 do
  begin
   t[i]:=t[i]+x;
   i:=i+i and  (-i);
  end;
end;
function get1(i:longint):longint;
begin
 get1:=0;
 while i>0 do
  begin
   get1:=get1+t[i];
   i:=i-i and (-i);
  end;
end;
procedure xuli;
var  i,p,tmp,ts,j,tg:longint; x:char;
begin
 readln(m);
 for i:=1 to m do
  begin
   read(x);
   if x='C' then
    begin
     readln(p);   ts:=2;
     if a[p]=1 then
      begin
       a[p]:=-1;
       ts:=-2;
      end
     else a[p]:=1;
     update(1,1,n,p,n,ts);
     update1(p,ts);
     update1(n+1,-ts);
    end
   else
    begin
     readln(p);
     tg:=get1(p-1)+sum[p-1];
     tmp:=min(find(1,1,n,p,n,tg),n+1);
     tmp:=find1(1,1,n,p,tmp-1,tg);
     if tmp<>oo then writeln(tmp-p+1) else writeln(0);
    end;
  end;
end;
begin
 assign(input,'pquery.inp');reset(input);
 assign(output,'pquery.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
