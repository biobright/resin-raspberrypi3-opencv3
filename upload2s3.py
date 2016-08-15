import tinys3
import glob
TINYS3_PARAMS = {"access_key":"AKIAJHMM73Y7JCW23DPQ","secret_key":"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",'tls':True}
S3_BUCKET = 'resin-raspi-builds'
BUILD_PATH = '/tmp/opencv/build/'
filenames = glob.glob(BUILD_PATH+'*-armv7l.sh') + glob.glob(BUILD_PATH+'*-armv7l.tar.Z') + glob.glob(BUILD_PATH+'*-armv7l.tar.gz')
#filenames = ['OpenCV-3.1.0-1027-g8cdd91c-armv7l.sh','OpenCV-3.1.0-1027-g8cdd91c-armv7l.tar.Z','OpenCV-3.1.0-1027-g8cdd91c-armv7l.tar.gz']
pool = tinys3.Pool(**TINYS3_PARAMS)
conns = []
for filename in filenames:
        print 'uploading '+filename
        conns.append(pool.upload(filename,open(filename),S3_BUCKET))
for conn in conns:
        print conn.result()
