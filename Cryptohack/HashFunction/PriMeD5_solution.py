from Crypto.Util.number import isPrime, bytes_to_long, long_to_bytes
import hashlib
import socket 
import json
# dùng md5collgen để tạo ra hai string khác nhau nhưng cùng hash.
x = "4dc968ff0ee35c209572d4777b721587d36fa7b21bdc56b74a3dc0783e7b9518afbfa200a8284bf36e8e4b55b35f427593d849676da0d1555d8360fb5f07fea2"
y = "4dc968ff0ee35c209572d4777b721587d36fa7b21bdc56b74a3dc0783e7b9518afbfa202a8284bf36e8e4b55b35f427593d849676da0d1d55d8360fb5f07fea2"

print("x : ", bytes_to_long(bytes.fromhex(x)))

print("md5(x) : ", hashlib.md5(bytes.fromhex(x)).hexdigest())
print("md5(y) : ", hashlib.md5(bytes.fromhex(y)).hexdigest())

z = 1

xx = 0
yy = 0

while True:
    # append 1s till prime
    xx = bytes_to_long(bytes.fromhex(x) + long_to_bytes(z))
    yy = bytes_to_long(bytes.fromhex(y) + long_to_bytes(z))
    if isPrime(xx) and not isPrime(yy):
        break
    z += 2

print("x+z :", xx)
print("y+z :", yy)

print("md5(x+z) : ", hashlib.md5(long_to_bytes(xx)).hexdigest())
print("md5(y+z) : ", hashlib.md5(long_to_bytes(yy)).hexdigest())


#SOLVING
# lấy hai prime xx và yy vừa tìm được để tạo sign và check sign
HOST = "socket.cryptohack.org" 
PORT = 13392
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client_socket.connect((HOST, PORT))
recv = (client_socket.recv(1024).decode("utf-8"))

prime1 = {"option" : "sign", "prime" : xx}

client_socket.send(json.dumps(prime1).encode())
sign = json.loads(client_socket.recv(1024).decode("utf-8"))["signature"]
prime2 = {
    "option": "check",
    "prime" : yy,
    "signature" : sign,
    "a" : "71"
}

client_socket.send(json.dumps(prime2).encode())
recv = client_socket.recv(2048).decode("utf-8")
print(json.loads(recv)["msg"])
