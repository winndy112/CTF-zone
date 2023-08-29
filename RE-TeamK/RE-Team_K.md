# RE - Team K

## Chall - 1

```c
int __cdecl main(int argc, const char **argv, const char **envp)
{
char v4[256]; // [rsp+20h] [rbp-118h] BYREF
memset(v4, 0, sizeof(v4));
sub_1400013E0("Input : ", argv, envp);
sub_140001440("%256s", v4);
if ( (unsigned int)sub_140001000(v4) )
puts("Correct");
else
puts("Wrong");
return 0;
}
```

Input là một chuối kí tự có độ dài tối đa là 256, hàm memset thiết lập v4 giá trị là 0 hết, hai hàm kế tiếp thì nhận chuỗi đầu vào. Trong hàm main gọi hàm sub_14001000

```c
_BOOL8 __fastcall sub_140001000(_BYTE *a1)
{
  if ( *a1 != 67 )
    return 0i64;
  if ( a1[1] != 111 )
    return 0i64;
  if ( a1[2] != 109 )
    return 0i64;
  if ( a1[3] != 112 )
    return 0i64;
  if ( a1[4] != 97 )
    return 0i64;
  if ( a1[5] != 114 )
    return 0i64;
  if ( a1[6] != 51 )
    return 0i64;
  if ( a1[7] != 95 )
    return 0i64;
  if ( a1[8] != 116 )
    return 0i64;
  if ( a1[9] != 104 )
    return 0i64;
  if ( a1[10] != 101 )
    return 0i64;
  if ( a1[11] != 95 )
    return 0i64;
  if ( a1[12] != 99 )
    return 0i64;
  if ( a1[13] != 104 )
    return 0i64;
  if ( a1[14] != 52 )
    return 0i64;
  if ( a1[15] != 114 )
    return 0i64;
  if ( a1[16] != 97 )
    return 0i64;
  if ( a1[17] != 99 )
    return 0i64;
  if ( a1[18] != 116 )
    return 0i64;
  if ( a1[19] != 51 )
    return 0i64;
  if ( a1[20] == 114 )
    return a1[21] == 0;
  return 0i64;
}
```

```c
#include<stdio.h>

int main() {
    char a1[22];
    a1[0] = 67;
    a1[1] = 111;
    a1[2] = 109;
    a1[3] = 112;
    a1[4] = 97;
    a1[5] = 114;
    a1[6] = 51;
    a1[7] = 95;
    a1[8] = 116;
    a1[9] = 104;
    a1[10] = 101;
    a1[11] = 95;
    a1[12] = 99;
    a1[13] = 104;
    a1[14] = 52;
    a1[15] = 114;
    a1[16] = 97;
    a1[17] = 99;
    a1[18] = 116;
    a1[19] = 51; 
    a1[20] = 114;
    a1[21] = 0;
    printf("Correct: %s \n", a1);
}
```

Output:

```
Correct: Compar3_the_ch4ract3r
```

```bash
$ wine chall1.exe
Input : Compar3_the_ch4ract3r
Correct
```

## Chall - 2

Hàm main vẫn như chall1

```c
__int64 __fastcall sub_140001000(__int64 a1)
{
  int i; // [rsp+0h] [rbp-18h]

  for ( i = 0; (unsigned __int64)i < 0x12; ++i )
  {
    if ( *(_DWORD *)&aC[4 * i] != *(unsigned __int8 *)(a1 + i) )
      return 0i64;
  }
  return 1i64;
}
```

Vòng lặp 0x12 (=18), so sánh giữa các kí tự bắt đầu từ vị trí của aC và a1 (input). 

