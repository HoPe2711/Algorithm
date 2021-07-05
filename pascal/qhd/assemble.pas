{$H+}
uses math;
const oo=100000000;
var  k:longint;
     a:array['a'..'z','a'..'z'] of longint;
     b:array['a'..'z','a'..'z'] of char;
     tt:array[1..26] of char;
     st:array[1..10] of string;
     dd:array[0..200,0..200,'a'..'z'] of boolean;
     f:array[0..200,0..200,'a'..'z'] of longint;
function check(j:longint;st:string):boolean;
var i:longint;
begin
 for i:=0 to 9 do
  if ord(st[j])-48=i then exit(true);
 exit(false);
end;
function check1(j:longint;st:string):boolean;
begin
 if st[j]='-' then exit(true);
 exit(false);
end;
function check2(j:longint;st:string):boolean;
var i:char;
begin
 for i:='a' to 'z' do
 if st[j]=i then exit(true);
 exit(false);
end;
procedure nhap;
var i,j,j1,j2,y,jj,y1:longint;
    st1,st2:string;
begin
 readln(k);
 readln(st2);
 j1:=0;
 for i:=1 to length(st2) do
  if i mod 2=1 then
   begin
    inc(j1);
    tt[j1]:=st2[i];
   end;
 for i:=1 to k do
 begin
    y:=0;
    j1:=0;  j2:=0;
    readln(st1);
    for j:=1 to length(st1) do
     begin
       if check(j,st1) then inc(y);
       if check1(j,st1) then
        begin
         inc(j1);
         jj:=j-1;
         y1:=1;
         while y1<=y do
          begin
           a[tt[i],tt[j1]]:=a[tt[i],tt[j1]]+(ord(st1[jj])-48)*10**(y1-1);
           dec(jj);
           inc(y1);
          end;
         y:=0;
        end;
       if check2(j,st1) then
        begin
         inc(j2);
         b[tt[i],tt[j2]]:=st1[j];
        end;
     end;
   { j1:=0; j2:=0;
    for j:=1 to length(st1) do
    if j mod 4=1 then
     begin
      inc(j1);
      a[tt[i],tt[j1]]:=ord(st1[j])-48;
     end;
    for j:=1 to length(st1) do
     if j mod 4=3 then
      begin
       inc(j2);
       b[tt[i],tt[j2]]:=st1[j];
      end;     }
 end;
end;
function tinh(t,i,j:longint;c:char):longint;
var k1,c1,c2,best:longint;
begin
 if i=j then
 begin
  if c=st[t][i] then exit(0) else exit(oo);
 end;
 if dd[i,j,c] then exit(f[i,j,c]);
 dd[i,j,c]:=true;
 best:=oo;
 for k1:=i to j-1 do
  for c1:=1 to k do
  //if f[i,k1,tt[c1]]<>oo then
   for c2:=1 to k do
    if b[tt[c1],tt[c2]]=c then best:=min(best,tinh(t,i,k1,tt[c1])+tinh(t,k1+1,j,tt[c2])+a[tt[c1],tt[c2]]);
 f[i,j,c]:=best;
 exit(best);
end;
procedure xuli;
var i,n,j,res:longint;
ch: char;
begin
 readln(n);
 for i:=1 to n do
  begin
   fillchar(dd,sizeof(dd),false);
   readln(st[i]);
   res:=oo;
   for ch:='a' to 'z' do
    begin
     res:=min(res,tinh(i,1,length(st[i]),ch));
    end;
   writeln(res);
  end;
end;
begin
 //assign(input,'as.inp');reset(input);
 //assign(output,'as.out');rewrite(output);
 nhap;
 xuli;
 //close(input);close(output);
end.
