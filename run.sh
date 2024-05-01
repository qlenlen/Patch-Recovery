chmod a+x script1.sh
chmod a+x magiskboot
./script1.sh || true

chmod a+x script2.sh
./script2.sh || true
python3 avbtool extract_public_key --key phh.pem --output phh.pub.bin
python3 avbtool add_hash_footer --partition_name recovery --partition_size $(wc -c recovery.img |cut -f 1 -d ' ') --image recovery-patched.img --key phh.pem --algorithm SHA256_RSA4096
mkdir output && cd output
mv ../recovery-patched.img recovery.img
tar cvf fastbootd-recovery.tar recovery.img
md5sum -t fastbootd-recovery.tar >> fastbootd-recovery.tar
mv fastbootd-recovery.tar fastbootd-recovery.tar.md5
