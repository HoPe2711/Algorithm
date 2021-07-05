{$H+}
uses math;
var n,q:longint;
    res:int64;
    st:string;
    a:array[0..3000000] of longint;
    d,rem,rems,maxd,mind,val:Array[0..3000000] of int64;
procedure nhap;
var i:longint;
begin
 readln(n,q);
 readln(st);
 for i:=1 to length(st) do a[i+1]:=ord(st[i])-48;
 inc(n);  res:=int64(n)*(n+1) div 2;
end;



procedure trans(s,l,r:longint);
var
 mid: longint;
begin
 if (l=r) or (rem[s]=-1) then exit;
 rem[2*s]:=rem[s];
 rem[2*s+1]:=rem[s];
 mid:=(l+r) div 2;
 val[2*s]:=int64((mid-l+1))*rem[s];
 val[2*s+1]:=int64((r-mid))*rem[s];
 rem[s]:=-1;
end;
procedure tran(s,l,r:longint);
var mid:longint;
begin
 if (l=r) or (rems[s]=-1) then exit;
 rems[2*s]:=rems[s];
 rems[2*s+1]:=rems[s];
 mid:=(l+r) div 2;
 d[2*s]:=int64((mid-l+1))*rems[s];
 d[2*s+1]:=int64((r-mid))*rems[s];
 maxd[2*s]:=rems[s]; maxd[2*s+1]:=rems[s];
 mind[2*s]:=rems[s]; mind[2*s+1]:=rems[s];
 rems[s]:=-1;
end;



procedure update(s,l,r,u,v,x:longint);
var  mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (v>=r) then
  begin
   val[s]:=int64((r-l+1))*x;
   rem[s]:=x;
   exit;
  end;
 trans(s,l,r);
 mid:=(l+r) div 2;
 update(2*s,l,mid,u,v,x);
 update(2*s+1,mid+1,r,u,v,x);
 val[s]:=val[2*s]+val[2*s+1];
end;

function find(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 trans(s,l,r);
 if val[s]=r-l+1 then exit(0);
 mid:=(l+r) div 2;
 if (u<=l) and (v>=r) then
 if (l=r) and (val[s]=0) then exit(l)
 else
   if val[2*s+1]=r-mid then exit(find(2*s,l,mid,u,v))
   else exit(find(2*s+1,mid+1,r,u,v));
 exit(max(find(2*s+1,mid+1,r,u,v),find(2*s,l,mid,u,v)));
end;
function find1(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(n+1);
 trans(s,l,r);
 if val[s]=r-l+1 then exit(n+1);
 mid:=(l+r) div 2;
 if (u<=l) and (v>=r) then
 if (l=r) and (val[s]=0) then exit(l)
 else
  begin
   if val[2*s]=mid-l+1 then exit(find1(2*s+1,mid+1,r,u,v))
   else exit(find1(2*s,l,mid,u,v));
  end;
 exit(min(find1(2*s,l,mid,u,v),find1(2*s+1,mid+1,r,u,v)));
end;




procedure update1(s,l,r,u,v,x:longint);
var mid:longint;
begin
 if (u>r) or (v<l) then exit;
 if (u<=l) and (v>=r) then
  begin
   if mind[s]>=x then
    begin
     mind[s]:=x;
     maxd[s]:=x;
     d[s]:=int64(r-l+1)*x;
     rems[s]:=x;
     exit;
    end;
   if maxd[s]<=x then exit;
  end;
 tran(s,l,r);
 mid:=(l+r) div 2;
 update1(2*s,l,mid,u,v,x);
 update1(2*s+1,mid+1,r,u,v,x);
 d[s]:=d[2*s]+d[2*s+1];
 mind[s]:=min(mind[2*s],mind[2*s+1]);
 maxd[s]:=max(maxd[2*s],maxd[2*s+1]);
end;



procedure xuli;
var i,l,r,x,tt,last,gh:longint;
begin
 for i:=1 to 5*n do
  begin
   maxd[i]:=0;
   mind[i]:=8*n;
   rem[i]:=-1;
   rems[i]:=-1;
  end;
 for i:=1 to n do update(1,1,n,i,i,a[i]);
 a[n+1]:=0;
 last:=1;
 for i:=1 to n do
  begin
   if a[i]=0 then update1(1,1,n,i,i,i);
   if (a[i]=0) and (a[i+1]=1) then last:=i
   else if (a[i+1]=0) and (a[i]=1) then update1(1,1,n,last+1,i,last);
  end;
 writeln(res-d[1]);
 for i:=1 to q do
  begin
   readln(l,r,x);
   update(1,1,n,l+1,r+1,x);
   if x=1 then
    begin
     tt:=find(1,1,n,1,l);
     gh:=find1(1,1,n,r+2,n)-1;
     update1(1,1,n,l+1,gh,tt);
    end;
   writeln(res-d[1]);
  end;
end;
begin
 assign(input,'lamps.inp');reset(input);
 assign(output,'lamps.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
