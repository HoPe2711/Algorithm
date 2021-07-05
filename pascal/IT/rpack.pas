uses math;
const oo=high(int64);
type node=record
     gt,gt1:int64; id:longint;
end;
var n,m:longint;
    val,val1:array[0..1000000] of node;
    d,h:Array[0..1000000] of longint;
function ss(p,p1:node):node;
begin
 if p.gt<p1.gt then
  begin
   ss.gt:=p1.gt; ss.id:=p1.id; ss.gt1:=max(p.gt,p1.gt1);
  end
 else
  begin
   ss.gt:=p.gt; ss.id:=p.id; ss.gt1:=max(p1.gt,p.gt1);
  end;
end;


procedure update(s,l,r,i:longint; x:int64);
var  mid:longint;
begin
 if (i>r) or (i<l) then exit;
 if l=r then
  begin
   val[s].gt:=x;     val[s].id:=i;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 val[s]:=ss(val[2*s],val[2*s+1]);
end;
function get(s,l,r,u,v:longint):node;
var  mid:longint;  tmp,tmp1:node;
begin
 if (u>r) or (v<l) then exit(val[0]);
 if (u<=l) and (r<=V) then exit(Val[s]);
 mid:=(l+r) div 2;
 tmp:=get(2*s,l,mid,u,v);
 tmp1:=get(2*s+1,mid+1,r,u,v);
 exit(ss(tmp,tmp1));
end;


procedure update1(s,l,r,i:longint; x:int64);
var  mid:longint;
begin
 if (i>r) or (i<l) then exit;
 if l=r then
  begin
   val1[s].gt:=x;     val1[s].id:=i;
   exit;
  end;
 mid:=(l+r) div 2;
 update1(2*s,l,mid,i,x);
 update1(2*s+1,mid+1,r,i,x);
 val1[s]:=ss(val1[2*s],val1[2*s+1]);
end;
function get1(s,l,r,u,v:longint):node;
var  mid:longint; tmp,tmp1:node;
begin
 if (u>r) or (v<l) then exit(val1[0]);
 if (u<=l) and (r<=V) then exit(Val1[s]);
 mid:=(l+r) div 2;
 tmp:=get1(2*s,l,mid,u,v);
 tmp1:=get1(2*s+1,mid+1,r,u,v);
 exit(ss(tmp,tmp1));
end;
procedure nhap;
var i:longint; sum:int64;
begin
 read(n,m);
 for i:=0 to 8*n do
  begin
   val[i].gt:=0;
   val[i].gt1:=0;
   val1[i].gt1:=-oo;
   val1[i].gt:=-oo;
  end;
 for i:=1 to n do read(d[i]);
 for i:=1 to n do read(h[i]);
 sum:=0;
 for i:=1 to 2*n do
 begin
  if i mod n <>0 then
   begin
    d[i]:=d[i mod n]; h[i]:=h[i mod n];
   end
  else
   begin
    d[i]:=d[n];  h[i]:=h[n];
   end;
  update(1,1,2*n,i,sum+2*h[i]);
  update1(1,1,2*n,i,2*h[i]-sum);
  sum:=sum+d[i];
 end;
end;
procedure xuli;
var  i,u,v:longint; res:int64;  tmp,tmp1:node;
begin
 for i:=1 to m do
  begin
   read(u,v);
   if (u-v=2) or (v-u=n-2) then
    begin
     writeln(0);
     continue;
    end;
   if u>v then
    begin
     tmp:=get(1,1,2*n,v+1,u-1);
     tmp1:=get1(1,1,2*n,v+1,u-1);
     if tmp.id<>tmp1.id then res:=tmp.gt+tmp1.gt
     else res:=max(tmp.gt+tmp1.gt1,tmp.gt1+tmp1.gt)
    end;
   if u<=v then
    begin
     tmp:=get(1,1,2*n,v+1,u+n-1);
     tmp1:=get1(1,1,2*n,v+1,u+n-1);
     if tmp.id<>tmp1.id then res:=tmp.gt+tmp1.gt
     else res:=max(tmp.gt+tmp1.gt1,tmp.gt1+tmp1.gt)
    end;
   writeln(res);
  end;
end;
begin
 assign(input,'rpack.inp');reset(input);
 assign(output,'rpack.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
