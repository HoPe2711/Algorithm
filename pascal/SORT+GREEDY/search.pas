uses math;
var m,n,p,last,res,dem1:longint;
    a,b,c,dd:array[0..100001] of longint;
    free1,free:Array[0..100001] of boolean;
procedure nhap;
var i,j,x,qq:longint;   ok:boolean;
begin
 read(m,n,p);
 for i:=1 to m do
  begin
   read(x);
   if free[x]=false then
    begin
     inc(dem1);
     a[dem1]:=x;
     free[x]:=true;
    end;
  end;
 for i:=1 to n do
  begin
   read(b[i]);
   free1[b[i]]:=true;
  end;
 c[p+1]:=b[1];
 for i:=1 to p do read(c[i]);
 for i:=1 to p+1 do
    if (free1[c[i]]=true)  then
     begin
      ok:=false;    qq:=0;
      if i-last-1>=dem1 then
      begin
       for j:=last+1 to i-1 do dd[c[j]]:=0;
       for j:=last+1 to i-1 do
        if free[c[j]] then
         begin
          inc(dd[c[j]]);
          if dd[c[j]]=1 then inc(qq);
         end;
       if qq=dem1 then res:=max(res,i-last-1);
      end;
      last:=i;
     end;
 write(res);
end;
begin
 //assign(input,'search.inp');reset(input);
 nhap;
 //close(input);
end.
