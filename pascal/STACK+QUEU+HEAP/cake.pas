// bo nho thap dung it mang
uses math;
const oo=1000000007;
var n,q,dem,tt,tt1,f,r:longint;
    queu:array[-1000000..2000000] of longint;
procedure push(x:longint);
begin
 inc(r);
 queu[r]:=x;
end;
procedure back(x:longint);
begin
 dec(f);
 queu[f]:=x;
end;
function find(x,l,r:longint):longint;
var kq,mid:longint;
begin
 kq:=oo;
 while l<=r do
  begin
   mid:=(l+r) div 2;
   if queu[mid]=x then exit(mid);
   if queu[mid]>x then
    begin
     kq:=min(kq,mid);
     r:=mid-1;
    end
   else l:=mid+1;
  end;
 exit(kq);
end;
procedure nhap;
var i,x:longint;
begin
 read(n,q);
 f:=1; r:=0;
 read(x); tt1:=x;
 tt:=x;   push(x);
 for i:=2 to n do
  begin
   read(x);
   if x=tt1 then inc(dem);
   tt:=tt+x;
   push(tt);
  end;
end;
procedure xuli;
var i,u,v:longint;
begin
 for i:=1 to q do
  begin
   read(u,v);
   if u=0 then
   if v mod tt1<>0 then writeln(v div tt1+1)
   else writeln(v div tt1);
  end;
end;
procedure xuli3;
var i,u,v,vtbd,cl,res:longint;
begin
 vtbd:=0; cl:=0;
 for i:=1 to q do
  begin
   read(u,v);
   if u=1 then
    begin
     back(vtbd);
     vtbd:=vtbd-v;
     cl:=cl+v;
    end;
   if u=2 then push(queu[r]+v);
   if u=0 then
    begin
     back(-oo);
     res:=find(v-cl,f,r)-f;
     writeln(res);
     inc(f);
    end;
  end;
end;
begin
 assign(input,'cake.inp');reset(input);
 assign(output,'cake.out');rewrite(output);
 nhap;
 if (n=dem+1) then xuli
// if (n<=1000) and (q<=1000) then xuli2
 else xuli3;
 close(input); close(output);
end.

