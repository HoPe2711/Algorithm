uses math;
type node=record
     le,l,r:longint;
end;
var h,b:array[0..100000] of longint;
    free:array[0..100000] of boolean;
    p:array[0..100000] of node;
    n,res,dem:longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do
  begin
   read(h[i]);
   p[i].le:=i;
  end;
 for i:=1 to n do
  begin
   if i>1 then p[i].l:=i-1;
   if i<n then p[i].r:=i+1;
  end;
 b:=h;
end;
Procedure doicho(var x,y: longint);
  Var tg: longint;
  Begin
    tg:=x; x:=y; y:=tg;
  End;
Procedure qsort(l,r: longint);
Var i,j,k,k1: longint;
      tg,k2: node;
  Begin
    i:=l; j:=r; k:=l+ random(r-l+1);
    k1:=h[k]; k2:=p[k];
    Repeat
      While (h[i]>k1) or ((h[i]=k1) and (p[i].le>k2.le)) do inc(i);
      While (h[j]<k1) or ((h[j]=k1) and (p[j].le<k2.le)) do dec(j);
      If i<=j then
        begin
          doicho(h[i],h[j]);
          tg:=p[i]; p[i]:=p[j]; p[j]:=tg;
          inc(i);
          dec(j);
        end;
    Until i>j;
    If l<j then qsort(l,j);
    If i<r then qsort(i,r);
  End;
procedure xuli;
var i,high,last:longint;
begin
 qsort(1,n);
 for i:=1 to n do
  begin
   if free[p[i].l] then dec(dem);
   if free[p[i].r] then dec(dem);
   inc(dem);
   free[p[i].le]:=true;
   if h[i]<>h[i+1] then
    if res<dem then
     begin
      res:=dem;
      high:=i;
     end;
  end;
 dec(res);
 last:=-1;
 for i:=1 to n do
  if b[i]<h[high] then
   if last<>i-1 then
    begin
     inc(res);
     last:=i;
    end
   else last:=i;
 write(res);
end;
begin
 assign(input,'duathlon.inp');reset(input);
 assign(output,'duathlon.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