```c
.data:0000000140003000 aC              db 'C',0                ; DATA XREF: sub_140001000+28↑o
.data:0000000140003002                 align 4
.data:0000000140003004 aO              db 'o',0
.data:0000000140003006                 align 8
.data:0000000140003008 aM              db 'm',0
.data:000000014000300A                 align 4
.data:000000014000300C aP              db 'p',0
.data:000000014000300E                 align 10h
.data:0000000140003010 a4              db '4',0
.data:0000000140003012                 align 4
.data:0000000140003014 aR              db 'r',0
.data:0000000140003016                 align 8
.data:0000000140003018 aE              db 'e',0
.data:000000014000301A                 align 4
.data:000000014000301C                 db '_',0
.data:000000014000301E                 align 20h
.data:0000000140003020 aT              db 't',0
.data:0000000140003022                 align 4
.data:0000000140003024                 db 'h',0
.data:0000000140003026                 align 8
.data:0000000140003028 aE_0            db 'e',0
.data:000000014000302A                 align 4
.data:000000014000302C                 db '_',0
.data:000000014000302E                 align 10h
.data:0000000140003030 aA              db 'a',0
.data:0000000140003032                 align 4
.data:0000000140003034 aR_0            db 'r',0
.data:0000000140003036                 align 8
.data:0000000140003038 aR_1            db 'r',0
.data:000000014000303A                 align 4
.data:000000014000303C a4_0            db '4',0
.data:000000014000303E                 align 20h
.data:0000000140003040 aY              db 'y',0
.data:0000000140003042                 align 10h
```

```bash
$ wine chall2.exe
Input : Comp4re_the_arr4y
Correct
```

## Chall - 3

```c
__int64 __fastcall sub_140001000(__int64 a1)
{
  int i; // [rsp+0h] [rbp-18h]

  for ( i = 0; (unsigned __int64)i < 0x18; ++i )
  {
    if ( byte_140003000[i] != (i ^ *(unsigned __int8 *)(a1 + i)) + 2 * i )
      return 0i64;
  }
  return 1i64;
}
```

```c
data:0000000140003000 byte_140003000  db 49h, 60h, 67h, 74h, 63h, 67h, 42h, 66h, 80h, 78h, 2 dup(69h)
.data:0000000140003000                                         ; DATA XREF: sub_140001000+28↑o
.data:0000000140003000                 db 7Bh, 99h, 6Dh, 88h, 68h, 94h, 9Fh, 8Dh, 4Dh, 0A5h, 9Dh
.data:0000000140003000                 db 45h, 8 dup(0)
```

```c
#include<stdio.h>

int main() {
    char a1[24];
    char bytes[] = "49 60 67 74 63 67 42 66 80 78 69 69 7B 99 6D 88 68 94 9F 8D 4D A5 9D 45";
    int arr[24];
    int index= 0;
    char *ptr;
    ptr = bytes;
    while (*ptr != '\0') {
        arr[index] = strtol(ptr, &ptr, 16);
        index++;
    }
    // a[i]= (bytes[i] - 2*i ) ^i
    for (int i =0; i<24 ; i++) {
        a1[i] = (arr[i] - 2*i) ^ i;
    }
    printf("%s", a1);
}
// output: I_am_X0_xo_Xor_eXcit1ng
```

```bash
$ wine ./chall3.exe
Input : I_am_X0_xo_Xor_eXcit1ng
Correct
```

## Chall - 4

```c
__int64 __fastcall sub_140001000(__int64 a1)
{
  int i; // [rsp+0h] [rbp-18h]

  for ( i = 0; (unsigned __int64)i < 0x1C; ++i )
  {
    if ( ((unsigned __int8)(16 * *(_BYTE *)(a1 + i)) | ((int)*(unsigned __int8 *)(a1 + i) >> 4)) != byte_140003000[i] )
      return 0i64;
  }
  return 1i64;
}
```

```c
.data:0000000140003000 byte_140003000  db 24h, 27h, 13h, 2 dup(0C6h), 13h, 16h, 0E6h, 47h, 0F5h
.data:0000000140003000                                         ; DATA XREF: sub_140001000+50↑o
.data:0000000140003000                 db 26h, 96h, 47h, 0F5h, 46h, 27h, 13h, 2 dup(26h), 0C6h
.data:0000000140003000                 db 56h, 0F5h, 2 dup(0C3h), 0F5h, 2 dup(0E3h), 5 dup(0)
```

