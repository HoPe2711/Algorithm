{$H+}
var st,s,kk,pp,pp1:string;
    l1,l,n,tungduong:longint;
    res:int64;
    next:array[0..300000] of longint;
    tt:array[0..300000] of int64;
    last,first:array[0..300000] of string;
procedure doicho(var x,y:string);
var tg:string;
begin
 tG:=x;
 x:=y;
 y:=tg;
end;
procedure pack(s:String);
var i,j:longint;
begin
 j:=0;
 next[1]:=0;
 for i:=2 to l1 do
  begin
   while (j>0) and (s[j+1]<>s[i]) do j:=next[j];
   if s[j+1]=s[i] then
    begin
     next[i]:=j+1;
     inc(j);
    end
   else next[i]:=0;
  end;
end;
procedure find(s,st:string);
var i,j:longint;
begin
 j:=0;
 for i:=1 to l do
  begin
   while (j<>0) and (st[i]<>s[j+1]) do j:=next[j];
   if st[i]=s[j+1] then inc(j);
   if j=l1 then
    begin
     inc(res);
     j:=next[j];
    end;
  end;
end;
procedure xuli(st:string);
begin
 l:=length(st);
 find(s,st);
end;
procedure nhap;
var i:longint;
begin
 fillchar(next,sizeof(next),0);
 readln(n);
 readln(s);
 l1:=length(s);
 pack(s);
 res:=0;
 st:='0'; xuli(st); tt[0]:=res;
 res:=0;
 st:='1'; xuli(st); tt[1]:=res;
 if l1>1 then
  begin
   last[0]:='0';
   first[0]:='0';
   last[1]:='1';
   first[1]:='1';
  end;
 pp:='0'; pp1:='1';
 for i:=2 to n do
  begin
   res:=0;
   st:=last[i-1]+first[i-2];
   xuli(st);
   tt[i]:=tt[i-1]+tt[i-2]+res;
   first[i]:=first[i-1];
   last[i]:=last[i-2];
   kk:=pp1+pp;
   if length(kk)<=l1-1 then
    begin
     pp:=pp1;
     pp1:=kk;
     first[i]:=kk;
     last[i]:=kk;
    end;
  end;
 write('Case ');
 write(tungduong,':',' ');
 writeln(tt[n]);
end;
begin
 assign(input,'fibwords.inp');reset(input);
 assign(output,'fibwords.out');rewrite(output);
 while not seekeof do
  begin
   inc(tungduong);
   nhap;
  end;
 close(input); close(output);
end.
