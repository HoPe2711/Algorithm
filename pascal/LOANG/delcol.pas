uses math;
var n,f,r,res:longint;
    a:array[0..3,0..100000] of longint;
    next,tt:array[0..100000,0..3] of longint;
    queu,head:Array[0..500000] of longint;
    free,dd:Array[0..200000] of boolean;
procedure nhap;
var i,j:longint;
begin
 read(n);
 for i:=1 to 3 do
  for j:=1 to n do read(a[i,j]);
end;
procedure push(i:longint);
begin
 inc(R);
 queu[r]:=i;
end;
function pop:longint;
begin
 pop:=queu[f];
 inc(f);
end;
procedure build;
var i,j:longint;
begin
 for i:=1 to n do
  for j:=1 to 3 do
  begin
   if head[a[j,i]]<>i then next[i,j]:=head[a[j,i]];
   head[a[j,i]]:=i;
  end;
 for j:=1 to 3 do
  for i:=1 to n do inc(tt[a[j,i],j]);
end;

procedure xuli;
var i,j,u,pos:longint;
begin
 f:=1; r:=0;
 for i:=1 to n do
   for j:=1 to 3 do
    if (tt[i,j]=0) and (dd[i]=false) then
     begin
      push(i);  dd[i]:=true;
     end;
 while f<=r do
  begin
   u:=pop;
   j:=head[u];
   while j<>0 do
    begin
     if free[j]=false then
      begin
       for i:=1 to 3 do
       begin
        dec(tt[a[i,j],i]);
        if (tt[a[i,j],i]=0) and (dd[a[i,j]]=false) then
         begin
          push(a[i,j]);
          dd[a[i,j]]:=true;
         end;
       end;
       inc(res);
       free[j]:=true;
      end;
     for i:=3 downto 1 do if a[i,j]=u then pos:=i;
     j:=next[j,pos];
    end;
  end;
 write(Res);
end;
begin
 assign(input,'delcol.inp');reset(input);
 assign(output,'delcol.out');rewrite(output);
 nhap;
 build;
 xuli;
 close(input); close(output);
end.
{procedure inkq;
var i,j,dem,k:longint;
begin
 k:=0;
 fillchar(free,sizeof(free),0);
 dem:=0;
 for i:=1 to n do
  if x[i]=1 then
  begin
   inc(dem);
   for j:=1 to 3 do inc(free[a[j,i]]);
  end;
 for i:=1 to n do
  if free[i]=3 then inc(k);
 if k=dem then res:=min(res,n-k);
end;
procedure duyet(i:longint);
var j:longint;
begin
 if i=n+1 then inkq
 else
  for j:=0 to 1 do
   begin
    x[i]:=j;
    duyet(i+1);
   end;                             }
end;