```c
#include<stdio.h>

int main() {
    //if ( ((unsigned __int8)(16 * *(_BYTE *)(a1 + i)) | ((int)*(unsigned __int8 *)(a1 + i) >> 4)) != byte_140003000[i] )
    char _byte[] = "24 27 13 C6 C6 13 16 E6 47 F5 26 96 47 F5 46 27 13 26 26 C6 56 F5 C3 C3 F5 E3 E3 00 00 00 00 00";
    int _array[33];
    int index=0;
    int a1[33];
    char *ptr;
    ptr = _byte;
    while (*ptr != '\0') {
        _array[index] = strtol(ptr, &ptr, 16);
        index++;
    }
    //((unsigned char)(16 * a1[i]) | ((int)a1[i] >> 4)) == byte_140003000[i]
    for ( int i = 0; i< 33; i++) {
        a1[i] = (unsigned char)(16 * _array[i]) | ((int)_array[i] >> 4);
    }
    printf("%s", a1);
}
//output: Br1ll1ant_bit_dr1bble_<<_>>
```

```bash
$ wine ./chall4.exe 
Input : Br1ll1ant_bit_dr1bble_<<_>>
Correct
```

## Chall - 5

```c
__int64 __fastcall sub_140001000(__int64 a1)
{
  int i; // [rsp+0h] [rbp-18h]

  for ( i = 0; (unsigned __int64)i < 0x18; ++i )
  {
    if ( *(unsigned __int8 *)(a1 + i + 1) + *(unsigned __int8 *)(a1 + i) != byte_140003000[i] )
      return 0i64;
  }
  return 1i64;
}
```

```
.data:0000000140003000 byte_140003000  db 0ADh, 0D8h, 2 dup(0CBh), 9Dh, 97h, 0CBh, 0C4h, 92h
.data:0000000140003000                                         ; DATA XREF: sub_140001000+48↑o
.data:0000000140003000                 db 0A1h, 0D2h, 0D7h, 0D2h, 0D6h, 0A8h, 0A5h, 0DCh, 0C7h
.data:0000000140003000                 db 0ADh, 0A3h, 0A1h, 98h, 4Ch, 9 dup(0)
```

```c
#include<stdio.h>

int main() {
    int a1[25];
    unsigned char _bytes[]= {0xAD, 0xD8, 0xCB, 0xCB, 0x9D, 0x97, 0xCB, 0xC4, 0x92, 0xA1, 0xD2, 0xD7, 0xD2, 0xD6, 0xA8, 0xA5, 0xDC, 0xC7, 0xAD, 0xA3, 0xA1, 0x98, 0x4C, 0x00};
    a1[24]= 0;
    // byte của của chuỗi bytes = 0, tức là a[24] + a[23] = 0
    for ( int i = 23; i>= 0; i--) {
        a1[i] = _bytes[i] - a1[i+1];
    }
    printf("%s", a1);
}
//output: All_l1fe_3nds_w1th_NULL
```

## Chall - 6

```c
__int64 __fastcall sub_140001000(__int64 a1)
{
  int i; // [rsp+0h] [rbp-18h]

  for ( i = 0; (unsigned __int64)i < 0x12; ++i )
  {
    if ( byte_140003020[*(unsigned __int8 *)(a1 + i)] != byte_140003000[i] )
      return 0i64;
  }
  return 1i64;
}
```

