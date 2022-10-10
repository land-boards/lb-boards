import circuitpython_base64 as base64

bytes_to_encode = b"Aladdin:open sesame"
print(repr(bytes_to_encode))

base64_string = base64.encodebytes(bytes_to_encode)
print(repr(base64_string))

decoded_bytes = base64.decodebytes(base64_string)
print(repr(decoded_bytes))
