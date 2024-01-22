import HashTools
import random
def test_attack():
    algorithms = [
        "md5", "sha1", "sha256", "sha512"
    ]

    print("> Implementation test...")
    for alg in algorithms:
        # setup context
        length = random.randint(0, 1024)           
        secret = random.urandom(length)            # idk ¯\_(ツ)_/¯
        original_data = b"admin=False"
        sig = HashTools.new(algorithm=alg, raw=secret + original_data).hexdigest()
        
        # attack
        append_data = b"admin=True;"
        magic = HashTools.new(alg)
        new_data, new_sig = magic.extension(
            secret_length=length, original_data=original_data,
            append_data=append_data, signature=sig
        )

        if new_sig != HashTools.new(algorithm=alg, raw=secret + new_data).hexdigest():
            print(f"[!] Our attack didn't work with {alg.ljust(6)}")
            exit(1)
        else:
            print(f"[+] {alg.ljust(6)} passed")

    print("> All test passed!!!")