```
.data:0000000140003020 byte_140003020  db 63h, 7Ch, 77h, 7Bh, 0F2h, 6Bh, 6Fh, 0C5h, 30h, 1, 67h
.data:0000000140003020                                         ; DATA XREF: sub_140001000+31↑o
.data:0000000140003020                 db 2Bh, 0FEh, 0D7h, 0ABh, 76h, 0CAh, 82h, 0C9h, 7Dh, 0FAh
.data:0000000140003020                 db 59h, 47h, 0F0h, 0ADh, 0D4h, 0A2h, 0AFh, 9Ch, 0A4h, 72h
.data:0000000140003020                 db 0C0h, 0B7h, 0FDh, 93h, 26h, 36h, 3Fh, 0F7h, 0CCh, 34h
.data:0000000140003020                 db 0A5h, 0E5h, 0F1h, 71h, 0D8h, 31h, 15h, 4, 0C7h, 23h
.data:0000000140003020                 db 0C3h, 18h, 96h, 5, 9Ah, 7, 12h, 80h, 0E2h, 0EBh, 27h
.data:0000000140003020                 db 0B2h, 75h, 9, 83h, 2Ch, 1Ah, 1Bh, 6Eh, 5Ah, 0A0h, 52h
.data:0000000140003020                 db 3Bh, 0D6h, 0B3h, 29h, 0E3h, 2Fh, 84h, 53h, 0D1h, 0
.data:0000000140003020                 db 0EDh, 20h, 0FCh, 0B1h, 5Bh, 6Ah, 0CBh, 0BEh, 39h, 4Ah
.data:0000000140003020                 db 4Ch, 58h, 0CFh, 0D0h, 0EFh, 0AAh, 0FBh, 43h, 4Dh, 33h
.data:0000000140003020                 db 85h, 45h, 0F9h, 2, 7Fh, 50h, 3Ch, 9Fh, 0A8h, 51h, 0A3h
.data:0000000140003020                 db 40h, 8Fh, 92h, 9Dh, 38h, 0F5h, 0BCh, 0B6h, 0DAh, 21h
.data:0000000140003020                 db 10h, 0FFh, 0F3h, 0D2h, 0CDh, 0Ch, 13h, 0ECh, 5Fh, 97h
.data:0000000140003020                 db 44h, 17h, 0C4h, 0A7h, 7Eh, 3Dh, 64h, 5Dh, 19h, 73h
.data:0000000140003020                 db 60h, 81h, 4Fh, 0DCh, 22h, 2Ah, 90h, 88h, 46h, 0EEh
.data:0000000140003020                 db 0B8h, 14h, 0DEh, 5Eh, 0Bh, 0DBh, 0E0h, 32h, 3Ah, 0Ah
.data:0000000140003020                 db 49h, 6, 24h, 5Ch, 0C2h, 0D3h, 0ACh, 62h, 91h, 95h, 0E4h
.data:0000000140003020                 db 79h, 0E7h, 0C8h, 37h, 6Dh, 8Dh, 0D5h, 4Eh, 0A9h, 6Ch
.data:0000000140003020                 db 56h, 0F4h, 0EAh, 65h, 7Ah, 0AEh, 8, 0BAh, 78h, 25h
.data:0000000140003020                 db 2Eh, 1Ch, 0A6h, 0B4h, 0C6h, 0E8h, 0DDh, 74h, 1Fh, 4Bh
.data:0000000140003020                 db 0BDh, 8Bh, 8Ah, 70h, 3Eh, 0B5h, 66h, 48h, 3, 0F6h, 0Eh
.data:0000000140003020                 db 61h, 35h, 57h, 0B9h, 86h, 0C1h, 1Dh, 9Eh, 0E1h, 0F8h
.data:0000000140003020                 db 98h, 11h, 69h, 0D9h, 8Eh, 94h, 9Bh, 1Eh, 87h, 0E9h
.data:0000000140003020                 db 0CEh, 55h, 28h, 0DFh, 8Ch, 0A1h, 89h, 0Dh, 0BFh, 0E6h
.data:0000000140003020                 db 42h, 68h, 41h, 99h, 2Dh, 0Fh, 0B0h, 54h, 0BBh, 16h
```

```
.data:0000000140003000 byte_140003000  db 0, 4Dh, 51h, 50h, 0EFh, 0FBh, 0C3h, 0CFh, 92h, 45h
.data:0000000140003000                                         ; DATA XREF: sub_140001000+40↑o
.data:0000000140003000                 db 4Dh, 0CFh, 0F5h, 4, 40h, 50h, 43h, 63h, 0Eh dup(0)
```

a[i] chính là index của byte_3000[i] trong dãy byte_3020

