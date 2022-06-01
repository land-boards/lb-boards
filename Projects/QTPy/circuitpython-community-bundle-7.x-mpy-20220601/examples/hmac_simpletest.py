import circuitpython_hmac as hmac

secret = b"secret"
msg = "message"

key = hmac.new(secret, msg=msg).digest()
