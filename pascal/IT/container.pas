uses math;
VAR m,w,n,sk:longint;
    val,a,s:array[0..800000] of longint;
PROCEDure nhap;
var i:longint;
begin
 read(m,w,n);
 for i:=1 to n do read(a[i]);
end;
procedure update(s,l,r,i,x:longint);
var mid:longint;
begin
 if (i<l) or (i>r) then exit;
 if l=r then
  begin
   val[s]:=x;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=max(val[2*s],val[2*s+1]);
end;
function get(s,u,v,l,r:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(0);
 if (u>=l) and (r>=v) then exit(val[s]);
 mid:=(u+v) div 2;
 exit(max(get(2*s,u,mid,l,r),get(2*s+1,mid+1,v,l,r)));
end;
function find(l,r,x:longint):longint;
var kq,mid:longint;
begin
 kq:=0;
 while l<=r do
  begin
   mid:=(l+r) div 2;
 //  tt:=get(1,1,sk,1,mid);
   if get(1,1,sk,1,mid)>=x then
    begin
     kq:=mid;
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
procedure xuli;
var i,ok:longint;
begin
 sk:=min(m,n);
 for i:=1 to sk do
  begin
   s[i]:=w;
   update(1,1,sk,i,w);
  end;
 // for i:=1 to m do s[i]:=w;
 for i:=1 to n do
  begin
   ok:=find(1,sk,a[i]);
   if ok<>0 then
    begin
     writeln(ok);
     update(1,1,sk,ok,s[ok]-a[i]);
     s[ok]:=s[ok]-a[i];
    end
   else writeln(-1);
  end;
end;
begin
 assign(input,'container.inp');reset(input);
 assign(output,'container.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
