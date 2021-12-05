import qrcode 

qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_L,
    box_size=30,
    border=5
    )
qr.add_binary_data_file("test_log.txt")
qr.make(fit=True)
img = qr.make_image(fill_color="black", back_color="white")
img.save('path/to/save/image.png')
