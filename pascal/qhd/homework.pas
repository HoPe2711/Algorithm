uses math;
var st,st1:String;
    d:Array[0..50,0..5] of boolean;
    f:array[0..50,0..5] of int64;
    ts:Array[0..20,0..20] of int64;
    n,t,h:longint;
function cal(i,j:longint):int64;
var  k,last:longint; tmp,tg:int64;
begin
 if d[i,j] then exit(f[i,j]);
 d[i,j]:=true;
 if (i<n+1) and (j=5) then
  begin
   f[i,j]:=-1;
   exit(-1);
  end;
 if (i=n+1) and (j=5) then
  begin
   f[i,j]:=0;
   exit(0);
  end;
 if (i=n+1) and (j<>5) then
  begin
   f[i,j]:=-1;
   exit(-1);
  end;
 tg:=-1;
 if st[i]='0' then last:=i+1 else last:=min(n+1,i+12);
 for k:=last downto i+1 do
  begin
   tmp:=cal(k,j+1);
   if tmp<>-1 then tg:=max(tg,tmp+ts[i,k-1]);
  end;
 if i+12<=n then
 if ts[i,i+12]=10**12 then
  begin
   tmp:=cal(i+13,j+1);
   if tmp<>-1 then tg:=max(tg,tmp+ts[i,i+12]);
  end;
 f[i,j]:=tg;
 exit(F[i,j]);
end;
procedure nhap;
var i,j:longint; tmp:int64;
begin
 readln(St);
 fillchar(d,sizeof(D),false);
 fillchar(F,sizeof(f),0);
 n:=length(St);
 for i:=1 to n do
  for j:=i to min(i+12,n) do
   begin
    st1:=copY(st,i,j-i+1);
    val(st1,ts[i,j]);
   end;
 if st='0000' then
  begin
   writeln(0);
   exit;
  end
 else
  begin
   tmp:=cal(1,1);
   if tmp=-1 then writeln('unlucky')
   else writeln(tmp);
  end;
end;
begin
 assign(input,'homework.inp');reset(input);
 assign(output,'homework.out');rewrite(output);
 readln(t);
 for h:=1 to t do nhap;
 close(input); close(output);
end.
