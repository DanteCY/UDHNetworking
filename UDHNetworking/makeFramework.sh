#!/bin/bash

#暂时放到跟工程文件同名的目录下使用
#workspace 编译的话第一个传workspace名字。第二个传scheme
#target的话就传一个target就行了
#path=`cd $(dirname $0);pwd -P`
count=$#
#file  target  isPace
if [ ${count} -gt 2 ]; then
echo "count error:"+${count}
exit
fi
path=`cd $(dirname $0);pwd -P`

echo "path:"${path}

# framework 的名字
FrameworkName=$1
SCHEME_NAME=$2
Product_Dir="Products"
INSTALL_DIR=${path}/${FrameworkName}".framework";#最后出包的地方


Build_Path=${path}/"Build";
if [ ${SCHEME_NAME} ]; then
    Build_Path="/Users/hcy/Library/Developer/Xcode/DerivedData/Build/Products/";#暂时自用
    rm -rf ${Build_Path};#清除上一次的build
fi

DEVICE_DIR="${Build_Path}/Release-iphoneos/${FrameworkName}.framework";
SIMULATOR_DIR="${Build_Path}/Release-iphonesimulator/${FrameworkName}.framework";
xcodebuild clean;
#workspace build
if [ ${SCHEME_NAME} ]; then
    echo 'build for workspace';
    #pao runscript 报错说有2个build同时再跑。就很奇怪。。就这样吧。自己用也够
    xcodebuild -workspace ${FrameworkName}.xcworkspace -configuration "Release" -scheme ${SCHEME_NAME} -sdk iphoneos;
    xcodebuild -workspace ${FrameworkName}.xcworkspace -configuration "Release" -scheme ${SCHEME_NAME} -sdk iphonesimulator;
else
    echo 'isTarget'
    xcodebuild -configuration "Release" -target ${FrameworkName} -sdk iphoneos;
    xcodebuild -configuration "Release" -target ${FrameworkName} -sdk iphonesimulator;
fi
echo "copy "${DEVICE_DIR}+" to "${INSTALL_DIR}

cp -R ${DEVICE_DIR} ${INSTALL_DIR}

# # 合并
lipo -create ${DEVICE_DIR}/${FrameworkName} ${SIMULATOR_DIR}/${FrameworkName} -output ${INSTALL_DIR}/${FrameworkName};
open ${INSTALL_DIR}