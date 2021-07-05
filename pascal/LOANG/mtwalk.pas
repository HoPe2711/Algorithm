uses math;
const oo=10000;
      q:array[1..4] of longint=(1,-1,0,0);
      q1:array[1..4] of longint=(0,0,1,-1);
var hmin,hmax,res,n,r,f,x,y:longint;
    a:array[0..100,0..100] of longint;
    d:array[0..100,0..100] of boolean;
    queu,queu1:array[0..400000] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n); res:=oo; hmin:=oo;
 for i:=1 to n do
  for j:=1 to n do
   begin
    read(a[i,j]);
    hmax:=max(hmax,a[i,j]);
    hmin:=min(hmin,a[i,j]);
   end;
end;
procedure push(x,y:longint);
begin
 inc(r);
 queu[r]:=x;
 queu1[r]:=y;
end;
procedure pop;
begin
 x:=queu[f];
 y:=queu1[f];
 inc(f);
end;
function check(kmin,kmax:longint):boolean;
var u,v,i:longint;
begin
 f:=1; r:=0;
 fillchar(d,sizeof(d),false);
 if (a[1,1]<=kmax) and (a[1,1]>=kmin) then
  begin
   push(1,1);   d[1,1]:=true;
   while f<=r do
    begin
     pop;
     for i:=1 to 4 do
      begin
       u:=x+q[i];
       v:=y+q1[i];
       if (u<=n) and (u>=1) and (v<=n) and (v>=1) then
        if (a[u,v]>=kmin) and (a[u,v]<=kmax) then
        if d[u,v]=false then
        begin
          d[u,v]:=true;
          push(u,v);
        end;
      end;
   end;
  end;
  exit(d[n,n]);
end;
procedure xuli;
var i,l,r,mid:longint;
begin
 for i:=hmin to hmax do
  begin
   l:=0;
   r:=hmax;
   while l<=r do
    begin
     mid:=(l+r) div 2;
     if i+mid<=hmax then
      begin
       if check(i,i+mid) then
        begin
         res:=min(res,mid);
         r:=mid-1;
        end
       else l:=mid+1;
      end
     else r:=mid-1;
    end;
  end;
  write(Res);
end;
begin
 //assign(input,'MTWALK.inp');reset(input);
 //assign(output,'MTWALK.out');rewrite(output);
 nhap;
 xuli;
 //close(input); close(output);
end.