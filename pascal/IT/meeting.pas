uses math;
const oo=maxlongint;
var n,m,pp,res:longint;
    val,a,b,t,t1,left,right,d,sum:Array[0..1000001] of longint;
   // sum:array[0..1000001] of int64;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(I);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var  i:longint;
begin
 read(n,m);         pp:=oo;
 for i:=1 to m do
  begin
   read(a[i],b[i]);
   pp:=min(pp,b[i]);
  end;
 qsort(1,m);
 for i:=1 to n do t1[i]:=oo;
 for i:=1 to m do
  begin
   t[a[i]]:=max(t[a[i]],b[i]);
   t1[a[i]]:=min(t1[a[i]],b[i]);
  end;
 for i:=1 to n do left[i]:=max(left[i-1],t[i]);
 right[n+1]:=n+1;
 for i:=n downto 1 do right[i]:=min(right[i+1],t1[i]);
end;
procedure update(s,l,r,i,x:longint);
var mid:longint;
begin
 if (i>r) or (i<l) then exit;
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
function get(s,l,r,u,v:longint):longint;
var mid:longint;
begin
 if (u>R) or (v<l) then exit(0);
 if (u<=l) and (r<=v) then exit(val[s]);
 mid:=(l+r) div 2;
 exit(max(get(2*s,l,mid,u,v),get(2*s+1,mid+1,r,u,v)));
end;
procedure xuli;
var  i,trans,l,r:longint;
begin
 for i:=n downto 1 do
  begin
   l:=max(left[i]+1,i+1); r:=right[i+1];
   trans:=get(1,1,n,l,r);
   if l<=r then
    begin
     if trans=0 then
     begin
      if r=n+1 then d[i]:=trans+1
      else d[i]:=0;
     end
     else d[i]:=trans+1;
    end
   else d[i]:=0;
   sum[i]:=sum[i+1]+d[i];
   update(1,1,n,i,d[i]);
  end;
 for i:=1 to m do
  if sum[a[i]]-sum[b[i]+1]=0 then
   begin
    write(-1);
    exit;
   end;
 for i:=pp downto 1 do res:=max(res,d[i]);
 write(Res);
end;
begin
 assign(input,'meeting.inp');reset(input);
 assign(output,'meeting.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.