```c
#include<stdio.h>

int main() {
    unsigned char a1[18];
    unsigned char bytes_3020[256] = {
    0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
    0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
    0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
    0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
    0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
    0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
    0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
    0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
    0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
    0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
    0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
    0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
    0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
    0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
    0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
    0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16 
    };
    unsigned char bytes_3000[18] = {
        0x00, 0x4D, 0x51, 0x50, 0xEF, 0xFB, 0xC3, 0xCF, 0x92, 0x45, 
        0x4D, 0xCF, 0xF5, 0x4, 0x40, 0x50, 0x43, 0x63
    }; 
    for ( int i=0; i< 17; i++) {
        for (int j = 0; j < 256; j++) {
            if (bytes_3020[j] ==  bytes_3000[i]) {
                a1[i] = j;
                break;
            }
        }
    }
    printf("%s", a1);
}
//output: Replac3_the_w0rld
```

## Chall - 7

```c
__int64 __fastcall sub_140001000(__int64 a1)
{
  int i; // [rsp+0h] [rbp-18h]

  for ( i = 0; (unsigned __int64)i < 0x1F; ++i )
  {
    if ( (i ^ (unsigned __int8)__ROL1__(*(_BYTE *)(a1 + i), i & 7)) != byte_140003000[i] )
      return 0i64;
  }
  return 1i64;
}
```

```
.data:0000000140003000 byte_140003000  db 52h, 0DFh, 0B3h, 60h, 0F1h, 8Bh, 1Ch, 0B5h, 57h, 0D1h
.data:0000000140003000                                         ; DATA XREF: sub_140001000+50↑o
.data:0000000140003000                 db 9Fh, 38h, 4Bh, 29h, 0D9h, 26h, 7Fh, 0C9h, 0A3h, 0E9h
.data:0000000140003000                 db 53h, 18h, 4Fh, 0B8h, 6Ah, 0CBh, 87h, 58h, 5Bh, 39h
.data:0000000140003000                 db 1Eh, 0
```

`__ROL1__(*(_BYTE *)(a1 + i), i & 7)` là phép xoay trái bit trên a1 với vị trí i&7

ví dụ a1[i] = 0b11100110 , thực hiện __ROL1_(a1[i], 1) thì sẽ thành 0b01110011

Vậy nếu muốn tìm được a1[i] thì lấy i&7 số bit bên phải chuyển về đầu là được.

```c
#include<stdio.h>
#include <math.h>
unsigned char rev_rol1(int pos, unsigned char tmp) {
    return (tmp << (8-pos) | tmp >> pos);
}
int main() { 
    unsigned char a1[31];
    unsigned char byte_140003000[] = {
        0x52, 0xDF, 0xB3, 0x60, 0xF1, 0x8B, 0x1C, 0xB5, 0x57, 0xD1,
        0x9F, 0x38, 0x4B, 0x29, 0xD9, 0x26, 0x7F, 0xC9, 0xA3, 0xE9,
        0x53, 0x18, 0x4F, 0xB8, 0x6A, 0xCB, 0x87, 0x58, 0x5B, 0x39, 0x1E, 0x0
    };
    unsigned char temp[31];
    for ( int i = 0; (unsigned __int64)i < 31; ++i )
    {
        temp[i] = byte_140003000[i] ^ i;
    }
    for (int i = 0; i < 31; i++) {
        int pos=i&7;
        a1[i]=rev_rol1(pos, temp[i]);
    }
	   printf("%s", a1);
}
//output: Roll_the_left!_Roll_the_right!
```

## Chall - 8

```c
__int64 __fastcall sub_140001000(__int64 a1)
{
  int i; // [rsp+0h] [rbp-18h]

  for ( i = 0; (unsigned __int64)i < 0x15; ++i )
  {
    if ( (unsigned __int8)(-5 * *(_BYTE *)(a1 + i)) != byte_140003000[i] )
      return 0i64;
  }
  return 1i64;
}
```

```c
#include<stdio.h>

unsigned char bf(char byte, unsigned char o ) {
    for (int i=0; i<256; i++ ) {
        if ((char)(i*o & 0xff )== byte)
            return i;
    }
}
int main() {
    // -5 là 0xfb = 251 
    char byte_140003000[] = {
    0xAC, 0xF3, 0x0C, 0x25, 0xA3, 0x10, 0xB7, 0x25,
    0x16, 0xC6, 0xB7, 0xBC, 0x07, 0x25, 0x02, 0xD5,
    0xC6, 0x11, 0x07, 0xC5
    };    
    unsigned char o = 0xfb;
    unsigned char a1[21];
    for (int i = 0; i < 21; i++) {
        a1[i] = bf(byte_140003000[i], o);
    }
		printf("%s", a1);
}
//output: Did_y0u_brute_force?
```

