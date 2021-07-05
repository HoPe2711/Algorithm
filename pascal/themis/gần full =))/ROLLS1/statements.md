Bạn được nông dân John giao cho nhiệm vụ lùa bò vào chuồng! Để tiện lợi cho việc
lùa bò, bạn được nông dân John cho phép mở 1 số cổng dịch chuyển tức thời. Ta có
thể coi bãi cỏ của nông dân John là một trục tọa độ 1 chiều với $N$ chú bò nằm
trên 1 số tọa độ nguyên, có thể có nhiều chú bò ở cùng một tọa độ. Mỗi chú bò chỉ
cần đi qua cổng dịch chuyển bất kì là có thể trở về chuồng của mình.

Bạn được phép đặt số lượng **vô hạn** các cổng dịch chuyển, với khoảng cách
cách nhau **chính xác** $M$. Các cổng phải được đặt trên các tọa độ nguyên.

Các chú bò sẽ chọn cổng gần nhất có tọa độ **lớn hơn hoặc bằng** tọa độ hiện
tại của chúng. Hãy tìm cách đặt cổng để tổng khoảng cách di chuyển của các chú bò
là ít nhất.

### Input
 - Dòng đầu tiên ghi 2 số $N$ và $M$.
 - Dòng tiếp theo ghi $N$ số nguyên $A_i$ là tọa độ của các chú bò.

### Output
 - Một số duy nhất là tổng khoảng cách di chuyển nhỏ nhất.

### Constraints
 - Trong tất cả các subtask
  - $1 \le N \le 100000$
  - $1 \le M \le 10^9$
  - $0 \le |A_i| \le 10^9$
 - Subtask 1 (20đ)
  - $1 \le N \le 100$
  - $1 \le M \le 10^5$
 - Subtask 2 (30đ)
  - $1 \le N \le 10^5$
  - $1 \le M \le 10^5$
 - Subtask 3 (50đ)
  - Không có giới hạn gì thêm.

### Examples

#### Input
```
5 4
3 6 7 9 11
```

#### Output
```
3
```