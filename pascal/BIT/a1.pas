uses math;
var n:longint;
    a,p,t:Array[0..500000] of longint;
    trongthinh,sum:array[0..500000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
  end;
 for i:=1 to n do read(p[i]);
end;
procedure update(i,x:longint);
begin
 while i<=n+1 do
  begin
   t[i]:=t[i]+x;
   i:=i+i and (-i);
  end;
end;
function get(i:longint):longint;
var pp:longint;
begin
 pp:=0;
 while i>0 do
  begin
   pp:=pp+t[i];
   i:=i-i and (-i);
  end;
 exit(pp);
end;

function find(l,r,p:longint):longint;
var kq,tg1,tg,mid :longint;
begin
 kq:=p;
 tg1:=get(p);
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tg:=get(mid);
   if tg-tg1>=(mid-p) then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;

function find1(l,r,p:longint):longint;
var kq,tg,tg1,mid:longint;
begin
 kq:=p;
 tg:=get(p);
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tg1:=get(mid-1);
   if tg-tg1>=(p-mid+1) then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
procedure xuli;
var i,tmp,tmp1:longint; res:int64;
begin
 res:=0;
 for i:=n downto 1 do
  begin
   //write(Res);
   trongthinh[i]:=res;
   update(p[i],1);
   update(n+1,-1);
   tmp:=find1(1,p[i]-1,p[i]);
   tmp1:=find(p[i]+1,n,p[i]);
   res:=max(REs,sum[tmp1]-sum[tmp-1]);
   // a[p[i]]:=1;
  end;
 for i:=1 to n do writeln(trongthinh[i]);
end;
begin
 //assign(input,'a1.inp');reset(input);
// assign(output,'a1.out');rewrite(output);
 nhap;
 xuli;
// close(input); close(output);
end.


{uses math;
var n:longint;
    a,p,t:Array[0..500000] of longint;
    trongthinh,sum:array[0..500000] of int64;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(a[i]);
   sum[i]:=sum[i-1]+a[i];
  end;
 for i:=1 to n do read(p[i]);
end;
procedure update(i,x:longint);
begin
 while i<=n+1 do
  begin
   t[i]:=t[i]+x;
   i:=i+i and (-i);
  end;
end;
function get(i:longint):longint;
begin
 get:=0;
 while i>0 do
  begin
   get:=get+t[i];
   i:=i-i and (-i);
  end;
end;

function find(l,r,p:longint):longint;
var kq,tg1,tg,mid :longint;
begin
 kq:=p;
 tg1:=get(p);
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tg:=get(mid);
   if tg-tg1>=(mid-p) then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;

function find1(l,r,p:longint):longint;
var kq,tg,tg1,mid:longint;
begin
 kq:=p;
 tg:=get(p);
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tg1:=get(mid-1);
   if tg-tg1>=(p-mid+1) then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
procedure xuli;
var i,tmp,tmp1:longint; res:int64;
begin
 res:=0;
 for i:=n downto 1 do
  begin
   //write(Res);
   trongthinh[i]:=res;
   update(p[i],1);
   update(n+1,-1);
   tmp:=find1(1,p[i]-1,p[i]);
   tmp1:=find(p[i]+1,n,p[i]);
   res:=max(REs,sum[tmp1]-sum[tmp-1]);
   // a[p[i]]:=1;
  end;
 for i:=1 to n do writeln(trongthinh[i]);
end;
begin
 assign(input,'a1.inp');reset(input);
 assign(output,'a1.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.   }
