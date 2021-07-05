uses math;
type arr=array[0..1000] of longint;
var n,q,dem1:longint;
    pp:array[0..100] of char;
    sl:array[0..100] of longint;
    gt:array[0..100] of int64;
    a,b,x:array[0..1000,0..1000] of longint;
    free,pack:array[0..9] of boolean;
    tt:array[0..9,0..9] of boolean;
procedure nhap;
var i,j:longint;
begin
 readln(n,q);
 for i:=1 to q do
  begin
   read(pp[i]);
   read(gt[i]);
   read(sl[i]);
   for j:=1 to sl[i] do
    begin
     read(a[i,j],b[i,j]);
     tt[a[i,j],b[i,j]]:=true;
    end;
   readln;
  end;
 for i:=1 to n do
  for j:=1 to n do
   if tt[i,j]=false then
    begin
     inc(dem1);
     sl[q+1]:=dem1;
     a[q+1,dem1]:=i;
     b[q+1,dem1]:=j;
    end;
end;
procedure doicho(var x,y:longint);
var tg:longint;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure doicho1(var x,y:arr);
var tg:arr;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure doicho2(var x,y:int64);
var tg:int64;
begin
 tg:=x;
 x:=y;
 y:=tg;
end;
procedure qsort(l,r:longint);
var i,j,key,mid1,mid2:longint;
    mid,tg:char;
begin
 i:=l;
 j:=r;
 key:=l+random(r-l+1);
 mid:=pp[key];
 mid1:=sl[key];
 mid2:=gt[key];
 repeat
  while (pp[i]>mid) or ((pp[i]=mid) and (sl[i]<mid1)) or ((pp[i]=mid) and ((sl[i]=mid1) and (gt[i]<mid2))) do inc(i);
  while (pp[j]<mid) or ((pp[j]=mid) and (sl[j]>mid1)) or ((pp[j]=mid) and ((sl[j]=mid1) and (gt[j]>mid2))) do dec(j);
  if i<=j then
   begin
    tg:=pp[i];
    pp[i]:=pp[j];
    pp[j]:=tg;
    doicho(sl[i],sl[j]);
    doicho2(gt[i],gt[j]);
    doicho1(a[i],a[j]);
    doicho1(b[i],b[j]);
    inc(i);
    dec(j);
   end;
 until i>j;
 if i<r then qsort(i,r);
 if l<j then qsort(l,j);
end;
procedure print;
var i,j:longint;
begin
 for i:=1 to n do
 begin
  for j:=1 to n do write(x[i,j],' ');
  writeln;
 end;
end;
procedure duyet1(i:longint);
var k,dem,k1,k2,tungduong:longint;
begin
 if i=dem1+1 then
  begin
   print;
   halt;
  end
 else
  begin
   dem:=0;
   fillchar(free,sizeof(free),true);
   for k:=1 to n do
    begin
     free[x[a[q+1,i],k]]:=false;
     free[x[k,b[q+1,i]]]:=false;
    end;
   for k:=1 to n do
    if free[k]=false then inc(Dem);
   if dem=n then exit;
   k2:=n div 2+1; k1:=n div 2;
   tungduong:=0;
   while (k2>1) or (k1<n) do
   begin
    inc(tungduong);
    dem:=0;
    fillchar(free,sizeof(free),true);
    for k:=1 to n do
     begin
      free[x[a[q+1,i],k]]:=false;
      free[x[k,b[q+1,i]]]:=false;
     end;
    for k:=1 to n do
     if free[k]=false then inc(Dem);
    if dem=n then exit;
    if tungduong mod 2=0 then
     begin
      inc(k1);
      k:=k1;
     end
    else
     begin
      dec(k2);
      k:=k2;
     end;
    if free[k] then
     begin
      x[a[q+1,i],b[q+1,i]]:=k;
      duyet1(i+1);
      x[a[q+1,i],b[q+1,i]]:=0;
     end;
   end;
  end;
end;
procedure duyet(i,j:longint;hailong:int64);
var k,tungduong,minn,maxx,dem,k1,k2:longint;
begin
 if i=q+1 then duyet1(1)
 else if j=sl[i]+1 then
  begin
   if hailong<>gt[i] then exit;
   if pp[i+1]='+' then duyet(i+1,1,0)
   else duyet(i+1,1,1);
  end
 else
  begin
   dem:=0;
   fillchar(free,sizeof(free),true);
   for k:=1 to n do
    begin
     free[x[a[i,j],k]]:=false;
     free[x[k,b[i,j]]]:=false;
    end;
   if pp[i]='X' then
   for k:=1 to n do
    if gt[i] mod k=1 then free[k]:=false;
   for k:=1 to n do
    if free[k]=false then inc(Dem);
   if dem=n then exit;
   minn:=1; maxx:=n;
   tungduong:=0;
   k2:=n div 2+1; k1:=n div 2;
   while (k2>1) or (k1<n) do
   begin
    inc(tungduong);
    dem:=0;
    fillchar(free,sizeof(free),true);
    for k:=1 to n do
     begin
      free[x[a[i,j],k]]:=false;
      free[x[k,b[i,j]]]:=false;
     end;
    if pp[i]='X' then
    for k:=1 to n do
     if gt[i] mod k=1 then free[k]:=false;
    for k:=1 to n do
     if free[k]=false then inc(Dem);
    if dem=n then exit;
    if tungduong mod 2=0 then
     begin
      inc(k1);
      k:=k1;
     end
    else
     begin
      dec(k2);
      k:=k2;
     end;
    if free[k] then
     begin
      if pp[i]='X' then
       begin
        if (hailong*(minn**(sl[i]-j+1))<=gt[i]) and (hailong*(maxx**(sl[i]-j+1))>=gt[i]) then
         begin
          x[a[i,j],b[i,j]]:=k;
          duyet(i,j+1,hailong*k);
          x[a[i,j],b[i,j]]:=0;
         end
        else exit;
       end
      else
       begin
        if (hailong+minn*(sl[i]-j+1)<=gt[i]) and (hailong+maxx*(sl[i]-j+1)>=gt[i]) then
         begin
          x[a[i,j],b[i,j]]:=k;
          duyet(i,j+1,hailong+k);
          x[a[i,j],b[i,j]]:=0;
         end
        else exit;
       end;
     end;
   end;


  end;
end;
procedure xuli;
begin
 qsort(1,q);
 if pp[1]='X' then duyet(1,1,1) else duyet(1,1,0);
end;
begin
 assign(input,'soduku.inp');reset(input);
 assign(output,'soduku.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
