#!/usr/bin/env bash

cd "$(dirname "$0")"

xcodebuild archive \
-scheme CppUUIDv4 \
-destination "generic/platform=iOS" \
-archivePath ./Build/CppUUIDv4-iOS \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme CppUUIDv4 \
-destination "generic/platform=iOS Simulator" \
-archivePath ./Build/CppUUIDv4-Sim \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-scheme CppUUIDv4 \
-destination "generic/platform=OS X" \
-archivePath ./Build/CppUUIDv4-OSX \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

cd ./Build

xcodebuild -create-xcframework \
-framework ./CppUUIDv4-iOS.xcarchive/Products/Library/Frameworks/CppUUIDv4.framework \
-framework ./CppUUIDv4-Sim.xcarchive/Products/Library/Frameworks/CppUUIDv4.framework \
-framework ./CppUUIDv4-OSX.xcarchive/Products/Library/Frameworks/CppUUIDv4.framework \
-output ./CppUUIDv4.xcframework