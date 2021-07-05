uses math;
const oo=maxlongint;
type  node=record
      maxx,minn:longint;
end;
var val:array[0..1000000] of node;
    a,b:array[0..1000000] of longint;
    res,n:longint;
procedure update(s,l,r,i,x,t:longint);
var mid:longint;
begin
 if (i>r) or (i<l) then exit;
 if l=r then
  begin
   if t=1 then
    begin
     val[s].maxx:=x;
     exit;
    end
   else
    begin
     val[s].minn:=x;
     exit;
    end;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x,t);
 update(2*s+1,mid+1,r,i,x,t);
 val[s].maxx:=max(val[2*s].maxx,val[2*s+1].maxx);
 val[s].minn:=min(val[2*s].minn,val[2*s+1].minn);
end;
function get(s,l,r,u,v:longint):node;
var tg,tmp,tmp1:node; mid:longint;
begin
 if (u>r) or (l>v) then exit(val[4*n]);
 if (u<=l) and (r<=v) then exit(VAl[s]);
 mid:=(l+r) div 2;
 tmp:=get(2*s,l,mid,u,v);
 tmp1:=get(2*s+1,mid+1,r,u,v);
 tg.maxx:=max(tmp.maxx,tmp1.maxx);
 tg.minn:=min(tmp.minn,tmp1.minn);
 exit(tg);
end;
function find(q,l,r:longint):longint;
var mid,kq:longint;
begin
 kq:=q-1;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if get(1,1,n,q,mid).maxx<=get(1,1,n,q,mid).minn then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
function find1(q,l,r:longint):longint;
var  mid,kq,tmp,tmp1:longint;
begin
 kq:=q-1;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   tmp:=get(1,1,n,q,mid).maxx ;
   tmp1:=get(1,1,n,q,mid).minn ;
   if get(1,1,n,q,mid).maxx<get(1,1,n,q,mid).minn then
    begin
     kq:=mid;
     l:=mid+1;
    end
   else r:=mid-1;
  end;
 exit(kq);
end;
procedure nhap;
var i,tmp,tmp1:longint;
begin
 read(n);
 for i:=1 to 4*n do
  begin
   val[i].maxx:=-oo;
   val[i].minn:=oo;
  end;
 for i:=1 to n do
  begin
   read(a[i]);
   update(1,1,n,i,a[i],1);
  end;
 for i:=1 to n do
  begin
   read(b[i]);
   update(1,1,n,i,b[i],2);
  end;
 for i:=1 to n do
  begin
   tmp:=find(i,i,n);
   tmp1:=find1(i,i,n);
   {if (tmp<>oo) and (tmp1<>oo) then }res:=res+tmp-tmp1;
  end;
 write(res);
end;
begin
// assign(input,'d689.inp');reset(input);
// assign(output,'d689.out');rewrite(output);
 nhap;
// close(input); close(output);
end.