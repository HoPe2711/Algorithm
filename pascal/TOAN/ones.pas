uses math;
var n,res,t,h,nt:longint;
    prime,tt,a,p:array[0..1000000] of longint;
procedure snt(n:longint);
var i,j:longint;
begin
 for i:=1 to n do prime[i]:=i;
 for i:=2 to n do
 begin
  if prime[i]=i then
   begin
    inc(nt);
    p[nt]:=i;
   end;
  for j:=1 to nt do
   begin
    if (p[j]>prime[i]) or (p[j]*i>n) then break;
    prime[p[j]*i]:=p[j];
   end;
 end;
end;
procedure nhap;
var a1,i,dem,y:longint;
begin
 read(n);
 fillchar(tt,sizeof(tt),0);
 for i:=1 to n do read(a[i]);
 for i:=1 to n do
  begin
   a1:=a[i];
   while a1<>1 do
    begin
     dem:=0;
     y:=prime[a1];
     while (a1 mod y=0) do
      begin
       inc(dem);
       a1:=a1 div y;
      end;
     tt[y]:=max(tt[y],dem);
    end;
  end;
 res:=0;
 for i:=1 to nt do res:=res+tt[p[i]];
 writeln(Res);
end;
begin
 assign(input,'ones.inp');reset(input);
 assign(output,'ones.out');rewrite(output);
 snt(1000000);
 read(t);
 for h:=1 to t do nhap;
 close(input); close(output);
end.
