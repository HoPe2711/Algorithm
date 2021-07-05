{$H+}
var  n,n1:longint;
     res:int64;
     st,st1:String;
     cnt:array['a'..'z',0..100000] of int64;
procedure nhap;
begin
 readln(st);
 readln(st1);
 n:=length(st);
 n1:=length(st1);
end;
procedure xuli;
var i,dem,j:longint;
    st2:string;
begin
 for i:=1 to n-n1+1 do
  begin
   dem:=0;
   st2:=copy(st,i,n1);
   for j:=1 to n1 do
    if st2[j]=st1[j] then inc(dem);
   res:=res+dem;
  end;
 write(res);
end;
procedure xuli2;
var i:longint;
    j1:char;
begin
 for i:=1 to n do
 for j1:='a' to 'z' do
 if st[i]=j1 then cnt[j1,i]:=cnt[j1,i-1]+1
 else cnt[j1,i]:=cnt[j1,i-1];
 for i:=1 to n1 do
   res:=res+(cnt[st1[i],n-n1+i]-cnt[st1[i],i-1]);
 write(res);
end;
begin
 //assign(input,'sayohyeah.inp');reset(input);
 //assign(output,'sayohyeah.out');rewrite(output);
 nhap;
 if (n<=5000) then xuli
 else xuli2;
 //close(input); close(output);
end.
