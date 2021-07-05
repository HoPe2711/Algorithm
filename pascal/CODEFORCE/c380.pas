{$H+}
uses math;
type node=record
     le,ri,long:longint;
end;
var st:String;
    n,m:longint;
    val:array[0..5000000] of node;
procedure update(s,l,r,i:longint;x:char);
var mid,tmp:longint;
begin
 if (i>r) or (i<l) then exit;
 if l=r then
  begin
   if x='(' then val[s].le:=1 else val[s].ri:=1;
   exit;
  end;
 mid:=(l+r) div 2;
 update(2*s,l,mid,i,x);
 update(2*s+1,mid+1,r,i,x);
 tmp:=min(val[2*s].le,val[2*s+1].ri);
 val[s].long:=val[2*s].long+val[2*s+1].long+2*tmp;
 val[s].le:=val[2*s].le+val[2*s+1].le-tmp;
 val[s].ri:=val[2*s].ri+val[2*s+1].ri-tmp;
end;
function get(s,l,r,u,v:longint):node;
var mid,tg:longint; tmp,tmp1,ans:node ;
begin
 if (v<l) or (u>r) then exit(val[0]);
 if (u<=l) and (v>=r) then exit(val[s]);
 mid:=(l+r) div 2;
 tmp:=get(2*s,l,mid,u,v);
 tmp1:=get(2*s+1,mid+1,r,u,v);
 tg:=min(tmp.le,tmp1.ri);
 ans.long:=tmp.long+tmp1.long+2*tg;
 ans.le:=tmp.le+tmp1.le-tg;
 ans.ri:=tmp.ri+tmp1.ri-tg;
 exit(ans) ;
end;
procedure nhap;
var  i:longint;
begin
 readln(St);
 readln(m);
 n:=length(st);
 for i:=1 to n do update(1,1,n,i,st[i]);
end;

procedure xuli;
var i,p,q:longint;
begin
 for i:=1 to m do
  begin
   readln(p,q);
   writeln(get(1,1,n,p,q).long);
  end;
end;
begin
// assign(input,'c380.inp');reset(input);
// assign(output,'c380.out');rewrite(output);
 nhap;
 xuli;
// close(input); close(output);
end.