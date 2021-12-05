# Encode-QR-code-using-VHDL
Use VHDL to generate QR which contain 6 digits
## Dependencies and Requiments
- Windows.
- QuatusII v13. or later.
- Model SIM.
- Qrcode lib.
## Instructions
- From _src_ run top_entity.vhd on QuatusII to generate the text (_text_log.txt_) file which contain 108 bits.
- Run _..._tb.vhd_ on Model SIM to watch the simulation, respectively.
- Run _drawQRimage.py_ with _text_log.txt_ as the input and get the QR code image.
## Reference
- https://www.thonky.com/qr-code-tutorial/
