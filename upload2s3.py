import tinys3
TINYS3_PARAMS = {"access_key":"PIFF","secret_key":"POOF",'tls':True}
S3_BUCKET = 'resin-raspi-builds'
filenames = ['OpenCV-3.1.0-1027-g8cdd91c-armv7l.sh','OpenCV-3.1.0-1027-g8cdd91c-armv7l.tar.Z','OpenCV-3.1.0-1027-g8cdd91c-armv7l.tar.gz']
pool = tinys3.Pool(**TINYS3_PARAMS)
conns = []
for filename in filenames:
        print 'uploading'+filename
        conns.append(pool.upload(filename,open(filename),S3_BUCKET))
for conn in conns:
        print conn.result()
