uses math;
var k,nt:longint;
    maxx,res:int64;
    e,p,a,dem,last:array[0..10000000] of longint;
procedure snt(n:longint);
var i,j:longint;
begin
 for i:=1 to n do e[i]:=i;
 for i:=2 to n do
  begin
   if e[i]=i then
    begin
     inc(nt);
     p[nt]:=i;
    end;
   for j:=1 to nt do
    begin
     if (p[j]>e[i]) or (p[j]>n div i) then break;
     e[p[j]*i]:=p[j];
    end;
  end;
end;
procedure nhap;
var i:longint;
begin
 read(k);
 for i:=1 to k do
  begin
   read(a[i]);
   maxx:=maxx+a[i];
  end;
end;
function check(x:int64):boolean;
var i,kq:longint; a1:int64;
begin
 for i:=1 to nt do
  begin
   a1:=p[i]; kq:=0;
   while a1<=x  do
    begin
     kq:=kq+x div a1;
     if a1<=x div p[i] then a1:=int64(a1)*p[i]
     else break;
    end;
   if kq<dem[p[i]] then exit(False);
  end;
 exit(true);
end;

procedure xuli;
var l,r,mid,a1:int64;
    i,j:longint;
begin
 for j:=1 to k do
  begin
   for i:=1 to nt do
   if p[i]<=a[j] then
    begin
     a1:=p[i];
     while a1<=a[j] do
      begin
       dem[p[i]]:=dem[p[i]]+a[j] div a1;
       if a1<=a[j] div p[i] then a1:=int64(a1)*p[i]
       else break;
      end;
    end
   else break;
  end;
 l:=0;
 r:=maxx;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if check(mid) then
    begin
     res:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 write(Res);
end;
begin
 assign(input,'nmin.inp');reset(input);
 assign(output,'nmin.out');rewrite(output);
 snt(10000000);
 nhap;
 xuli;
 close(input); close(output);
end.
