{$H+}
uses math;
const oo=1000000000;
var m,n,k1,res,kq,t,h:longint;
    st:array[0..60000] of string;
    val,a,sum,vt:array[-240000..240000] of longint;
procedure update(s,l,r,i,x:longint);
var mid:longint;
begin
 if (i<l) or (i>r) then exit;
 if l=r then
  begin
   val[s]:=x;
   exit;
  end;
 mid:=(l+r+1) div 2-1;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=min(val[2*s],val[2*s+1]);
end;
function get(s,u,v,l,r:longint):longint;
var mid:longint;
begin
 if (u>r) or (v<l) then exit(oo);
 if (u>=l) and (r>=v) then exit(val[s]);
 mid:=(u+v+1) div 2-1;
 exit(min(get(2*s,u,mid,l,r),get(2*s+1,mid+1,v,l,r)));
end;
procedure nhap;
var i,j:longint;
begin
 readln(m,n,k1);
 for i:=1 to m do
  begin
   readln(st[i]);
   for j:=1 to length(st[i]) do
    if st[i][j]='A' then a[(i-1)*n+j]:=1
    else a[(i-1)*n+j]:=-1;
  end;
 if n<m then
 begin
  for i:=1 to m do
   for j:=1 to n do sum[(i-1)*n+j]:=sum[(i-1)*n+j-1]+a[(j-1)*n+i];
 end
 else
  for i:=1 to n do
   for j:=1 to m do sum[(j-1)*n+i]:=sum[(j-2)*n+i]+a[(i-1)*n+j];
end;
procedure xuli;
var i,j,h,k:longint;
begin
 for i:=-4*n*m to 4*n*m do val[i]:=oo;
 if n<m then
  begin
   for i:=1 to n-1 do
    for j:=i+1 to n do
     begin
      update(1,-n*m,n*m,0,0);
      for k:=1 to m do
       begin
        h:=sum[(k-1)*n+j]-sum[(k-1)*n+i-1];
        res:=get(1,h-k1,h+k1,-n*m,n*m);
        kq:=max((k-res+1)*(j-i+1),kq);
        if vt[h]=0 then update(1,-n*m,n*m,h,k);
        vt[h]:=k;
       end;
      for k:=1 to m do
       begin
         h:=sum[(k-1)*n+j]-sum[(k-1)*n+i-1];
         update(1,-n*m,n*m,h,oo);
         vt[h]:=0;
       end;
     end;
  end
 else
  begin
   for i:=1 to m-1 do
    for j:=i+1 to m do
     begin
      update(1,-n*m,n*m,0,0);
      for k:=1 to n do
       begin
        h:=sum[(k-1)*n+j]-sum[(k-1)*n+i-1];
        res:=get(1,h-k1,h+k1,-n*m,n*m);
        kq:=max((k-res+1)*(j-i+1),kq);
        if vt[h]=0 then update(1,-n*m,n*m,h,k);
        vt[h]:=k;
       end;
      for k:=1 to n do
       begin
         h:=sum[(k-1)*n+j]-sum[(k-1)*n+i-1];
         update(1,-n*m,n*m,h,oo);
         vt[h]:=0;
       end;
     end;
  end;
 writeln(kq);
end;
begin
 assign(input,'abrec.inp');reset(input);
 assign(output,'abrec.out');rewrite(output);
 readln(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input);
 close(output);
end.