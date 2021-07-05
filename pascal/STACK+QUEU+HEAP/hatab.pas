uses math;
var m,n,res,kk,top:longint;
    l,r,h,stack:array[0..64] of longint;
    a,b:array[0..64,0..64] of longint;
procedure nhap;
var i,j:longint;
begin
 read(m,n,kk);
 for i:=1 to m do
  for j:=1 to n do read(a[i,j]);
 for i:=1 to m do
  for j:=1 to n do read(b[i,j]);
end;
procedure timl;
var i:longint;
begin
 top:=0; stack[0]:=0;
 for i:=1 to n do
  begin
   while (top>0) and (h[i]<=h[stack[top]]) do dec(top);
   l[i]:=stack[top]+1;
   inc(top);
   stack[top]:=i;
  end;
end;
procedure timr;
var i:longint;
begin
 top:=0; stack[n+1]:=0;
 for i:=n downto 1 do
  begin
   while (top>0) and (h[i]<=h[stack[top]]) do dec(top);
   r[i]:=stack[top]-1;
   inc(top);
   stack[top]:=i;
  end;
end;
procedure tinhpd(u,v:longint);
var i,j:longint;
begin
 fillchar(h,sizeof(h),0);
 cr:=m-u+1;
 cd:=n-v+1;
 for i:=1 to cr do
  begin
   for j:=1 to cd do
    if abs(a[u+i-1,v+j-1]-b[i,j])<=k then h[j]:=h[j]+1
    else h[j]:=0;
   timl; timr;
   for j:=1 to cd do res:=max(Res,h[j]*(r[j]-l[j]+1));
  end;
end;
procedure tinhtd(u,v:longint);
var i,j:longint;
begin
 fillchar(h,sizeof(h),0);
 cr:=m-u+1;
 cd:=v;
 for i:=1 to cr do
  begin
   for j:=1 to cd do
    if abs(a[u+i-1,v-j+1]-b[i,n-j+1])<=k then h[j]:=h[j]+1
    else h[j]:=0;
   timl; timr;
   for j:=1 to cd do res:=max(Res,h[j]*(r[j]-l[j]+1));
  end;
end;
procedure tinhpt(u,v:longint);
var i,j:longint;
begin
 fillchar(h,sizeof(h),0);
 cr:=u;
 cd:=v;
 for i:=1 to cr do
  begin
   for j:=1 to cd do
    if abs(a[i,j]-b[m-(cd-j+1),n-(cr-i+1)])<=k then h[j]:=h[j]+1
    else h[j]:=0;
   timl; timr;
   for j:=1 to cd do res:=max(Res,h[j]*(r[j]-l[j]+1));
  end;
end;
procedure tinhtt(u,v:longint);
var i,j:longint;
begin
 fillchar(h,sizeof(h),0);
 cr:=u;
 cd:=m-v+1;
 for i:=1 to cr do
  begin
   for j:=1 to cd do
    if abs(a[i,v+j-1]-b[m-(cr-i+1),j])<=k then h[j]:=h[j]+1
    else h[j]:=0;
   timl; timr;
   for j:=1 to cd do res:=max(Res,h[j]*(r[j]-l[j]+1));
  end;
end;
procedure xuli;
var u,v:longint;
begin
 for u:=1 to m do
  for v:=1 to n do
   begin
    tinhpd(u,v);
    tinhtd(u,v);
    tinhpt(u,v);
    tinhtt(u,v);
   end;
 write(Res);
end;
begin
 assign(input,'htab.inp');reset(input);
 assign(output,'htab.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
