{$H+}
var st,res,res1:string;
    n,dem:longint;
procedure nhap;
var i:longint;
begin
 readln(n);
 readln(st);
 res:='';
 for i:=length(st) downto 1 do
  begin
   inc(dem);
   insert(st[i],res,dem div 2+1);
  end;
 for i:=length(res) downto 1 do res1:=res1+res[i];
 write(res1);
end;
begin
 //assign(input,'b746.inp');reset(input);
 nhap;
// close(input);
end.