#!/bin/sh
# ================================================
# 🚀 TOX-HUD-和平 — Automated Xcode Build Script
# Builds .tipa for TrollStore & .ipa-style archive
# Compatible with GitHub Actions + macOS (no sign)
# ================================================

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1
VERSION=${VERSION#v}  # Remove leading "v" if present

PROJECT_NAME="TOX-HUD-和平"
SCHEME_NAME="TOX-HUD-和平"

# ================================================
# 🧱 Clean + Build + Archive using Xcode
# ================================================
echo "🧱 Building ${PROJECT_NAME} (version: ${VERSION})..."

xcodebuild clean build archive \
  -scheme "$SCHEME_NAME" \
  -project "${PROJECT_NAME}.xcodeproj" \
  -sdk iphoneos \
  -destination 'generic/platform=iOS' \
  -archivePath "${PROJECT_NAME}" \
  CODE_SIGNING_ALLOWED=NO | xcpretty

# ================================================
# 🧩 Prepare Payload and repackage
# ================================================
echo "📦 Preparing app bundle..."

if [ ! -d "${PROJECT_NAME}.xcarchive/Products/Applications" ]; then
    echo "❌ Build failed: Applications folder not found!"
    exit 1
fi

cp supports/entitlements.plist "${PROJECT_NAME}.xcarchive/Products" || true
cd "${PROJECT_NAME}.xcarchive/Products/Applications" || exit 1

APP_NAME=$(ls | grep ".app" | head -n 1)
if [ -z "$APP_NAME" ]; then
    echo "❌ No .app found in archive."
    exit 1
fi

echo "🔧 Found app: $APP_NAME"

# Remove existing signature
codesign --remove-signature "$APP_NAME" || true
cd -

# ================================================
# 🔐 Re-sign using ldid (dynamic path fix)
# ================================================
LDID_PATH=$(command -v ldid)
if [ -z "$LDID_PATH" ]; then
    echo "⚠️ ldid not found in PATH!"
    exit 1
fi

cd "${PROJECT_NAME}.xcarchive/Products" || exit 1
mv Applications Payload

echo "🔏 Signing using ldid at: $LDID_PATH"
"$LDID_PATH" -Sentitlements.plist Payload/"$APP_NAME"

# ================================================
# 🧱 Package .tipa
# ================================================
echo "📦 Creating .tipa package..."
zip -qr "${PROJECT_NAME}.tipa" Payload

# ================================================
# 📂 Move output to packages directory
# ================================================
cd -
mkdir -p packages
mv "${PROJECT_NAME}.xcarchive/Products/${PROJECT_NAME}.tipa" "packages/${PROJECT_NAME}_v${VERSION}.tipa"

echo "✅ Build finished: packages/${PROJECT_NAME}_v${VERSION}.tipa"