## Chall - 9

```c
_BOOL8 __fastcall sub_140001000(const char *a1)
{
  int i; // [rsp+20h] [rbp-18h]
  int v3; // [rsp+24h] [rbp-14h]

  v3 = strlen(a1);
//nếu không là bội số của 8 thì exit
  if ( (v3 + 1) % 8 )
    return 0i64;
  for ( i = 0; i < v3 + 1; i += 8 )
	//truyền vị trí của a1[i]
    sub_1400010A0(&a1[i]);
  return memcmp(a1, &unk_140004000, 0x19ui64) == 0;
}
```

Hàm sub_140010A0 sẽ xử lí a1[i]

Sau đó so sánh a1 sau khi đã xử lí vớ &unk_…. độ dài là 0x19 byte. Để in ra correct ⇒ phải return true ⇒ memcmp() == 0

```c
__int64 __fastcall sub_1400010A0(unsigned __int8 *a1)
{
  __int64 result; // rax
  unsigned __int8 v2; // [rsp+0h] [rbp-48h]
  int j; // [rsp+4h] [rbp-44h]
  int i; // [rsp+8h] [rbp-40h]
  char v5[16]; // [rsp+10h] [rbp-38h] BYREF

  strcpy(v5, "I_am_KEY");
  result = *a1;
  v2 = *a1;
  for ( i = 0; i < 16; ++i )
  {
    for ( j = 0; j < 8; ++j )
    {
      v2 = __ROR1__(a1[((_BYTE)j + 1) & 7] + byte_140004020[(unsigned __int8)v5[j] ^ v2], 5);
      a1[((_BYTE)j + 1) & 7] = v2;
    }
    result = (unsigned int)(i + 1);
  }
  return result;
}
```

```c
.data:0000000140004000 unk_140004000   db  7Eh ; ~             ; DATA XREF: sub_140001000+71↑o
.data:0000000140004001                 db  7Dh ; }
.data:0000000140004002                 db  9Ah
.data:0000000140004003                 db  8Bh
.data:0000000140004004                 db  25h ; %
.data:0000000140004005                 db  2Dh ; -
.data:0000000140004006                 db 0D5h
.data:0000000140004007                 db  3Dh ; =
.data:0000000140004008                 db    3
.data:0000000140004009                 db  2Bh ; +
.data:000000014000400A                 db  38h ; 8
.data:000000014000400B                 db  98h
.data:000000014000400C                 db  27h ; '
.data:000000014000400D                 db  9Fh
.data:000000014000400E                 db  4Fh ; O
.data:000000014000400F                 db 0BCh
.data:0000000140004010                 db  2Ah ; *
.data:0000000140004011                 db  79h ; y
.data:0000000140004012                 db    0
.data:0000000140004013                 db  7Dh ; }
.data:0000000140004014                 db 0C4h
.data:0000000140004015                 db  2Ah ; *
.data:0000000140004016                 db  4Fh ; O
.data:0000000140004017                 db  58h ; X
.data:0000000140004018                 db    0
.data:0000000140004019                 db    0
```

