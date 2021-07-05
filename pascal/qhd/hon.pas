uses math;
var n,k,dem:longint;
    res:int64;
    d:array[0..200,0..200,0..200,0..1] of int64;
    a:array[0..200,00..200] of longint;
procedure nhap;
var i,j:longint;
begin
 read(n,k);          dem:=n;
 for i:=1 to n do
 begin
  for j:=1 to dem do read(a[i,j]);
  inc(dem);
 end;
 dem:=dem-2;
 for i:=n+1 to 2*n-1 do
  begin
   for j:=1 to dem do read(a[i,j]);
   dec(Dem);
  end;
end;                              //max(max(d[i-1,j1,j,0],d[i-1,j1,j+1,0]),max(d[i-1,j1+1,j,0],d[i-1,j1+1,j+1,0]))
function check(i,j1,j,t:longint):int64;
var kq:int64;
begin
 kq:=max(d[i-1,j1,j,t],d[i-1,j1-1,j-1,t]);
 if (j1<>j-1) or (j=1) then kq:=max(kq,d[i-1,j1,j-1,t]);
 if (j1-1<>j) or (j1=1) then kq:=max(kq,d[i-1,j1-1,j,t]);
 exit(kq);
end;
function check1(i,j1,j,t:longint):int64;
var kq:int64;
begin
 kq:=max(d[i-1,j1,j,t],d[i-1,j1+1,j+1,t]);
 if (j1<>j+1) or (j=dem) then kq:=max(kq,d[i-1,j1,j+1,t]);
 if (j1+1<>j) or (j1=dem) then kq:=max(kq,d[i-1,j1+1,j,t]);
 exit(kq);
end;
procedure xuli;
var i,j,j1,h,hh:longint;  tt,tt1:int64;
begin
 if k=2 then
  begin

   dem:=n;
   for i:=1 to n do
     begin
      for h:=0 to 1 do
      if h=1 then
       for j:=1 to dem-1 do
        for j1:=j+1 to dem do d[i,j1,j,1]:=max(d[i,j1,j,1],check(i,j1,j,1)+a[i,j]+a[i,j1])
      else
       begin
        for j:=1 to dem-1 do
         for j1:=j+1 to dem do d[i,j1,j,0]:=max(d[i,j1,j,0],check(i,j1,j,0)+a[i,j]+a[i,j1]);
         tt:=0; tt1:=0;
        for j:=1 to dem do
        if tt<a[i,j] then
         begin
          tt:=max(tt,a[i,j]);
          hh:=j;
         end;
        for j:=1 to dem do if j<>hh then tt1:=max(tt1,a[i,j]);
        for j:=1 to dem-1 do
         for j1:=j+1 to dem do
         begin
          if ((a[i,j]=tt) and (a[i,j1]=tt1)) or ((a[i,j]=tt1) and (a[i,j1]=tt))  then continue;
          if (a[i,j]<>tt) and (a[i,j1]<>tt) then d[i,j1,j,1]:=max(d[i,j1,j,1],check(i,j1,j,0)+max(a[i,j],a[i,j1])+tt)
          else if (a[i,j]=tt) or (a[i,j1]=tt) then d[i,j1,j,1]:=max(d[i,j1,j,1],check(i,j1,j,0)+tt1+tt);
         end;
       end;
      inc(dem);
     end;
   dem:=dem-2;
   for i:=n+1 to 2*n-1 do
    begin
     for h:=0 to 1 do
     if h=1 then
     for j:=1 to dem-1 do
       for j1:=j+1 to dem do d[i,j1,j,1]:=max(d[i,j1,j,1],check1(i,j1,j,1)+a[i,j]+a[i,j1])
     else
     begin
     tt:=0; tt1:=0;
     for j:=1 to dem-1 do
       for j1:=j+1 to dem do d[i,j1,j,0]:=max(d[i,j1,j,1],check1(i,j1,j,0)+a[i,j]+a[i,j1]);
      for j:=1 to dem do
        if tt<a[i,j] then
         begin
          tt:=max(tt,a[i,j]);
          hh:=j;
         end;
        for j:=1 to dem do if j<>hh then tt1:=max(tt1,a[i,j]);
        for j:=1 to dem-1 do
         for j1:=j+1 to dem do
         begin
          if ((a[i,j]=tt) and (a[i,j1]=tt1)) or ((a[i,j]=tt1) and (a[i,j1]=tt))  then continue;
          if (a[i,j]<>tt) and (a[i,j1]<>tt) then d[i,j1,j,1]:=max(d[i,j1,j,1],check1(i,j1,j,0)+max(a[i,j],a[i,j1])+tt)
          else if (a[i,j]=tt) or (a[i,j1]=tt) then d[i,j1,j,1]:=max(d[i,j1,j,1],check1(i,j1,j,0)+tt1+tt);
         end;
      end;
     dec(dem);
    end;
  end


 else

  begin
   dem:=n;
   for i:=1 to n do
     begin
      for h:=0 to 1 do
      if h=1 then
       for j:=1 to dem do d[i,0,j,1]:=max(d[i,0,j,1],max(d[i-1,0,j,1],d[i-1,0,j-1,1])+a[i,j])
      else
       begin
        tt:=0;
        for j:=1 to dem do
         begin
          d[i,0,j,0]:=max(d[i,0,j,0],max(d[i-1,0,j,0],d[i-1,0,j-1,0])+a[i,j]);
          tt:=max(a[i,j],tt);
         end;
        for j:=1 to dem do
         if a[i,j]<>tt then d[i,0,j,1]:=max(d[i,0,j,1],max(d[i,0,j,1],max(d[i-1,0,j,0],d[i-1,0,j-1,0])+tt));
       end;
      inc(dem);
     end;
   dem:=dem-2;
   for i:=n+1 to 2*n-1 do
    begin
     for h:=0 to 1 do
      if h=1 then
       for j:=1 to dem do d[i,0,j,1]:=max(d[i,0,j,1],max(d[i-1,0,j,1],d[i-1,0,j+1,1])+a[i,j])
      else
       begin
        tt:=0;
        for j:=1 to dem do
         begin
          d[i,0,j,0]:=max(d[i-1,0,j,0],d[i-1,0,j+1,0])+a[i,j];
          tt:=max(a[i,j],tt);
         end;
        for j:=1 to dem do
         if a[i,j]<>tt then d[i,0,j,1]:=max(d[i,0,j,1],max(d[i-1,0,j,0],d[i-1,0,j+1,0])+tt);
       end;
     dec(dem);
    end;
  end;


 if k=2 then
  begin
   for i:=1 to n-1 do
    for j:=i+1 to n do
     for h:=0 to 1 do res:=max(res,d[2*n-1,j,i,h]);
   write(Res);
  end
 else
  begin
   for i:=1 to n do
    for h:=0 to 1 do res:=max(res,d[2*n-1,0,i,h]);
   write(res);
  end;
end;
begin
 assign(input,'hon.inp');reset(input);
 assign(output,'hon.out');rewrite(output);
 nhap;
 xuli;
 close(input); close(output);
end.
