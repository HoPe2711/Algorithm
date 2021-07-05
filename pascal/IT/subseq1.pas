uses math;
type node=record
     gt,id:longint;
end;
var a,pos,b,f,c,kq,trace:Array[0..3000000] of longint;
    val:array[-1..3000000] of node;
    n,res,delta,limit,dem:longint;
procedure doicho(Var x,y:longint);
var tg:longint;
begin
 tG:=x;
 X:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,mid:longint;
begin
 i:=l;
 j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(pos[i],pos[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure nhap;
var i:longint;
begin
 read(N,delta);
 for i:=1 to n do
  begin
   read(A[i]);c[i]:=a[i];
   pos[i]:=i;
  end;
 for i:=n+1 to 2*n do
  begin
   a[i]:=a[i-n]-delta;
   pos[i]:=i;
  end;
 for i:=2*n+1 to 3*n do
  begin
   a[i]:=a[i-2*n]+delta;
   pos[i]:=i;
  end;
end;
procedure update(s,l,r,i,x,y:longint);
var mid:longint;
begin
 if (i>r) or (i<l) then exit;
 if (l=r) then
  begin
   if val[s].gt<x then
    begin
     val[s].gt:=x;
     val[s].id:=y;
    end;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x,y);
 update(2*s+1,mid+1,r,i,x,y);
 //val[s]:=max(val[2*s],val[2*s+1]);
 if val[2*s].gt<val[2*s+1].gt then
  begin
   val[s].gt:=val[2*s+1].gt;
   val[s].id:=val[2*s+1].id;
  end
 else
  begin
   val[s].gt:=val[2*s].gt;
   val[s].id:=val[2*s].id;
  end;
end;
function get(s,l,r,u,v:longint):node;
var mid:longint;  tmp,tmp1:node;
begin
 if (u>r) or (v<l) then exit(val[-1]);
 if (u<=l) and (r<=v) then exit(Val[s]);
 mid:=(l+r) div 2;
 tmp:= get(2*s,l,mid,u,v);
 tmp1:= get(2*s+1,mid+1,r,u,v);
 if tmp.gt>tmp1.gt then exit(tmp)
 else exit(tmp1);
end;
procedure xuli;
var i,u:longint;   tmp:node;
begin
 qsort(1,3*n);
 limit:=1;
 b[pos[1]]:=1;
 for i:=2 to 3*n do
  begin
   if a[i]<>a[i-1] then inc(limit);
   b[pos[i]]:=limit;
  end;
 for i:=1 to n do
  begin
   tmp:=get(1,1,limit,b[i+n],b[i+2*n]);
   f[i]:=tmp.gt+1;
   trace[i]:=tmp.id;
   res:=max(res,f[i]);
   update(1,1,limit,b[i],f[i],i);
  end;
 writeln(Res);
 for i:=n downto 1 do
  if f[i]=res then
   begin
    u:=i;
    break;
   end;
 dem:=1; kq[dem]:=c[u];
 while u>0 do
  begin
   u:=trace[u];
   inc(dem); kq[dem]:=c[u];
  end;
 for i:=dem-1 downto 1 do write(kq[i],' ');
end;
begin
 assign(input,'subseq.inp');reset(input);
 assign(output,'subseq.out');rewrite(output);
 nhap;
 xuli;
 close(inpuT); close(output);
end.
