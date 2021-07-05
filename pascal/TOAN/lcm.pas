uses math;
var n,res,t1,h,kk:longint;
    a,prime,last,nt:array[0..1000000] of longint;
procedure  snt(n:longint);
var i,j:longint;
begin
 for i:=1 to n do prime[i]:=1;
 for i:=2 to trunc(Sqrt(n)) do
  if prime[i]=1 then
   begin
    j:=i*i;
    while j<=n do
     begin
      prime[j]:=i;
      j:=j+i;
     end;
   end;
end;
procedure nhap;
var i,j,a1,kq,tp:longint;
begin
 read(n); res:=0;     kq:=0;
 fillchar(last,sizeof(last),0);
 for i:=1 to n do read(A[i]);
 for i:=1 to n do
  begin
   a1:=a[i];
   while (a1<>1) do
    begin
     tp:=a1 div prime[a1];
     a1:=prime[a1];
     if last[tp]<>i then kq:=max(last[tp],kq);
     last[tp]:=i;
    end;
   res:=max(res,i-kq);
  end;
 if res=1 then res:=-1;
 writeln(Res);
end;
begin
 assign(input,'lcm.inp');reset(input);
 assign(output,'lcm.out');rewrite(output);
 snt(1000000);
 read(T1);
 for h:=1 to t1 do
  begin
   nhap;
  // xuli;
  end;
 close(input); close(output);
end.