```c
#include<stdio.h>
unsigned char rev_rotate_right_1(unsigned char value) {
    return (value >> 3) | (value << 5);
}

// v2 = __ROR1__(a1[((_BYTE)j + 1) & 7] + byte_140004020[(unsigned __int8)v5[j] ^ v2], 5);
int main() {
    unsigned char key[8] = "I_am_KEY";
    unsigned char unk[] = {
        0x7E, 0x7D, 0x9A, 0x8B, 0x25, 0x2D, 0xD5, 0x3D,
        0x03, 0x2B, 0x38, 0x98, 0x27, 0x9F, 0x4F, 0xBC,
        0x2A, 0x79, 0x00, 0x7D, 0xC4, 0x2A, 0x4F, 0x58
    };
    unsigned char bytes[] = {
        0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67,
        0x2B, 0xFE, 0xD7, 0xAB, 0x76, 0xCA, 0x82, 0xC9, 0x7D, 0xFA,
        0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72,
        0xC0, 0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34,
        0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15, 0x04, 0xC7, 0x23,
        0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27,
        0xB2, 0x75, 0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52,
        0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84, 0x53, 0xD1, 0x00,
        0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A,
        0x4C, 0x58, 0xCF, 0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33,
        0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8, 0x51, 0xA3,
        0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21,
        0x10, 0xFF, 0xF3, 0xD2, 0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97,
        0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
        0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE,
        0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB, 0xE0, 0x32, 0x3A, 0x0A,
        0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4,
        0x79, 0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C,
        0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08, 0xBA, 0x78, 0x25,
        0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B,
        0xBD, 0x8B, 0x8A, 0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E,
        0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E, 0xE1, 0xF8,
        0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9,
        0xCE, 0x55, 0x28, 0xDF, 0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6,
        0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
    };
    unsigned char a1[24];
    unsigned char block[8];
    // unsigned char temp[8];
    for (int i=0; i< 24 ; i+=8) {
        for (int j = 0; j<8; j++) {
            block[j]=unk[j+i];
        }
        for (int j=0; j<16; j++) {
            for (int index=7; index >= 0; index--){
                block[(index+1)&7] = rev_rotate_right_1(block[(index+1)&7])  - bytes[key[index] ^ block[index]];
            }
        }
        for (int j=0; j<8; j++) {
            a1[i + j] = block[j];
        }
    }
    printf("%s", a1);
}
//output: Reverse__your__brain_;)
```

## BasicCrackMe

```c
int __cdecl main(int argc, const char **argv, const char **envp)
{
  sub_4020F0();
  dword_4054F4 = strlen(Str);
  sub_401690();
  sub_401500((int)&unk_405900);
  sub_401608();
  sub_4016F8();
  return 0;
}
```

Flow chương trình là đọc file flag và lưu vào unk_405900.
Sau đó là hàm Encrypt nội dung đọc từ file flag, và cuối cùng là ghi vào file tmp.enc với dưới dạng hex theo fomat "0X{hex}"
Sau đây là srcipt xử lý chuỗi hex từ file tmp.enc để tìm nội dung file flag.

```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
    char tmp[] = "299B 244D 3594 2759 45A 244B 458 28AD 2FDE 2FE5 2714 44D 271B 244C 38B3 46B 459 2731 2EC7 2B51 2FF7 38C5 458 36D7 2467 3250 293E 2496 2E34 27AE 45C 2A16 24A0 3630 27B8 426 24A8 42A 2956 3000 3002 26FE 434 2702 24B8 3912 47C 43E 27D4 2F38 2BDE 3018 3920 44A 3746 24CE 32C2 297C 24D4 2E72 27EC 49A 2A54 24DE 366E 27F6 464 24E6 468 2994 303E 3040 273C 472 2740 24F6 3950 4BA 47C 2812 2F76";
    int i;
    unsigned int flag[81];
    unsigned char Str[] = "have a good day! enjoy wargame!"; 
    char *token;
    char *delimiter = " "; 
		int len = sizeof(Str);
    token = strtok(tmp, delimiter);
    i = 0;
    while (token != NULL && i < len) {
        // Chuyển đổi hexa thành số nguyên và lưu vào mảng flag
        flag[i] = strtoul(token, NULL, 16);
        i++;

        token = strtok(NULL, delimiter);
    }

    unsigned int v4;
    unsigned int v3;
    unsigned int v1;
    

    for (i = 0; i < len; i++) {
        v4 = flag[i] - i;
        //printf("%c",Str[i % len_] );
        v3 = v4 + Str[i % len];
        v1 = (Str[i % len] * Str[i % len] + i) ^ v3;
        flag[i] = v1;
       
    }
    for (i = 0; i< len; i++) {
        printf("%c", flag[i]);
    }
    
    return 0;
}
// code hơi dài, có thể tinh chỉnh để gọn hơn. (nhưng mà mình lười quá)
// output:Congratulation!-you_got_itΦ
```