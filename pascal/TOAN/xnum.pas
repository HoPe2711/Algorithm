{$H+}
var n,k,dem,res,p,p1:longint;
    y,y1:string;
    d:array['0'..'9'] of longint;
    free:array[0..999999] of boolean;
function check(s,s1:string;q:longint):boolean;
var i:longint; j:char;  st:string;
begin
 fillchar(d,sizeof(d),0);
 for i:=1 to length(s) do inc(d[s[i]]);
 for i:=1 to length(s1) do inc(d[s1[i]]);
 val(s,p);
 val(s1,p1);
 res:=p*p1;
 str(res,st);
 if free[res] then exit(false);
 if length(st)<>q then exit(false);
 for i:=1 to length(st) do dec(d[st[i]]);
 for j:='0' to '9' do
  if d[j]<>0 then exit(false);
 exit(true);
end;
procedure writest(s,s1,st:longint);
var o,i3:longint;
begin
   write(st);
   write(y);
   write('=');
   write(s1);
   write(y1);
   write('*');
   write(s);
   write(y1);
   writeln;
end;
procedure xuli;
var i,i1,i2,j,j1,j2:char;
    i3,o:longint;
    s,s1,st:string;
begin
 for i:='0' to '9' do
  for i1:='0' to '9' do
   for i2:='0' to '9' do
    for j:='0' to '9' do
     for j1:='0' to '9' do
      for j2:='0' to '9' do
       begin
        s:=i+i1+i2;
        s1:=j+j1+j2;
        if check(s,s1,6) then
         begin
          writest(p,p1,res);
          free[res]:=true;
          inc(Dem);
          if dem=k then exit;
         end;
       end;
end;
procedure nhap;
var i,i1,j,j1:char;   o:longint;
    s,s1,st:string;
begin
 read(n,k);
 dem:=0;
 for o:=1 to 2*n-6 do y:=y+'0';
 for o:=1 to n-3 do y1:=y1+'0';
 if n>=3 then xuli;
 if n=2 then
  begin
   for i:='0' to '9' do
    for i1:='0' to '9' do
     for j:='0' to '9' do
      for j1:='0' to '9' do
       begin
        s:=i+i1;
        s1:=j+j1;
        if check(s,s1,4) then
         begin
           str(res,st);
           writest(p,p1,res);
           free[res]:=true;
           inc(Dem);
           if dem=k then exit;
         end;
       end;
  end;

end;
begin
 //assign(input,'xnum.inp'); reset(input);
// assign(output,'xnum.out');rewrite(output);
 nhap;
// close(input); close(output);
end.
