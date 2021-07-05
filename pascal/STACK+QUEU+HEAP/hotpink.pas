uses math;
var res,res1,n,maxx1,maxx2,top:longint;
    a,b,c,d,dai,rong,l,r,stack,h,free,trace,sum:array[0..200000] of longint;
    t:Array[0..2000,0..2000] of longint;
procedure nhap;
var i:longint; x,y:char;
begin
 readln(n);
 for i:=1 to n do
  begin
   readln(a[i],b[i],y,x);
   if x='H' then c[i]:=1;
  end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var  i,j,mid:longint;
begin
 i:=l; j:=r;
 mid:=a[l+random(r-l+1)];
 repeat
  while a[i]<mid do inc(i);
  while a[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    doicho(c[i],c[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure qsort1(l,r:longint);
var  i,j,mid:longint;
begin
 i:=l; j:=r;
 mid:=b[l+random(r-l+1)];
 repeat
  while b[i]<mid do inc(i);
  while b[j]>mid do dec(j);
  if i<=j then
   begin
    doicho(a[i],a[j]);
    doicho(b[i],b[j]);
    doicho(c[i],c[j]);
    inc(i); dec(j);
   end;
 until i>j;
 if i<r then qsort1(i,r);
 if l<j then qsort1(l,j);
end;
procedure setup;
var i,limit:longint;
begin
 qsort(1,n);
 limit:=1; d[1]:=1;
 for i:=2 to n do
 begin
  if a[i]<>a[i-1] then
   begin
    inc(limit); dai[limit]:=dai[limit-1]+a[i]-a[i-1];
   end;
  d[i]:=limit;
 end;
 maxx1:=limit;
 a:=d;
 qsort1(1,n);
 limit:=1; d[1]:=1;
 for i:=2 to n do
  begin
   if b[i]<>b[i-1] then
    begin
     inc(limit); rong[limit]:=rong[limit-1]+b[i]-b[i-1];
    end;
   d[i]:=limit;
  end;
 b:=d;
 maxx2:=limit;
end;
procedure timl;
var  i,j,last,ans:longint;
begin
 top:=0;
 stack[top]:=0;
 last:=1;
 for i:=1 to maxx2 do trace[i]:=0;
 for i:=1 to maxx2 do
  if free[i]<>0 then
    begin
     for j:=last to i do trace[j]:=i;
     last:=i+1;
    end;
 for i:=1 to maxx2 do
  begin
   while (top>0) and (h[i]<=h[stack[top]]) do dec(top);
   ans:=trace[stack[top]+1];
   l[i]:=ans;
   inc(top);
   stack[top]:=i;
  end;
end;
procedure timr;
var  i,j,last,ans:longint;
begin
 top:=0;
 stack[top]:=maxx2+1;
 for i:=1 to maxx2 do trace[i]:=0;
 last:=maxx2;
 for i:=maxx2 downto 1 do
  if free[i]<>0 then
    begin
     for j:=last downto i do trace[j]:=i;
     last:=i-1;
    end;
 for i:= maxx2  downto 1 do
  begin
   while (top>0) and (h[i]<=h[stack[top]]) do dec(top);
   ans:=trace[stack[top]-1];
   r[i]:=ans;
   inc(top);
   stack[top]:=i;
  end;
end;
procedure xuli;
var i,cd,cr,ans,j,tmp,k:longint;
begin
 for i:=1 to n do
  if c[i]=1 then t[a[i],b[i]]:=1 else t[a[i],b[i]]:=-1;
 for i:=1 to maxx1 do
  begin
    for j:=1 to maxx2 do
     begin
      free[j]:=0; h[j]:=0;
     end;
    for j:=i to maxx1 do
     begin
      for k:=1 to maxx2 do sum[k]:=0;
      for k:=1 to maxx2 do
       if t[j,k]<>-1 then
        begin
         inc(h[k]); free[k]:=free[k]+t[j,k]; sum[k]:=sum[k-1]+free[k];
        end
       else
        begin
         h[k]:=0; free[k]:=0; sum[k]:=sum[k-1];
        end;
       timl; timr;
       for k:=1 to maxx2 do
        if (h[k]=j-i+1) and (l[k]<>0) and (r[k]<>0) then
         begin
          ans:=sum[r[k]]-sum[l[k]-1];
          cd:=dai[j]-dai[i]; cr:=rong[r[k]]-rong[l[k]];
          tmp:=cd*cr;
          if res<ans then
           begin
            res:=ans;
            res1:=tmp;
           end
          else if res=ans then res1:=min(res1,tmp);
         end;
     end;
  end;
 writeln(res);
 write(res1);
end;
begin
 assign(input,'hotpink.inp');reset(input);
 assign(output,'hotpink.out');rewrite(output);
 nhap;
 setup;
 xuli;
 close(input); close(output);
end.
