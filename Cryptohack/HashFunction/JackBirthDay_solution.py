import math
# tính tập k để có p xác suất xảy ra đụng độ
# k(p,n)≈2∗n∗ln(11−p)−−−−−−−−−−−−√
def find_k(p, n):
    temp = 2*n * math.log(1/(1-p))
    return (math.sqrt(temp))

# Chọn k giá trị ngẫu nhiên từ tập n giá trị khác nhau, xác suất để có ít nhất 2 giá trị trùng nhau là P(n, k): 
def cal_p(k, n):
    p = 1
    for i in range(1, k): #1 -> n-1
        p*=(1-i/n)
    return 1 - p
# tìm k để xác suất là 50% đụng độ vs hash của 1 secret cho trước
def cal_k(p, n):
    k = math.log(p, (n-1)/n)
    return k
n = 2**128
# print(cal_k(0.5, 2**11))
# print(find_k(0.75, 2048))
print(cal_k(0.9, 1111))


