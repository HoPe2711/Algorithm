uses math;
var n,demuoc,t,h:longint;
    a,uoc:array[0..50000] of longint;
procedure nhap;
var i:longint;
begin
 read(n);
 for i:=1 to n do read(a[i]);
 demuoc:=0;
 for i:=1 to trunc(Sqrt(a[1])) do
  if a[1] mod i=0 then
   begin
    inc(demuoc);
    uoc[demuoc]:=i;
    if a[1] div i<>i then
     begin
      inc(demuoc);
      uoc[demuoc]:=a[1] div i;
     end;
   end;
end;
function gcd(a,b:longint):longint;
begin
 if a mod b=0 then exit(b);
 exit(gcd(b,a mod b));
end;
procedure xuli;
var  i,dem,dem1,tt,tt1,res,j:longint;
     ok:boolean;
begin
 res:=0;
 for i:=1 to demuoc do
  begin
   dem:=0; dem1:=0; ok:=false;   tt:=0; tt1:=0;
   if uoc[i]<=res then continue;
   for j:=1 to n do
    begin
     if (tt1<>0) and (tt1<res) then
      begin
       ok:=true; break;
      end;
     if a[j] mod uoc[i]=0 then
      begin
       inc(dem);
       if dem=1 then
        begin
         tt:=a[j];
         continue;
        end;
      end
     else
      begin
       inc(dem1);
       if dem1=1 then
        begin
         tt1:=a[j];
         continue;
        end;
      end;
     if (a[j] mod uoc[i]=0) then  tt:=gcd(tt,a[j])
     else tt1:=gcd(tt1,a[j]);
    end;
   if ok=true then continue;
   if tt1=0 then tt1:=uoc[i];
   if res<min(tt,tt1) then res:=min(tt,tt1);
  end;
 writeln(Res);
end;
begin
 assign(input,'vo17lan.inp');reset(input);
 assign(output,'vo17lan.out');rewrite(output);
 read(t);
 for h:=1 to t do
  begin
   nhap;
   xuli;
  end;
 close(input); close(output);
end.