var h,t,tt,tt1:longint;
    a,b:int64;
    prime,gt:array[0..1000000] of longint;
procedure snt(n:longint);
var i,j:longint;
begin
  for i:=2 to trunc(sqrt(n)) do
  if prime[i]=0 then
   begin
    j:=i*i;
    while j<=n do
     begin
      prime[j]:=1;
      j:=j+i;
     end;
   end;
  for i:=2 to n do
   if prime[i]=0 then
    begin
     if i<>3 then gt[i]:=gt[i-1]+1
     else gt[i]:=gt[i-1];
    end
   else gt[i]:=gt[i-1];
end;
begin
 assign(input,'dmt.inp'); reset(input);
 assign(output,'dmt.out');rewrite(output);
 snt(1000000);
 read(t);
 for h:=1 to t do
  begin
   read(a,b);
   if (b<6561) then
    begin
     tt:=trunc(sqrt(b)) div 3;
     tt1:=trunc(sqrt(a-1)) div 3;
     writeln(gt[tt]-gt[tt1]);
    end
   else if a>6561 then
    begin
     tt:=trunc(sqrt(b)) div 3;
     tt1:=trunc(sqrt(a-1)) div 3;
     writeln(gt[tt]-gt[tt1]);
    end
   else
    begin
     tt:=trunc(sqrt(b)) div 3;
     tt1:=trunc(sqrt(a-1)) div 3;
     writeln(gt[tt]-gt[tt1]+1);
    end
  end;
 close(input); close(output);
end.
