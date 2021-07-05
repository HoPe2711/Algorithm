uses math;
var n,res,dem:longint;
    f,b,r,tt:array[0..500000] of longint;
    queu:array[1..4,0..1000000] of longint;
procedure nhap;
var i,a,j:longint; x,p:char;
begin
 readln(n);
 for i:=1 to 4 do f[i]:=1;
 for i:=1 to n do
  begin
   read(x);
   if x='E' then
    begin
     readln(p,a,b[i]);
     if tt[a]=0 then
      begin
       inc(dem);
       tt[a]:=dem;
      end;
     inc(r[a]);
     queu[a,r[a]]:=i;
    end
   else
    begin
     readln;
     for j:=1 to 4 do
      if tt[j]=1 then res:=j;
     writeln(res,' ',b[queu[res,f[res]]]);
     inc(f[res]);
     if f[res]>r[res] then
      begin
       for j:=1 to 4 do
        if tt[j]<>0 then
        if j<>res then dec(tt[j]);
       tt[res]:=0;
       dec(dem);
      end;
    end;
  end;
end;
begin
 assign(input,'school.inp');reset(input);
 assign(output,'school.out');rewrite(output);
 nhap;
 close(input); close(output);
end.
