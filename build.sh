#!/bin/bash
# ================================================
# 🚀 TOX-HUD-和平 — Automated Xcode Build Script
# Builds .tipa for TrollStore & .ipa-style archive
# Compatible with GitHub Actions + macOS (no sign)
# ================================================

set -e  # توقف عند أول خطأ

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    exit 1
fi

VERSION=$1
VERSION=${VERSION#v}  # Remove leading "v" if present

PROJECT_NAME="TOX-HUD-和平"
SCHEME_NAME="TOX-HUD-和平"

WORK_DIR="$(pwd)"
SUPPORTS_DIR="${WORK_DIR}/supports"
ARCHIVE_PATH="${WORK_DIR}/${PROJECT_NAME}.xcarchive"
PRODUCTS_DIR="${ARCHIVE_PATH}/Products"
APP_DIR="${PRODUCTS_DIR}/Applications"

# ================================================
# 🧱 Clean + Build + Archive using Xcode
# ================================================
echo "🧱 Building ${PROJECT_NAME} (scheme: ${SCHEME_NAME}, version: ${VERSION})..."

xcodebuild clean build archive \
  -scheme "$SCHEME_NAME" \
  -project "${PROJECT_NAME}.xcodeproj" \
  -sdk iphoneos \
  -destination 'generic/platform=iOS' \
  -archivePath "${ARCHIVE_PATH}" \
  CODE_SIGNING_ALLOWED=NO | xcpretty || true

# ================================================
# 🧩 Validate build output
# ================================================
if [ ! -d "${APP_DIR}" ]; then
    echo "❌ Build failed: Applications folder not found at ${APP_DIR}"
    ls -R "${PRODUCTS_DIR}" || true
    exit 1
fi

echo "📦 Preparing app bundle..."
cp "${SUPPORTS_DIR}/entitlements.plist" "${PRODUCTS_DIR}" || echo "⚠️ Missing entitlements.plist (ignored)"
cp "${SUPPORTS_DIR}/Sandbox-Info.plist" "${PRODUCTS_DIR}" || echo "⚠️ Missing Sandbox-Info.plist (ignored)"

cd "${APP_DIR}" || exit 1
APP_NAME=$(ls | grep ".app$" | head -n 1)
if [ -z "$APP_NAME" ]; then
    echo "❌ No .app found inside Applications folder."
    exit 1
fi

echo "🔧 Found app: $APP_NAME"
codesign --remove-signature "$APP_NAME" || true
cd "${PRODUCTS_DIR}" || exit 1

# ================================================
# 🔐 Re-sign using ldid (auto-detect path)
# ================================================
LDID_PATH=$(command -v ldid)
if [ -z "$LDID_PATH" ]; then
    echo "⚠️ ldid not found in PATH!"
    echo "👉 Install it via: brew install ldid"
    exit 1
fi

echo "🔏 Signing app using: $LDID_PATH"
mv Applications Payload
"$LDID_PATH" -Sentitlements.plist "Payload/${APP_NAME}" || echo "⚠️ Skipped ldid signing"

# ================================================
# 📦 Create .tipa archive
# ================================================
echo "📦 Creating .tipa package..."
cd "${PRODUCTS_DIR}" || exit 1
zip -qr "${PROJECT_NAME}.tipa" Payload

# ================================================
# 📂 Move final output to /packages
# ================================================
cd "${WORK_DIR}" || exit 1
mkdir -p packages
mv "${PRODUCTS_DIR}/${PROJECT_NAME}.tipa" "packages/${PROJECT_NAME}_v${VERSION}.tipa" || {
    echo "❌ Failed to move .tipa file!"
    exit 1
}

echo "✅ Build finished successfully!"
echo "📦 Output → packages/${PROJECT_NAME}_v${VERSION}.tipa"
