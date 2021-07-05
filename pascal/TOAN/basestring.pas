{$H+}
var st,st1,res:string;
    dem:longint;
    ok:boolean;
function gcd(a,b:longint):longint;
begin
 if b=0 then exit(a);
 exit(gcd(b,a mod b));
end;
procedure nhap;
var tt,i:longint;
begin
 readln(st);
 readln(st1);
 tt:=gcd(length(st),length(St1));
 for i:=1 to tt do
  if st[i]=st1[i] then
    begin
     inc(Dem);
     res:=res+st[i];
    end;
   for i:=1 to length(st)-tt do
    if st[i]<>st[i+tt] then ok:=true;
   for i:=1 to length(st1)-tt do
    if st1[i]<>st1[i+tt] then ok:=true;
 if (dem=tt) and (ok=false) then  writelN(res)   else writeln('NO');
end;
begin
 assign(input,'basestring.inp');reset(input);
 assign(output,'basestring.out');rewrite(output);
 nhap;
 close(input); close(output);
end.